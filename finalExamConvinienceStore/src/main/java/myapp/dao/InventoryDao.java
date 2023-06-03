package myapp.dao;

import myapp.domain.Inventory;

public interface InventoryDao {
	void inventoryAdd(Inventory inventory);
	int getPlusCountByInventoryCode(int inventoryCode);
	int getMinusCountByInventoryCode(int inventoryCode);
	void inventoryMinus(Inventory inventory);
}
