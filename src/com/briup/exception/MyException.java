package com.briup.exception;

import java.util.HashMap;
import java.util.Map;
/**
 * 自定义异常类
 *
 */
public class MyException extends Exception {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//异常状态码
	private int errcode;
	//异常信息
	private String errmsg;
	private static final Map<Integer, MyException> exceptionMap=new HashMap<Integer, MyException>();
	private static final Map<Integer, String> errmsgMap=new HashMap<Integer, String>();
	
	static {	
		errmsgMap.put(401, "用户名已存在！");
		errmsgMap.put(402, "邮箱已注册！");
		errmsgMap.put(403, "参数格式错误！");
		errmsgMap.put(404, "用户名不存在！");
		errmsgMap.put(405, "邮箱未注册！");
		errmsgMap.put(406, "密码错误！");
		errmsgMap.put(407, "权限不足！");
		errmsgMap.put(408, "请求ID不存在！");
		errmsgMap.put(409, "验证码错误！");	
		errmsgMap.put(410, "验证码已失效！");	
		errmsgMap.put(411, "请求次数过多，请稍后重试！");		
		errmsgMap.put(412, "请重新登录！");	
		errmsgMap.put(501, "服务器繁忙，请稍后重试！");	
		exceptionMap.put(501, new MyException(501, getMessage(501)));
	}
	
	public MyException(int errcode, String msg){
		super(msg);
		this.errcode = errcode;
		this.errmsg = msg;
	}
	
	public int getErrcode(){
		return errcode;
	}
	
	@Override
	public String getMessage(){
		return errmsg;
	}
	
	public static String getMessage(int errcode) {
		if (errmsgMap.containsKey(errcode)) 
			return errmsgMap.get(errcode);
		else return errmsgMap.get(501);
	}
	
	public static MyException getException(int errcode) {
		if (exceptionMap.containsKey(errcode)) 
			return exceptionMap.get(errcode);
		else if (errmsgMap.containsKey(errcode)) {
			MyException ex = new MyException(errcode, getMessage(errcode));
			exceptionMap.put(errcode, ex);
			return ex;
		}
		else return exceptionMap.get(501);
	}
	
}
