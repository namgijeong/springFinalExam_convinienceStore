package myapp.service;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

public interface SalesListService {
	void purchase(int inventoryCode, int count,HttpServletRequest request);
}
