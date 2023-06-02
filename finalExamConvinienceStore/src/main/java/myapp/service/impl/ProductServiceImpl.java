package myapp.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import myapp.dao.ProductDao;
import myapp.domain.Product;
import myapp.service.ProductService;
@Component
public class ProductServiceImpl implements ProductService{
	@Autowired
	ProductDao productDao;
	@Override
	public Product getProductInfo(int inventoryCode) {
		// TODO Auto-generated method stub
		return productDao.findProduct(inventoryCode);
	}

}
