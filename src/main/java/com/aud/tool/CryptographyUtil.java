package com.aud.tool;

import org.apache.shiro.codec.Base64;
import org.apache.shiro.crypto.hash.Md5Hash;

public class CryptographyUtil {

	public static String encBase64(String str){
		return Base64.encodeToString(str.getBytes());
	}
	
	public static String decBase64(String str){
		return Base64.decodeToString(str);
	}
	
	public static String md5(String str,String salt){
		return new Md5Hash(str,salt).toString();
	}
}