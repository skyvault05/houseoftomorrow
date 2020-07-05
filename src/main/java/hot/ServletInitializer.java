package hot;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import hot.config.sitemesh.CustomSiteMeshFilter;

@Configuration
public class ServletInitializer extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(HouseoftomorrowApplication.class);
	}
	
//	@Bean
//	public FilterRegistrationBean securityFilterChain(@Qualifier(AbstractSecurityWebApplicationInitializer.DEFAULT_FILTER_NAME) Filter securityFilter) {
//	    FilterRegistrationBean registration = new FilterRegistrationBean(securityFilter);
//	    registration.setOrder(Integer.MAX_VALUE - 1);
//	    registration.setName(AbstractSecurityWebApplicationInitializer.DEFAULT_FILTER_NAME);
//	    return registration;
//	}
	
	@Bean
	  public FilterRegistrationBean siteMeshFilter() {
	      FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();
	      filterRegistrationBean.setFilter(new CustomSiteMeshFilter()); // adding sitemesh filter ??
	      filterRegistrationBean.addUrlPatterns("/*");
	      filterRegistrationBean.setOrder(999);
	      return filterRegistrationBean;
	  }

}


