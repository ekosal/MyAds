package myads.controller.action.member;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import myads.controller.action.Action;
import myads.controller.action.ActionForward;
import myads.model.dao.MemberDao;
import myads.model.dto.MemberDto;

public class Login implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

		ActionForward forward=new ActionForward();
		
		MemberDao dao=new MemberDao();
		ResultSet rs=null;
		HttpSession session=request.getSession(true);
		
		try {
			 System.out.println("txt_username: "+ request.getParameter("txt_username"));
			 System.out.println("txt_password: "+request.getParameter("txt_password"));
			 
			 MessageDigest md=MessageDigest.getInstance("MD5");

			md.update(request.getParameter("txt_password").getBytes(), 0, request.getParameter("txt_password").length());
			String encpass=new BigInteger(1,md.digest()).toString(16);
			 
			 rs=dao.login(request.getParameter("txt_username"), encpass);
			 
			 if(rs.next()){
				 
				 MemberDto member=new MemberDto();
				 member.setId(rs.getInt("MemId"));
				 member.setName(rs.getString("Name"));
				 member.setRealName(rs.getString("RealName"));
				 member.setSex(rs.getString("Sex"));
				 member.setDate(rs.getString("Date"));
				 member.setRealName(rs.getString("Email"));
	
				 session.setAttribute("user", member);
				 
				 /*System.out.println("Login is OK");
				 session.setAttribute("membername", request.getParameter("txt_username"));
				 session.setAttribute("id", rs.getInt(1));*/
				 
				 forward.setRedirect(true);
				 forward.setPath("./");
				 
			 }else{
				 
				 session.removeAttribute("user");
				 
				 /*System.out.println("Login fail");
				 session.removeAttribute("membername");
				 session.removeAttribute("id");
				 session.setAttribute("fail", "fail");*/
				 
				 forward.setRedirect(true);
				 forward.setPath("lay_log.ads");
				 
			 }
			 return forward;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return null;
	}
}