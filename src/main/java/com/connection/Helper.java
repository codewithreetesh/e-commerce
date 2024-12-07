package com.connection;

public class Helper {
	
	public static String get10Words(String desc) {

		String[] str = desc.trim().split(" ");
		
		if(str.length>10) {
			
			String result="";
			
			for(int i=0;i<10;i++) {
				result=result+" "+str[i];
			}
			System.out.println("desc./....."+result);
			return (result+"...");
			
		}
		else {
			return (desc+"...");
		}
		
	}
}
