/**
 * 
 */
package com.kjjcsoft.bean;

import java.util.Date;

/**
 * @author Seekraw
 *
 */
public class AccountBean {
	private String accountId;
	private int customerId;
	private String accountType;
	private float interestRate;
	private String approvedBy;
	private int years;
	private Date maturityPeriod=new Date();

	public String getAccountId() {
		return accountId;
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

	public float getInterestRate() {
		return interestRate;
	}

	public void setInterestRate(float interestRate) {
		this.interestRate = interestRate;
	}

	public String getApprovedBy() {
		return approvedBy;
	}

	public void setApprovedBy(String approvedBy) {
		this.approvedBy = approvedBy;
	}

	public int getYears() {
		return years;
	}

	public void setYears(int years) {
		this.years = years;
	}

	public Date getMaturityPeriod() {
		return maturityPeriod;
	}

	public void setMaturityPeriod(Date maturityPeriod) {
		this.maturityPeriod = maturityPeriod;
	}

}
