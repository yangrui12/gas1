package com.aud.admin.controller;

import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.aud.pojo.InfoVo;
import com.aud.tool.ImportExcelUtil;




@Controller
@RequestMapping("/uploadExcel/*")  
public class UploadExcelControl {
	
	/**
	 * ������ͨ����ͳ��ʽform���ύ��ʽ����excel�ļ�
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping(value="upload.do",method={RequestMethod.GET,RequestMethod.POST})
	public  String  uploadExcel(HttpServletRequest request) throws Exception {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;  
		System.out.println("ͨ����ͳ��ʽform���ύ��ʽ����excel�ļ���");
		
		InputStream in =null;
		List<List<Object>> listob = null;
		MultipartFile file = multipartRequest.getFile("upfile");
		if(file.isEmpty()){
			throw new Exception("�ļ������ڣ�");
		}
 		in = file.getInputStream();
		listob = new ImportExcelUtil().getBankListByExcel(in,file.getOriginalFilename());
		in.close();
		
		//�ô��ɵ���service��Ӧ�����������ݱ��浽���ݿ��У���ֻ���������
		for (int i = 0; i < listob.size(); i++) {
			List<Object> lo = listob.get(i);
			InfoVo vo = new InfoVo();
			vo.setCode(String.valueOf(lo.get(0)));
			vo.setName(String.valueOf(lo.get(1)));
			vo.setDate(String.valueOf(lo.get(2)));
			vo.setMoney(String.valueOf(lo.get(3)));
			
			System.out.println("��ӡ��Ϣ-->����:"+vo.getCode()+"  ���ƣ�"+vo.getName()+"   ʱ�䣺"+vo.getDate()+"   �ʲ���"+vo.getMoney());
		}
		return "result";
	}
	
	/**
	 * ������ͨ�� jquery.form.js ����ṩ��ajax��ʽ�ϴ��ļ�
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value="ajaxUpload.do",method={RequestMethod.GET,RequestMethod.POST})
	public  void  ajaxUploadExcel(HttpServletRequest request,HttpServletResponse response) throws Exception {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;  
		
		System.out.println("ͨ�� jquery.form.js �ṩ��ajax��ʽ�ϴ��ļ���");
		
		InputStream in =null;
		List<List<Object>> listob = null;
		MultipartFile file = multipartRequest.getFile("upfile");
		if(file.isEmpty()){
			throw new Exception("�ļ������ڣ�");
		}
		
 		in = file.getInputStream();
		listob = new ImportExcelUtil().getBankListByExcel(in,file.getOriginalFilename());
		
		//�ô��ɵ���service��Ӧ�����������ݱ��浽���ݿ��У���ֻ���������
		for (int i = 0; i < listob.size(); i++) {
			List<Object> lo = listob.get(i);
			InfoVo vo = new InfoVo();
			vo.setCode(String.valueOf(lo.get(0)));
			vo.setName(String.valueOf(lo.get(1)));
			vo.setDate(String.valueOf(lo.get(2))); 
			vo.setMoney(String.valueOf(lo.get(3)));
			
			System.out.println("��ӡ��Ϣ-->����:"+vo.getCode()+"  ���ƣ�"+vo.getName()+"   ʱ�䣺"+vo.getDate()+"   �ʲ���"+vo.getMoney());
		}
		
		PrintWriter out = null;
		response.setCharacterEncoding("utf-8");  //��ֹajax���ܵ���������Ϣ����
		out = response.getWriter();
		out.print("�ļ�����ɹ���");
		out.flush();
		out.close();
	}


}
