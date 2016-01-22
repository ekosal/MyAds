package myads.controller.action.posting;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import myads.controller.action.Action;
import myads.controller.action.ActionForward;
import myads.model.dto.PostingDto;

public class GetIdProductUpdate implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
ActionForward forward=new ActionForward();
		
	   PostingDto postingDto=new PostingDto();
	   String id=request.getParameter("id");
		
		try{
			if (id==null || id==""){
				forward.setPath("ads_newposting.jsp");
			}else{
				
				
				
				forward.setPath("ads_editposting.jsp");
			}
			
			
			forward.setRedirect(false);
			
			return forward;
		}catch(Exception e){
		}
		return null;
		
	}

}
