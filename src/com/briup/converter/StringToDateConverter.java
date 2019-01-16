package com.briup.converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

public class StringToDateConverter implements Converter<String, Date>{
	private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy MM dd"); 
	@Override
	public Date convert(String str) {
		Date date = null;
		try {
			if(str!=null&&!"".equals(str.trim())){
				date = dateFormat.parse(str);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
}