package com.briup.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.briup.bean.Administrator;
import com.briup.service.IAdmService;

/**
 * admin的相关方法
 * @author 26503
 *
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private IAdmService adminService;
	
	
	@RequestMapping("/login")
	@ResponseBody
	public HashMap<String, Object> login(Administrator administrator,HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("name", administrator.getAdmUserName());
		
		HashMap<String, Object> map = new HashMap<>();
		if(adminService.exist(administrator.getAdmUserName())) {
			System.out.println("账号正确！");
			if(adminService.checkAdm(administrator)) {
				System.out.println("密码正确！");
				map.put("status", 200);
			}else {
				System.out.println("密码错误！");
				map.put("status", 500);
			}
		}else {
			System.out.println("账号错误！");
			map.put("status", 500);
		}
		return map;
	}
	
	

}
