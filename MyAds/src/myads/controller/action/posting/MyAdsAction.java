package myads.controller.action.posting;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import myads.controller.action.Action;
import myads.controller.action.ActionForward;
import myads.model.dao.PostingDao;
import myads.model.dto.MemberDto;
import myads.model.dto.PostingListDto;
import myads.model.util.Pagination;

public class MyAdsAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

		ActionForward forward=new ActionForward();
		String current=request.getParameter("cp");
		try{
			MemberDto memberDto=new MemberDto();
			memberDto=(MemberDto)request.getSession().getAttribute("user");
		    PostingDao postingDao=new PostingDao();
			List<PostingListDto> postinglist=postingDao.getPostingList(memberDto);
			request.getSession().setAttribute("postingList", postinglist);
			Pagination.startpage=1;
			Pagination.endpage=5;
			Pagination.rowperpage=5;
			if (current=="" || current==null){
				Pagination.currentpage=1;
			}else{
				Pagination.currentpage=Integer.valueOf(current);
			}
			Pagination.countPage(postingDao.countPostingByUser(memberDto));		
			
			forward.setRedirect(false);
			forward.setPath("ads_myadspages.jsp");
			return forward;
		}catch(Exception e){
		}
		return null;
	}

}
