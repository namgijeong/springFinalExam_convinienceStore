package myapp.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import myapp.dao.InventoryDao;
import myapp.domain.Inventory;
import myapp.service.InventoryService;

@Component
public class InventoryServiceImpl implements InventoryService{
	
	@Autowired
	InventoryDao inventoryDao;
	@Override
	public void inventoryAdd(int inventoryCode, int count) {
		// TODO Auto-generated method stub
		Inventory inventory = new Inventory();
		inventory.setInventoryCode(inventoryCode);
		inventory.setCount(count);
		inventory.setComeInDate(new java.sql.Date(System.currentTimeMillis()));
		inventoryDao.inventoryAdd(inventory);
	}

}
