package myads.controller.action.member;

import java.math.BigInteger;
import java.security.MessageDigest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import myads.controller.action.Action;
import myads.controller.action.ActionForward;
import myads.model.dao.MemberDao;
import myads.model.dto.MemberDto;

public class EditMember implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		MemberDao dao=new MemberDao();
		MemberDto dto=new MemberDto();
		ActionForward forward=new ActionForward();
		
		try{
			
			int id=(Integer.valueOf(request.getParameter("txt_id")));
			String name=request.getParameter("txt_name");
			String realname=request.getParameter("txt_realname");
			int companyid=(Integer.valueOf(request.getParameter("txt_companyid")));
			String sex=request.getParameter("txt_sex");
			String password=request.getParameter("txt_pass");
			String email=request.getParameter("txt_email");
			String phone=request.getParameter("txt_phone");
			String address=request.getParameter("txt_address");
			
			
            MessageDigest md=MessageDigest.getInstance("MD5");
			
			md.update(password.getBytes(), 0, password.length());
			String encpass=new BigInteger(1,md.digest()).toString(16);
			
			dto.setId(id);
			dto.setName(name);
			dto.setRealName(realname);
			dto.setComid(companyid);
			dto.setSex(sex);
			dto.setPassword(encpass);
			dto.setEmail(email);
			dto.setPhone(phone);
			dto.setAddress(address);
			System.out.println("Hello");
			if (dao.editMember(dto)){
				request.getSession().setAttribute("user", dao.getMemberEdit(dto.getId()));
				System.out.println("Session : "+dao.getMemberEdit(dto.getId()));
				request.getSession().setAttribute("result", "true");
				
			}else{
				request.getSession().setAttribute("result", "false");
			}
					
			forward.setRedirect(false);
			forward.setPath("lay_account_setting.ads");
			return forward;
			
		}catch(Exception e){
			
		}
		return null;
	}

}
