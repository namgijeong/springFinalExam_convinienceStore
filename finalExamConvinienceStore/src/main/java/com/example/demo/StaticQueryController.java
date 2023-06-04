package com.example.demo;



import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import myapp.dao.StaticDao;
import myapp.domain.OneDaySaleCostProduct;
import myapp.domain.OneDaySaleCountProduct;

@RestController
public class StaticQueryController {
	@Autowired
	StaticDao staticDao;
	
	@RequestMapping("/admin_dailycount_search/{searchDay}")
	public List<OneDaySaleCountProduct> adminDailyCountSearch(@PathVariable("searchDay")java.sql.Date searchDay) {
		System.out.println("restcontroller들어옴");
		List<OneDaySaleCountProduct> oneDaySaleCountProductList= new ArrayList<OneDaySaleCountProduct>(5);
		
		OneDaySaleCountProduct kNoodle=staticDao.oneDaySaleCountKNoodle(searchDay);
		kNoodle.setProductCategory("라면");
		oneDaySaleCountProductList.add(kNoodle);
		
		OneDaySaleCountProduct rice=staticDao.oneDaySaleCountRice(searchDay);
		rice.setProductCategory("밥");
		oneDaySaleCountProductList.add(rice);
		
		OneDaySaleCountProduct snack=staticDao.oneDaySaleCountSnack(searchDay);
		snack.setProductCategory("과자");
		oneDaySaleCountProductList.add(snack);
		
		OneDaySaleCountProduct beverage=staticDao.oneDaySaleCountBeverage(searchDay);
		beverage.setProductCategory("음료수");
		oneDaySaleCountProductList.add(beverage);
		
		OneDaySaleCountProduct icecream=staticDao.oneDaySaleCountBeverage(searchDay);
		icecream.setProductCategory("아이스크림");
		oneDaySaleCountProductList.add(icecream);
		
		
		return oneDaySaleCountProductList;
	}
	
	@RequestMapping("/admin_dailycost_search/{searchDay}")
	public List<OneDaySaleCostProduct> adminDailyCostSearch(@PathVariable("searchDay")java.sql.Date searchDay) {
		System.out.println("restcontroller2들어옴");
		List<OneDaySaleCostProduct> oneDaySaleCostProductList= new ArrayList<OneDaySaleCostProduct>(5);
		
		OneDaySaleCostProduct kNoodle=staticDao.oneDaySaleCostKNoodle(searchDay);
		kNoodle.setProductCategory("라면");
		oneDaySaleCostProductList.add(kNoodle);
		
		OneDaySaleCostProduct rice=staticDao.oneDaySaleCostRice(searchDay);
		rice.setProductCategory("밥");
		oneDaySaleCostProductList.add(rice);
		
		OneDaySaleCostProduct snack=staticDao.oneDaySaleCostSnack(searchDay);
		snack.setProductCategory("과자");
		oneDaySaleCostProductList.add(snack);
		
		OneDaySaleCostProduct beverage=staticDao.oneDaySaleCostBeverage(searchDay);
		beverage.setProductCategory("음료수");
		oneDaySaleCostProductList.add(beverage);
		
		OneDaySaleCostProduct icecream=staticDao.oneDaySaleCostBeverage(searchDay);
		icecream.setProductCategory("아이스크림");
		oneDaySaleCostProductList.add(icecream);
		return oneDaySaleCostProductList;
	}
	
	@RequestMapping("/admin_firstproduct_search")
	public List<OneDaySaleCountProduct> adminFirstProductSearch() {
		System.out.println("restcontroller3들어옴");
		List<OneDaySaleCountProduct> firstProductList= new ArrayList<OneDaySaleCountProduct>(3);
		firstProductList=staticDao.firstProduct();
		System.out.println(firstProductList);
		return firstProductList;
	}
}
