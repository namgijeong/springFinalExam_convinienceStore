package myapp.service.impl;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletWebRequest;

import myapp.dao.InventoryDao;
import myapp.dao.MemberDao;
import myapp.dao.SalesListDao;
import myapp.domain.Inventory;
import myapp.domain.Member;
import myapp.domain.SalesList;
import myapp.service.SalesListService;

@Component
public class SalesListServiceImpl implements SalesListService{
	
	@Autowired
	MemberDao memberDao;
	
	@Autowired
	SalesListDao salesListDao;
	
	@Autowired
	InventoryDao inventoryDao;
	
	@Override
	public void purchase(int inventoryCode, int count,HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		//request의 getSession()메서드의 파라미터로 false를 전달하면, 이미 생성된 세션이 있을 때 그 세션을 반환하고, 없으면 null을 반환한다.
		HttpSession session = request.getSession(false);
		int primaryId=(int)session.getAttribute("primaryId");
		Member currentMember=memberDao.findIdByPrimaryId(primaryId);
		
		int currentCount=inventoryDao.getPlusCountByInventoryCode(inventoryCode)-inventoryDao.getMinusCountByInventoryCode(inventoryCode);
		//currentCount는 현재 재고 갯수
		//count는 사겠다고 한 갯수
		int countok=currentCount-count;
		if(countok>=0) {
			Inventory inventory=new Inventory();
			inventory.setOutInDate(new java.sql.Date(System.currentTimeMillis()));
			inventory.setCount(count);
			inventory.setInventoryCode(inventoryCode);
			inventoryDao.inventoryMinus(inventory);
			
			SalesList salesList=new SalesList();
			salesList.setCount(count);
			salesList.setInventoryCode(inventoryCode);
			salesList.setMemberId(currentMember.getMemberId());
			salesList.setSalesDate(new java.sql.Date(System.currentTimeMillis()));
			salesListDao.insertSalesList(salesList);
			
			request.setAttribute("msg","구입완료");
		}
		else {
			request.setAttribute("msg","재고가 모자라 구입실패");
		}
	}

}
