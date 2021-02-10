package com.koreait.cobox.model.common;

import java.io.File;
import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
@Component	/* component-scan 대상 중 하나임 */
public class FileManager {
	private static final Logger logger = LoggerFactory.getLogger(FileManager.class); //디버그로 실제 파일의 경로를 찾아들어가 사진이 저장되는지 확인!
	private String saveSnackDir="/resources/data/snack";  //톰캣이 복사해놓은 경로에 사진이 저장될 예정
	private String saveMovieDir="/resources/data/movie"; 
	private String saveExcelDir="/resources/data/excel"; 
	
	
	public static String getExtend(String path) {
		int lastIndex = path.lastIndexOf(".");
		String ext = path.substring(lastIndex+1, path.length());
		
		//System.out.println(ext);
		return ext;
	}
	
	public static boolean deleteFile(String path) {
		File file = new File(path);
		return file.delete();
	}
	
	//파일 저장하기
	public void saveFile(String realDir, MultipartFile multi) {
		try {
			multi.transferTo(new File(realDir));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	//저장된 파일 경로 불러오기
	
	
	
	
	
}
