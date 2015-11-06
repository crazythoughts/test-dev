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
	private int entryBy;
	private int years;
	private Date maturityPeriod = new Date();
	private Date creationDate = new Date();
	private double fixedDepositAmount;

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

	public Date getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}

	public double getFixedDepositAmount() {
		return fixedDepositAmount;
	}

	public void setFixedDepositAmount(double fixedDepositAmount) {
		this.fixedDepositAmount = fixedDepositAmount;
	}

	public int getEntryBy() {
		return entryBy;
	}

	public void setEntryBy(int entryBy) {
		this.entryBy = entryBy;
	}

}
