package myapp.domain;

import java.sql.Date;

public class SalesList {
	int primaryId;
	String memberId;
	int inventoryCode;
	Date salesDate;
	int count;
	public int getPrimaryId() {
		return primaryId;
	}
	public void setPrimaryId(int primaryId) {
		this.primaryId = primaryId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getInventoryCode() {
		return inventoryCode;
	}
	public void setInventoryCode(int inventoryCode) {
		this.inventoryCode = inventoryCode;
	}
	public Date getSalesDate() {
		return salesDate;
	}
	public void setSalesDate(Date salesDate) {
		this.salesDate = salesDate;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	
}
