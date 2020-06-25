package hot.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import hot.member.domain.Member;
import hot.member.repository.MemberRepository;


@Component
public class MemberAuthenticationProvider implements AuthenticationProvider {
	@Autowired
	private UserDetailsService userDetailsService;
	@Autowired
	private MemberRepository memberRep;
	
	@Autowired
	private PasswordEncoder encoder;
	
	private final String[] roles = {"ROLE_MEMBER", "ROLE_CONSTRUCTOR", "ROLE_ADMIN"};
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		System.out.println(authentication.getName());
		Member member = memberRep.findByMemberId(authentication.getName());	//찾아봐야함... 입력할 땐 email이라서..
		String username = (String) authentication.getPrincipal();
		String password = (String) authentication.getCredentials();
		
		CustomUser customUser = (CustomUser) userDetailsService.loadUserByUsername(username);
		
		if(customUser == null) {
			throw new UsernameNotFoundException("정보 확인 바람"); //아이디
		}
		
		if(!encoder.matches(password, customUser.getPassword())) {
			throw new UsernameNotFoundException("정보 확인 바람");  //비번
		}
		
		if(!customUser.isEnabled()) {
            throw new BadCredentialsException(username);
		}
		
		customUser.setPassword(null);
		
		return new UsernamePasswordAuthenticationToken(customUser, null, customUser.getAuthorities());
		
		
//		System.out.println(authentication.getName());
//		Member member = memberRep.findByMemberId(authentication.getName());	//찾아봐야함... 입력할 땐 email이라서..
//		
//		if(member == null) {
//			throw new UsernameNotFoundException("정보 확인 바람"); //아이디
//		}
//		
//		if(!encoder.matches(authentication.getCredentials().toString(), member.getMemberPwd())) {
//			throw new UsernameNotFoundException("정보 확인 바람");  //비번
//		}
//		List<SimpleGrantedAuthority> authList = new ArrayList<>();
//		
//		//멤버가 1, 시공사가 2, 관리자가 3이라는 가정하에
//		for(long i = member.getMemberRole().getMemberRoleNo(); i > 0; i--) {
//			authList.add(new SimpleGrantedAuthority(roles[(int)(i - 1)]));
//		}
//		System.out.println(authList);
//		
//		return new UsernamePasswordAuthenticationToken(member, null, authList);
//		return null;
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}

}
