package com.briup.bean;

import java.sql.Date;
/**
 * 员工出差信息类
 *
 */
public class Alter {
	//出差信息id
	private int alterId;
	//员工信息
	private Staff staff;
	//出差开始时间
	private Date alter_btime;
	//出差结束时间
	private Date alter_etime;
	//出差内容
	private String alter_content;

	public Alter() {
	
	}
	
	public int getAlterId() {
		return alterId;
	}

	public void setAlterId(int alterId) {
		this.alterId = alterId;
	}

	public Staff getStaff() {
		return staff;
	}

	public void setStaff(Staff staff) {
		this.staff = staff;
	}

	public Date getAlter_btime() {
		return alter_btime;
	}

	public void setAlter_btime(Date alter_bstate) {
		this.alter_btime = alter_bstate;
	}

	public Date getAlter_etime() {
		return alter_etime;
	}

	public void setAlter_etime(Date alter_etime) {
		this.alter_etime = alter_etime;
	}

	public String getAlter_content() {
		return alter_content;
	}

	public void setAlter_content(String alter_content) {
		this.alter_content = alter_content;
	}

	@Override
	public String toString() {
		return "Alter [alterId=" + alterId + ", staff=" + staff + ", alter_btime=" + alter_btime + ", alter_etime="
				+ alter_etime + ", alter_content=" + alter_content + "]";
	}
	
	
	
}
