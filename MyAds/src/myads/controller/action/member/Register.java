package myads.controller.action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import myads.controller.action.Action;
import myads.controller.action.ActionForward;
import myads.model.dao.MemberDao;
import myads.model.dto.MemberDto;
import myads.model.sqlConnection.SqlConnection;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Register implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		MemberDao dao=new MemberDao();
		MemberDto dto=new MemberDto();
		ActionForward forward=new ActionForward();
		
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");

		int id =0;
		
		try{
			PreparedStatement ps=SqlConnection.getConnection().prepareStatement("SELECT Max(MemId) FROM tbl_member");
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
				id =rs.getInt(1)+1;
				System.out.println("Memberid:"+id);
			}else{
				id=1;
			}
			
		}catch(Exception ex){
			System.out.println("insert Error! : "+ex);
		
		}

		String name=request.getParameter("txt_name");
		String realname=request.getParameter("txt_realname");
		int companyid=(Integer.valueOf(request.getParameter("txt_companyid")));
		String sex=request.getParameter("txt_sex");
		String password=request.getParameter("txt_pass");
		String email=request.getParameter("txt_email");
		String phone=request.getParameter("txt_phone");
		String address=request.getParameter("txt_address");
		
		try {
			
			MessageDigest md=MessageDigest.getInstance("MD5");
			
			md.update(password.getBytes(), 0, password.length());
			String encpass=new BigInteger(1,md.digest()).toString(16);
			//System.out.println(encpass);
			
			dto.setId(id);
			dto.setName(name);
			dto.setRealName(realname);
			dto.setComid(companyid);
			dto.setSex(sex);
			dto.setDate(sdf.format(dt));
			dto.setPassword(encpass);
			dto.setEmail(email);
			dto.setPhone(phone);
			dto.setAddress(address);
			dto.setActive(1);
			
			if (dao.insertMember(dto)){
				request.setAttribute("message", "successfull");
				System.out.println("Insert successfully");
			}else{ 
				request.setAttribute("message", "fail");
				System.out.println("Insert fail");
			}

			forward.setRedirect(false);
			forward.setPath("lay_log.ads");
			return forward;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
}
