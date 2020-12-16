package hyunmyungsoo.petmeet.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import hyunmyungsoo.petmeet.web.LoginInterceptor;

@Configuration
@EnableWebMvc
@ComponentScan("hyunmyungsoo.petmeet")
@ImportResource("classpath:hyunmyungsoo/petmeet/config/app.xml")
public class AppConfig implements WebMvcConfigurer{
	
	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();		
	}
	
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		registry.jsp("/WEB-INF/view/",".jsp");
	}
	
	@Bean
	public LoginInterceptor loginInterceptor() {
		return new LoginInterceptor();
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(loginInterceptor())
						.addPathPatterns("/board/**")
						.addPathPatterns("/common/**")
						.addPathPatterns("/like/**")
						.addPathPatterns("/message/**")
						.addPathPatterns("/reservation/**")						
						.addPathPatterns("/sitter/insertSitter")
						.addPathPatterns("/sitter/upDelSitter")
						.addPathPatterns("/admin/**");
	}
}