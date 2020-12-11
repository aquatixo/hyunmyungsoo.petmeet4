package hyunmyungsoo.petmeet.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
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
	
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
//		registry.addViewController("/").setViewName("main");
//		registry.addViewController("/main").setViewName("main");
		registry.addViewController("/admin/main").setViewName("admin/main");
	}
	
	@Bean
	public LoginInterceptor loginInterceptor() {
		return new LoginInterceptor();
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(loginInterceptor())
						.addPathPatterns("/**")
						.excludePathPatterns("/user/**")
						.excludePathPatterns("/")
						.excludePathPatterns("/main")
						.excludePathPatterns("/manual/manualList")
						.excludePathPatterns("/sitter/sitterMain");
	}
}