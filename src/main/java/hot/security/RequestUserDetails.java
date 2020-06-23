package hot.security;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class RequestUserDetails extends User {

	private static final long serialVersionUID = -6411988532329234916L;
    private Integer memberNo;

	public RequestUserDetails(String username, String password, Integer personId,
            Collection<? extends GrantedAuthority> authorities) {
        super(username, password, authorities);
        this.memberNo = personId;
    }
	
	public Integer getMemberNo() {
	    return memberNo;
	}
}
