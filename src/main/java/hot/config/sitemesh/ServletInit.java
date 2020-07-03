package hot.config.sitemesh;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ServletInit extends SpringBootServletInitializer {
  @Bean
  public FilterRegistrationBean siteMeshFilter() {
      FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();
      filterRegistrationBean.setFilter(new CustomSiteMeshFilter()); // adding sitemesh filter ??
      filterRegistrationBean.addUrlPatterns("/*");
      return filterRegistrationBean;
  }
}
