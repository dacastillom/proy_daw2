package com.empresa.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class FunctionUtil {

	
	public static String toFechaString(Date str) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String salida = null;
		try {
			salida = sdf.format(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return salida;
	}
	
	
}
