package com.briup.bean;

import java.io.Serializable;
import java.sql.Date;
/**
 * 员工培训信息类
 *
 */
public class Train implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//培训id
	private int train_id;
	//培训内容id
	private int type_code;
	//培训细节
	private TrainType trainType;
	//员工信息
	private Staff staff;
	//培训开始时间
	private Date train_btime;
	//培训结束时间
	private Date train_etime;
	//培训心得
	private String train_expense;
	//员工id
	private int p_id;

	public Train() {
	
	}

	public int getTrain_id() {
		return train_id;
	}

	public void setTrain_id(int train_id) {
		this.train_id = train_id;
	}

	public int getType_code() {
		return type_code;
	}

	public void setType_code(int type_code) {
		this.type_code = type_code;
	}

	public TrainType getTrainType() {
		return trainType;
	}

	public void setTrainType(TrainType trainType) {
		this.trainType = trainType;
	}

	public Staff getStaff() {
		return staff;
	}

	public void setStaff(Staff staff) {
		this.staff = staff;
	}

	public Date getTrain_btime() {
		return train_btime;
	}

	public void setTrain_btime(Date train_btime) {
		this.train_btime = train_btime;
	}

	public Date getTrain_etime() {
		return train_etime;
	}

	public void setTrain_etime(Date train_etime) {
		this.train_etime = train_etime;
	}

	public String getTrain_expense() {
		return train_expense;
	}

	public void setTrain_expense(String train_expense) {
		this.train_expense = train_expense;
	}

	public int getP_id() {
		return p_id;
	}

	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	

	@Override
	public String toString() {
		return "Train{" + "train_id=" + train_id + ", type_code=" + type_code + ", trainType=" + trainType + ", staff="
				+ staff + ", train_btime=" + train_btime + ", train_etime=" + train_etime + ", train_expense='"
				+ train_expense + '\'' + ", p_id=" + p_id + '}';
	}
	
}
