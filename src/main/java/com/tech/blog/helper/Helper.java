package com.tech.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class Helper {
//	In this we will delete the previous image 
	public static boolean DeleteFile(String path) {
		boolean flag = false;

		try {
			File f = new File(path);
			flag = f.delete();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return flag;
	}

//   here we will add the new image to location
	public static boolean SaveFile(InputStream is, String path) {
		boolean flag = false;
		try {
			byte b[]=new byte[is.available()];
			
		    is.read(b);
		    
		    FileOutputStream fs=new FileOutputStream(path);
		    fs.write(b);
		    fs.flush();
		    fs.close();
			flag=true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return flag;
	}
}
