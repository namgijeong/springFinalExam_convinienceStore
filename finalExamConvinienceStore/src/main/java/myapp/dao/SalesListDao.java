package myapp.dao;

import org.apache.ibatis.annotations.Mapper;

import myapp.domain.SalesList;
@Mapper
public interface SalesListDao {
	void insertSalesList(SalesList salesList);
}
