package myads.controller.action.posting;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import myads.controller.action.Action;
import myads.controller.action.ActionForward;
import myads.model.dao.PostingDao;
import myads.model.dto.MemberDto;
import myads.model.dto.PostingListDto;

public class SearchAdsAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		ActionForward forward=new ActionForward();
		List<PostingListDto> postinList=new ArrayList<PostingListDto>();
		MemberDto memberDto=new MemberDto();
		PostingDao postingDao=new PostingDao();
		String search=request.getParameter("txtSearch");
		System.out.println(" Search : "+search);
		try{
		    System.out.println(" Search : "+search);
			memberDto=(MemberDto) request.getSession().getAttribute("user");
			System.out.println("Member : "+memberDto);
			if (memberDto!=null){
				postinList= postingDao.getSearchPostingList(memberDto, search, 1, 2);
				System.out.println(" List "+postinList);
				request.getSession().setAttribute("postingList", postinList);
			}
			
			
			forward.setRedirect(false);
			forward.setPath("lay_myadspages.ads");
			return forward;
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		return null;
	}

}