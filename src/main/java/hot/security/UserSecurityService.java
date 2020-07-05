package hot.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import hot.channel.domain.Channel;
import hot.channel.repository.ChannelRepository;
import hot.member.domain.Member;
import hot.member.repository.MemberRepository;

@Service
public class UserSecurityService implements UserDetailsService {
	@Autowired
	MemberRepository memberRep;
	@Autowired
	ChannelRepository channelRep;
	
	private final String[] roles = {"ROLE_MEMBER", "ROLE_CONSTRUCTOR", "ROLE_ADMIN"};
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Member member = memberRep.findByMemberId(username);
		
		if(member == null) {
			throw new UsernameNotFoundException(username + "is not found");
		}
		Integer memberNo = member.getMemberNo();
		Channel channel = channelRep.selectByMemberNo(memberNo);
		
		CustomUser customUser = new CustomUser();
		customUser.setUsername(member.getMemberId());
		customUser.setPassword(member.getMemberPwd());
		customUser.setMemberNo(member.getMemberNo());
		if(channel!=null) {
			Integer chNo = channel.getChNo();
			customUser.setChNo(chNo);
		}
        customUser.setEnabled(true);
        customUser.setAccountNonExpired(true);
        customUser.setAccountNonLocked(true);
        customUser.setCredentialsNonExpired(true);
        customUser.setAuthorities(getAuthorities(username, member));
		
		return customUser;
	}
	
	 public Collection<GrantedAuthority> getAuthorities(String username, Member member) {
		 List<GrantedAuthority> authList = new ArrayList<>();
		 for(long i = member.getMemberRole().getMemberRoleNo(); i > 0; i--) {
				authList.add(new SimpleGrantedAuthority(roles[(int)(i - 1)]));
			}
			System.out.println(authList);
			
	        List<GrantedAuthority> authorities = new ArrayList<>();
	        for (GrantedAuthority authority : authList) {
	            authorities.add(new SimpleGrantedAuthority(authority.getAuthority()));
	        }
	        return authorities;
	    }

}
