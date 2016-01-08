package myads.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import myads.model.dto.MemberDto;
import myads.model.sqlConnection.SqlConnection;

public class MemberDao {
static PreparedStatement ps;
static ResultSet rs;

	public ResultSet login(String uname, String password){
		
		String sql="select MemId,Name,RealName,Sex,Date,Password,Email,Phone,Address,Active from tbl_member where Name = ? AND Password = ?";
		try {
			
			ps=SqlConnection.getConnection().prepareStatement(sql);
			ps.setString(1, uname);
			ps.setString(2, password);
			rs=ps.executeQuery();
			
			return rs;
		} catch (Exception e) {
			// TODO: handle exception
			return rs;
		}
		
		
	}

	
	public boolean insertMember(MemberDto dto){
		
		String sql = "insert into tbl_member values(?,?,?,?,?,?,?,?,?,?,?)";
		
		try{
			ps =SqlConnection.getConnection().prepareStatement(sql);  
			ps.setInt(1, dto.getId());
			ps.setString(2, dto.getName());
			ps.setString(3, dto.getRealName());
			ps.setInt(4, dto.getComid());
			ps.setString(5, dto.getSex());
			ps.setString(6, dto.getDate());
			ps.setString(7, dto.getPassword());
			ps.setString(8, dto.getEmail());
			ps.setString(9, dto.getPhone());
			ps.setString(10, dto.getAddress());
			ps.setInt(11, dto.getActive());
			
			ps.executeUpdate();
			ps.close();
			
			return true;
		}catch(SQLException e){
			System.err.println("SQL Error : insert"+ e);
			return false;
		}
	}
}
