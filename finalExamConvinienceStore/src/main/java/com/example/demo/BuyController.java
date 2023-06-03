package com.example.demo;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import myapp.domain.Product;
import myapp.service.impl.ProductServiceImpl;
import myapp.service.impl.SalesListServiceImpl;

@Controller
public class BuyController {
	
		@Autowired
		ProductServiceImpl productServiceImpl;
		@Autowired
		SalesListServiceImpl salesListServiceImpl;
	
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
	  public String productDetail(@RequestParam(value="inventory_code")int inventoryCode,Model model) {
		  Product resultProduct;
		  resultProduct=productServiceImpl.getProductInfo(inventoryCode);
		  model.addAttribute("Product",resultProduct);
		  return "buy/product_detail"; 
	  }
	 
	  @RequestMapping(value="/buyOk") 
	  public String buyOk(HttpServletRequest request,@RequestParam(value="inventoryCode")int inventoryCode,@RequestParam(value="count")int count) {
		  System.out.println("구입할 inventoryCode"+inventoryCode);
		  System.out.println("구입할 count"+count);
		  //이전 페이지로 리다이렉트 시키기
		  //String referer = request.getHeader("Referer");
		  //"redirect:"+referer;
		  salesListServiceImpl.purchase(inventoryCode, count,request);
		  return "redirect:/product_detail?inventory_code="+inventoryCode;
	  }
}
