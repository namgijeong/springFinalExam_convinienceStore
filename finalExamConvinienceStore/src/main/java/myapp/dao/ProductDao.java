package myapp.dao;

import org.apache.ibatis.annotations.Mapper;

import myapp.domain.Product;

@Mapper
public interface ProductDao {
	Product findProduct(int inventoryCode);
}
