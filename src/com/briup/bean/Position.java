package com.briup.bean;

public class Position {

	private int POS_ID;
	private String POS_NAME;
	private int DEPT_ID;

	public Position() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Position(int pOS_ID, String pOS_NAME, int dEPT_ID) {
		super();
		POS_ID = pOS_ID;
		POS_NAME = pOS_NAME;
		DEPT_ID = dEPT_ID;
	}

	public int getPOS_ID() {
		return POS_ID;
	}

	public void setPOS_ID(int pOS_ID) {
		POS_ID = pOS_ID;
	}

	public String getPOS_NAME() {
		return POS_NAME;
	}

	public void setPOS_NAME(String pOS_NAME) {
		POS_NAME = pOS_NAME;
	}

	public int getDEPT_ID() {
		return DEPT_ID;
	}

	public void setDEPT_ID(int dEPT_ID) {
		DEPT_ID = dEPT_ID;
	}

	@Override
	public String toString() {
		return "Position [POS_ID=" + POS_ID + ", POS_NAME=" + POS_NAME + ", DEPT_ID=" + DEPT_ID + "]";
	}

}
