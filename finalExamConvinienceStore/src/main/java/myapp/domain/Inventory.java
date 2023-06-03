package myapp.domain;

import java.sql.Date;

public class Inventory {
	int primaryId;
	int inventoryCode;
	/*직접 이객체를 바로 mybatis에 넣어야하니까 db형 데이터인 sql.Date로 해야할것같다*/
	Date comeInDate;
	Date outInDate;
	int count;
	
	public int getPrimaryId() {
		return primaryId;
	}
	public void setPrimaryId(int primaryId) {
		this.primaryId = primaryId;
	}
	public int getInventoryCode() {
		return inventoryCode;
	}
	public void setInventoryCode(int inventoryCode) {
		this.inventoryCode = inventoryCode;
	}
	public Date getComeInDate() {
		return comeInDate;
	}
	public void setComeInDate(Date comeInDate) {
		this.comeInDate = comeInDate;
	}
	public Date getOutInDate() {
		return outInDate;
	}
	public void setOutInDate(Date outInDate) {
		this.outInDate = outInDate;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
}
