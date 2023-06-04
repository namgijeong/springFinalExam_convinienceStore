package myapp.dao;

import org.apache.ibatis.annotations.Mapper;

import myapp.domain.OneDaySaleCountProduct;
@Mapper
public interface StaticDao {
	OneDaySaleCountProduct oneDaySaleCountKNoodle(java.sql.Date searchDay);
	OneDaySaleCountProduct oneDaySaleCountRice(java.sql.Date searchDay);
	OneDaySaleCountProduct oneDaySaleCountSnack(java.sql.Date searchDay);
	OneDaySaleCountProduct oneDaySaleCountBeverage(java.sql.Date searchDay);
	OneDaySaleCountProduct oneDaySaleCountIcecream(java.sql.Date searchDay);
}
