package com.aud.tool;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class Utils {
	public static String saveFile(MultipartFile file, HttpServletRequest request)
			throws IllegalStateException, IOException {
		if (file.isEmpty()) {
			System.out.println("文件未上传!");
			return "";
		}

		String path = null;// 文件路径
		String fileName = file.getOriginalFilename();// 文件原名称
		// 项目在容器中实际发布运行的根路径
		String realPath = request.getSession().getServletContext().getRealPath("/");
		// 自定义的文件名称
		String trueFileName = String.valueOf(System.currentTimeMillis()) + fileName;
		// 设置存放图片文件的路径
		path = realPath + trueFileName;
		System.out.println("--------文件存储路径： " + path);
		File localFile = new File(path);
		file.transferTo(localFile);
		return trueFileName;
	}
}
