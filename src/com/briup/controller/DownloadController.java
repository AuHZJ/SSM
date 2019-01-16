package com.briup.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("download")
@Controller
public class DownloadController {
	@RequestMapping("file1")
	public ResponseEntity<byte[]> test(String fileName,HttpServletRequest request) throws IOException {
		//获得下载文件所在路径 可以指向系统中的任意一个有权访问的路径
		String downLoadPath = request.getServletContext().getRealPath("/download");

		//创建要下载的文件对象
		File file = new File(downLoadPath,fileName);

		//处理一下要下载的文件名字,解决中文乱码
		String downFileName = new String(fileName.getBytes("UTF-8"), "iso-8859-1");

		//创建响应头信息的对象
		HttpHeaders headers = new HttpHeaders();
		//设置下载的响应头信息,通过浏览器响应正文的内容是用户要下载的,不用浏览器解析
		headers.setContentDispositionFormData("attachment", downFileName);
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		
		//通过响应内容、响应头信息、响应状态来构建一个响应对象并返回
		return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
	}

}
