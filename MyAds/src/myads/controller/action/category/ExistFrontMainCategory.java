package myads.controller.action.category;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import myads.controller.action.Action;
import myads.controller.action.ActionForward;
import myads.model.dao.CategoryDao;
import myads.model.dao.PostingDao;
import myads.model.dto.MainCategoryDto;
import myads.model.dto.PostingDto;
import myads.model.util.AESCrypt;
import myads.model.util.Pagination;

public class ExistFrontMainCategory implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		ActionForward forward=new ActionForward();
		String categoryId= request.getParameter("id");
		String subCateryId=request.getParameter("subid");
		String cp=request.getParameter("cp");
		
		try{
			
			if (subCateryId == null || subCateryId=="") subCateryId="";
			System.out.println("Sub Category "+AESCrypt.decrypt(subCateryId));
			Pagination.category=categoryId;
			Pagination.subcategory=subCateryId;
			
			CategoryDao category=new CategoryDao();
			List<MainCategoryDto> listCategory=new ArrayList<>();
			listCategory=category.readSubCategoryByCategory(AESCrypt.decrypt(categoryId));
			request.getSession().setAttribute("CategoryList", listCategory);
			
			PostingDao positing=new PostingDao();
			List<PostingDto> productList=new ArrayList<>();
			
			Pagination.startpage=0;
			Pagination.currentpage=1;
			Pagination.rowperpage=5;

			if (cp != null && cp != ""){
				Pagination.startpage=(Pagination.rowperpage*Integer.valueOf(cp))-Pagination.rowperpage;
				Pagination.currentpage=Integer.valueOf(cp);
			}
			
			
			if (subCateryId==null || subCateryId==""){				
				Pagination.countPage(positing.readCountPage(AESCrypt.decrypt(categoryId)));
				productList=positing.readProductByCategory(AESCrypt.decrypt(categoryId),Pagination.startpage,Pagination.rowperpage);
			}else{
				Pagination.countPage(positing.readCountPage(AESCrypt.decrypt(categoryId),AESCrypt.decrypt(subCateryId)));
				productList=positing.readProductByCategoryAndSubCategory(AESCrypt.decrypt(categoryId), AESCrypt.decrypt(subCateryId),Pagination.startpage,Pagination.rowperpage);
			}
				
			request.getSession().setAttribute("productByCategory", productList);
	
			forward.setRedirect(false);
			forward.setPath("ads_product.jsp");
			return forward;
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

}
