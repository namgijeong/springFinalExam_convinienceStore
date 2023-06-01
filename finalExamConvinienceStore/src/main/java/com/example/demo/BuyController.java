package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BuyController {


	
	  @RequestMapping(value="/buy_beverage") 
	  public String buyBeverage() {
		  return "buy/buy_beverage"; 
	  }
	  
	  @RequestMapping(value="/buy_icecream") 
	  public String buyIcecream() {
		  return "buy/buy_icecream"; 
	  }
	  
	  @RequestMapping(value="/buy_k_noodle") 
	  public String buyKNoodle() {
		  return "buy/buy_k_noodle"; 
	  }
	  
	  @RequestMapping(value="/buy_rice") 
	  public String buyRice() {
		  return "buy/buy_rice"; 
	  }
	  
	  @RequestMapping(value="/buy_snack") 
	  public String buySnack() {
		  return "buy/buy_snack"; 
	  }
	  
	  @RequestMapping(value="/product_detail") 
	  public String productDetail() {
		  return "buy/product_detail"; 
	  }
	 
}
