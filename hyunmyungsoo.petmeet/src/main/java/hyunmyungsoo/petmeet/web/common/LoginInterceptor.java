package hyunmyungsoo.petmeet.web.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest request,
								HttpServletResponse response, Object handler) throws Exception{
		boolean isLogged = false;
		
		Object userId = request.getSession().getAttribute("userEmail");
		
		if(userId != null) isLogged = true;
		//                         절대주소로 쓰자
		else response.sendRedirect(request.getContextPath() + "/user/login"); 

		return isLogged;
	}
}
