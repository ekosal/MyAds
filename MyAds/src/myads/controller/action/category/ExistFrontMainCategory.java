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
		System.out.println("Sub Category Id:"+subCateryId);
		try{
			
			CategoryDao category=new CategoryDao();
			List<MainCategoryDto> listCategory=new ArrayList<>();
			listCategory=category.readSubCategoryByCategory(AESCrypt.decrypt(categoryId));
			request.getSession().setAttribute("CategoryList", listCategory);
			
			PostingDao positing=new PostingDao();
			List<PostingDto> productList=new ArrayList<>();
			if (subCateryId==null || subCateryId==""){
				Pagination.countPage(positing.readCountPage(AESCrypt.decrypt(categoryId)));
				productList=positing.readProductByCategory(AESCrypt.decrypt(categoryId),Pagination.startpage,Pagination.endpage);
			}else{
				productList=positing.readProductByCategoryAndSubCategory(AESCrypt.decrypt(categoryId), AESCrypt.decrypt(subCateryId));
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
