/**
 * 
 */
package com.kjjcsoft.bean;
/**
 * @author Seekraw
 */
public class AccountBean {
	private int accountId;
	private int customerId;
	private String accountType;
	private float interestRate;
	private String approvedBy;
	private int entryBy;
	private int years;
	private String maturityPeriod;
	private String creationDate;
	private double fixedDepositAmount;
	private String customerName;
	private boolean status;
	private String enteredby;
	public int getAccountId() {
		return accountId;
	}
	public void setAccountId(int accountId) {
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
	public String getMaturityPeriod() {
		return maturityPeriod;
	}
	public void setMaturityPeriod(String maturityPeriod) {
		this.maturityPeriod = maturityPeriod;
	}
	public String getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(String creationDate) {
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
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public String getEnteredby() {
		return enteredby;
	}
	public void setEnteredby(String enteredby) {
		this.enteredby = enteredby;
	}
	
}
