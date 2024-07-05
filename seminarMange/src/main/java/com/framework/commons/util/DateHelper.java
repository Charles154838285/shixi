package com.framework.commons.util;

import org.apache.commons.lang3.time.DateUtils;
import java.util.Date;

public class DateHelper {
	private static final String[] parsePatterns = {
			"yyyy-MM-dd","yyyy-MM-dd HH:mm:ss",
			"yyyy/MM/dd","yyyy/MM/dd HH:mm:ss",
			"yyyy.MM.dd","yyyy.MM.dd HH:mm:ss"
	};

	public static Date parseDate(String str) {
		try {
			return DateUtils.parseDate(str,parsePatterns);
		} catch (Exception e) {
			return null;
		}
	}
}
