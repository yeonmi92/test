package admin.controller.bean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Aspect
public class AdminAspect {
	
	@Around("execution(* admin*(..))")
	public Object around(ProceedingJoinPoint j) throws Throwable{
		
		ServletRequestAttributes sa = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		HttpServletRequest request = sa.getRequest();
		HttpSession session = request.getSession();
		if(session.getAttribute("memId")==null||!session.getAttribute("memId").equals("admin")) {
			// 메인으로 보내주기
			return "member/login.tiles";
		}
		
		
		return j.proceed();
	}
}
