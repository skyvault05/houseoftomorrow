package hot.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import lombok.extern.java.Log;

@Log
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	@Autowired
	private MemberAuthenticationProvider authenticationProvider;
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {		
		http.authorizeRequests()
		.antMatchers("/**/guest/**").permitAll()
		.antMatchers("/**/member/**").hasRole("MEMBER")
		//.antMatchers("/**/constructor/**").hasRole("CONSTRUCTOR")
		.antMatchers("/**/admin/**").hasRole("ADMIN")
		.anyRequest().permitAll();
		
		http.formLogin()
		.loginPage("/common/loginForm")
		.loginProcessingUrl("/login")
		.failureUrl("/common/loginForm") //실패하면 로그인으로
		.defaultSuccessUrl("/")	//성공했을때 기본적으로 index로
		.usernameParameter("email")
		.passwordParameter("password")
		.permitAll();
		
		http.logout()
		.invalidateHttpSession(true)
		.logoutUrl("/logout")
		.logoutSuccessUrl("/common/loginForm")	//로그아웃 성공시 로그인 페이지로
		.permitAll();
		
		http.csrf()
        .ignoringAntMatchers("/channel/constructor/**")
        .and();
		
		
		
		
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(authenticationProvider);
	}

}
