package com.godsky.findlove.admin.statisticmanagement.model.vo;

public class StatisticResult {
	
	private String key;
	private int resultCnt;
	private double resultPct;
	
	public StatisticResult() {}

	public StatisticResult(String key, int resultCnt, double resultPct) {
		super();
		this.key = key;
		this.resultCnt = resultCnt;
		this.resultPct = resultPct;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public int getResultCnt() {
		return resultCnt;
	}

	public void setResultCnt(int resultCnt) {
		this.resultCnt = resultCnt;
	}

	public double getResultPct() {
		return resultPct;
	}

	public void setResultPct(double resultPct) {
		this.resultPct = resultPct;
	}

	@Override
	public String toString() {
		return "StatisticResult [key=" + key + ", resultCnt=" + resultCnt + ", resultPct=" + resultPct + "]";
	}
	
}
