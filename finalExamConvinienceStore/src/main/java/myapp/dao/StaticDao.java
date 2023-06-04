package myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import myapp.domain.OneDaySaleCostProduct;
import myapp.domain.OneDaySaleCountProduct;
@Mapper
public interface StaticDao {
	OneDaySaleCountProduct oneDaySaleCountKNoodle(java.sql.Date searchDay);
	OneDaySaleCountProduct oneDaySaleCountRice(java.sql.Date searchDay);
	OneDaySaleCountProduct oneDaySaleCountSnack(java.sql.Date searchDay);
	OneDaySaleCountProduct oneDaySaleCountBeverage(java.sql.Date searchDay);
	OneDaySaleCountProduct oneDaySaleCountIcecream(java.sql.Date searchDay);
	
	OneDaySaleCostProduct oneDaySaleCostKNoodle(java.sql.Date searchDay);
	OneDaySaleCostProduct oneDaySaleCostRice(java.sql.Date searchDay);
	OneDaySaleCostProduct oneDaySaleCostSnack(java.sql.Date searchDay);
	OneDaySaleCostProduct oneDaySaleCostBeverage(java.sql.Date searchDay);
	OneDaySaleCostProduct oneDaySaleCostIcecream(java.sql.Date searchDay);
	
	List<OneDaySaleCountProduct> firstProduct();
}
