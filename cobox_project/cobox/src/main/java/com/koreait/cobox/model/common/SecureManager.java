package com.koreait.cobox.model.common;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.springframework.stereotype.Component;

@Component
public class SecureManager {
	public String getSecureData(String password) {
		StringBuffer sb = new StringBuffer();	//문자열을 누적시킬 객체
		
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[] data = password.getBytes("UTF-8");	//일단 바이트 배열로 쪼개기
			byte[] hash = digest.digest(data);
			
			//쪼개진 데이터를 대상으로 16진수값으로 변환하여 문자열로 반환
			
			for(int i=0; i<hash.length; i++) {
				String hex = Integer.toHexString(0xff&hash[i]);	//정수를 16진수 문자열로 반환
				//System.out.println(hex);	//중간점검
				if(hex.length()==1) {
					sb.append("0");					
				}
				sb.append(hex);
			}
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return sb.toString();
	}
}
