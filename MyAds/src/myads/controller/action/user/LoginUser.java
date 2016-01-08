package myads.controller.action.user;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import myads.controller.action.Action;
import myads.controller.action.ActionForward;
import myads.model.dao.UserDao;

public class LoginUser implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

ActionForward forward=new ActionForward();
		
		UserDao dao=new UserDao();
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
				 
				 System.out.println("Login is OK");
				 session.setAttribute("membername", request.getParameter("txt_username"));
				 session.setAttribute("id", rs.getInt(1));
				 
				 forward.setRedirect(false);
				 forward.setPath("/step2/myadm.jsp");
				 
			 }else{
				 
				 System.out.println("Login fail");
				 session.removeAttribute("membername");
				 session.removeAttribute("id");
				 session.setAttribute("fail", "fail");
				 
				 forward.setRedirect(true);
				 forward.setPath("");
				 
			 }
			 return forward;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return null;
	}

}
