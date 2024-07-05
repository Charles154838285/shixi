package com.framework.commons.formatter;

import com.framework.commons.util.DateHelper;
import org.springframework.format.Formatter;

import java.text.ParseException;
import java.util.Date;
import java.util.Locale;

public class String2DateFormatter implements Formatter<Date> {
	@Override
	public Date parse(String s, Locale locale) throws ParseException {
		return DateHelper.parseDate(s);
	}

	@Override
	public String print(Date date, Locale locale) {
		return null;
	}
}
