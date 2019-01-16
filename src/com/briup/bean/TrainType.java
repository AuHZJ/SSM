package com.briup.bean;

import java.io.Serializable;
/**
 * 培训具体细节类
 *
 */
public class TrainType implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//培训细节id
	private int type_code;
	//培训名称
	private String type_name;
	//培训内容
	private String type_info;

	public TrainType() {
	}

	public int getType_code() {
		return type_code;
	}

	public void setType_code(int type_code) {
		this.type_code = type_code;
	}

	public String getType_name() {
		return type_name;
	}

	public void setType_name(String type_name) {
		this.type_name = type_name;
	}

	public String getType_info() {
		return type_info;
	}

	public void setType_info(String type_info) {
		this.type_info = type_info;
	}
	
	@Override
	public String toString() {
		return "TrainType{" + "type_code=" + type_code + ", type_name='" + type_name + '\'' + ", type_info='"
				+ type_info + '\'' + '}';
	}
	
}
