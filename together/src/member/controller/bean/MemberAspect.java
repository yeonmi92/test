package member.controller.bean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Aspect
public class MemberAspect {

	@Around("execution(* member*(..))")
	public Object around(ProceedingJoinPoint j) throws Throwable{
		
		ServletRequestAttributes sa = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		HttpServletRequest request = sa.getRequest();
		HttpSession session = request.getSession();
		if(session.getAttribute("memId")==null) {
			return "member/login.tiles";
		}
		
		
		return j.proceed();
	}
}
