package com.briup.exception;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * 异常处理类
 *
 */
public class MyExceptionResolver implements HandlerExceptionResolver{  
    public ModelAndView resolveException(HttpServletRequest request,  
            HttpServletResponse response, Object handler, Exception ex) {  
    	MyException exception=null;  
        if (ex instanceof MyException) exception=(MyException)ex;  
        else {
        	ex.printStackTrace();
        	exception=MyException.getException(501); 
        }
        ModelAndView mv=new ModelAndView();  
        mv.addObject("status", exception.getErrcode());
        mv.addObject("errmsg", exception.getMessage());  
        mv.setViewName("error");  
        return mv;  
    }  
}
