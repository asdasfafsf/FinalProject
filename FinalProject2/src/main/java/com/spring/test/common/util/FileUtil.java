package com.spring.test.common.util;

import java.io.File;
import java.text.SimpleDateFormat;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileUtil {
	private static SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
	
	public void saveFile(MultipartFile file,String rootDir, String saveDir, String renamedFileName) {
		if (file.isEmpty()) {
			return;
		}
		
		try {
			file.transferTo(new File(rootDir + saveDir + "/" + renamedFileName));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getRenamedFileName(MultipartFile file) {
		String ext = getFileExt(file.getOriginalFilename());
		int rdv = (int)(Math.random() * 1000);
		String reName = simpleDateFormat.format(System.currentTimeMillis()) + "_" + rdv + ext;
		
		return reName;
	}
	
	public String getFileExt(String fileName) {
		int index = fileName.lastIndexOf(".");
		
		return fileName.substring(index - 1);
	}

}
