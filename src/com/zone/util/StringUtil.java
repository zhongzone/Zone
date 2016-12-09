package com.zone.util;

public class StringUtil
{
	/**
	 * 获得类的名称（不包含包名）
	 * @param entityClass
	 * @return
	 */
	public static String getClassName(Class entityClass)
	{
		String longName = entityClass.getName();
		String[] split = longName.split("\\."); //以小数点作为分隔符，必须加上//
		String name = null;
		if(split.length != 0)
			name = split[split.length-1];
		return name;
	}	
}
