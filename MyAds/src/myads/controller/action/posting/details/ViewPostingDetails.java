package myads.controller.action.posting.details;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import myads.controller.action.Action;
import myads.controller.action.ActionForward;
import myads.model.dao.CategoryDao;
import myads.model.dao.PostingDao;
import myads.model.dto.MainCategoryDto;
import myads.model.dto.PostingDto;
import myads.model.util.AESCrypt;

public class ViewPostingDetails implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward=new ActionForward();
		String categoryId= request.getParameter("id");
		String subCateryId=request.getParameter("subid");
		String proId=request.getParameter("proid");
		try{
			
			CategoryDao category=new CategoryDao();
			List<MainCategoryDto> listCategory=new ArrayList<>();
			listCategory=category.readSubCategoryByCategory(AESCrypt.decrypt(categoryId));
			request.getSession().setAttribute("CategoryList1", listCategory);			
			
	
			forward.setRedirect(false);
			forward.setPath("ads_product.jsp");
			return forward;
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

}
