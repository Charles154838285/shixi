package com.framework.commons.controller;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.*;

public class BaseController {
	@Autowired
	protected HttpServletRequest request;
	@Autowired
	protected HttpServletResponse response;
	@Autowired
	protected HttpSession session;
	@Autowired
	protected ServletContext application;

	private static final String UPLOAD_PATH = "/attr/";

	protected static ModelAndView forward(String url){
		ModelAndView mav =new  ModelAndView(url);
		return mav;
	}
	protected static ModelAndView redirect(String url){
		ModelAndView mav =new  ModelAndView("redirect:"+url);
		return mav;
	}
	/**
	 * 获取根路径：http://localhost:8080/route
	 * @param httpRequest
	 * @return String
	 */
	protected String getContext(HttpServletRequest httpRequest) {
		String url = null;
		if (null != httpRequest) {
			url = new StringBuilder().append(httpRequest.getScheme()).append("://")
					.append(httpRequest.getServerName()).append(":")
					.append(httpRequest.getServerPort()).append("/")
					.append(httpRequest.getSession().getServletContext().getServletContextName())
					.toString();
		}
		return url;
	}
	public Map<String,String> uploadFile(MultipartFile uploadFile){
		List<Map<String,String>> tempList = uploadFiles(new MultipartFile[]{uploadFile});
		return tempList.get(0);
	}
	public List<Map<String,String>> uploadFiles(MultipartFile[] fileArray){
		List<Map<String,String>> fileList = new ArrayList<>();
		String path = application.getRealPath(UPLOAD_PATH);
		File folder = new File(path);
		if(!folder.exists()){
			folder.mkdirs();
		}
		if(fileArray!=null){
			for (MultipartFile uploadFile : fileArray) {
				String fileName = uploadFile.getOriginalFilename();
				String ext = FilenameUtils.getExtension(fileName);
				String newFileName = UUID.randomUUID().toString().replaceAll("-","")+"."+ext;
				try {
					uploadFile.transferTo(new File(path+"/"+newFileName));
				} catch (IOException e) {
					e.printStackTrace();
				}
				//保存数据
				Map<String,String> map = new HashMap<>();
				//map.put("服务器端的文件名称","上传文件的名称");
				map.put(newFileName,fileName);
				fileList.add(map);
			}
		}
		return fileList;
	}
}
