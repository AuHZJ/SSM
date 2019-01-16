package com.briup.bean;

import java.io.Serializable;
import java.sql.Date;

/**
 * 员工合同类
 * 
 *
 */
public class Agreement implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//合同id
	private int agreement_id;
	//员工id
	private int p_id;
	//合同生效时间
	private Date agreement_btime;
	//合同具体内容
	private String agreement_content;
	//员工信息
	private Staff staff;

	public Agreement() {
		
	}
	
	public Staff getStaff() {
		return staff;
	}

	public void setStaff(Staff staff) {
		this.staff = staff;
	}


	public int getAgreement_id() {
		return agreement_id;
	}

	public void setAgreement_id(int agreement_id) {
		this.agreement_id = agreement_id;
	}

	public int getP_id() {
		return p_id;
	}

	public void setP_id(int p_id) {
		this.p_id = p_id;
	}

	public Date getAgreement_btime() {
		return agreement_btime;
	}

	public void setAgreement_btime(Date agreement_btime) {
		this.agreement_btime = agreement_btime;
	}

	public String getAgreement_content() {
		return agreement_content;
	}

	public void setAgreement_content(String agreement_content) {
		this.agreement_content = agreement_content;
	}

	@Override
	public String toString() {
		return "Agreement{" + "agreement_id=" + agreement_id + ", p_id=" + p_id + ", agreement_btime=" + agreement_btime
				+ ", agreement_content='" + agreement_content + '\'' + ", staff=" + staff + '}';
	}
}
