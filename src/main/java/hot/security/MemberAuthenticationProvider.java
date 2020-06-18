package hot.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import hot.member.domain.Member;
import hot.member.repository.MemberRepository;


@Component
public class MemberAuthenticationProvider implements AuthenticationProvider {
	@Autowired
	private MemberRepository memberRep;
	
	private PasswordEncoder encoder = new BCryptPasswordEncoder();
	
	private final String[] roles = {"MEMBER", "CONSTRUCTOR", "ADMIN"};
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		Member member = memberRep.findById(Long.parseLong(authentication.getName())).orElse(null);	//찾아봐야함... 입력할 땐 email이라서..
		if(member == null) {
			throw new UsernameNotFoundException("정보 확인 바람"); //아이디
		}

		if(!encoder.matches(authentication.getCredentials().toString(), member.getMemberPwd())) {
			throw new UsernameNotFoundException("정보 확인 바람");  //비번
		}
		
		List<SimpleGrantedAuthority> authList = new ArrayList<>();
		
		//멤버가 1, 시공사가 2, 관리자가 3이라는 가정하에
		for(long i = member.getMemberRole().getMemberRoleNo(); i > 0; i--) {
			authList.add(new SimpleGrantedAuthority(roles[(int)(i - 1)]));
		}
		
		return new UsernamePasswordAuthenticationToken(member, null, authList);
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}

}
