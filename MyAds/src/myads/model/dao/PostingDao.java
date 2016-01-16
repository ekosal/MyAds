package myads.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.websocket.Session;

import myads.model.dto.Image;
import myads.model.dto.MainCategoryDto;
import myads.model.dto.MemberDto;
import myads.model.dto.PostingDto;
import myads.model.dto.PostingListDto;
import myads.model.dto.SubCategoryDto;
import myads.model.sqlConnection.SqlConnection;

public class PostingDao {
	DataSource ds;
	Connection con;
	static PreparedStatement ps;
	PreparedStatement psimg;
	static ResultSet rs;
	
	public PostingDao(){
		System.out.println("New!!!!!!!!!!1");
		try{
			Context init = new InitialContext();
	  	    ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
	  		System.out.println("Connection New!!!!!!!!!!1");
		}catch(Exception ex){
			System.out.println("DB Connection Failture! : " + ex);
			return;
		}	
	}
	
	// insert main category
	public boolean insertPosting(PostingDto dto) throws SQLException{
		
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("ddMMyyyy");
		
		String sql = "insert into tbl_posting values(?,?,?,?,?,?,?,?,?,?,?,?)";
		String sqlimage="insert into tbl_image values(?,?,?,?)";
		try{
			SqlConnection.getConnection().setAutoCommit(false);
			ps =SqlConnection.getConnection().prepareStatement(sql);
			psimg =SqlConnection.getConnection().prepareStatement(sqlimage);
			ps.setInt(1, dto.getPostingId());
			ps.setInt(2, dto.getMemId());
			ps.setString(3, dto.getTitle());
			ps.setString(4, dto.getKey());
			ps.setInt(5, dto.getSubCateId());
			ps.setInt(6, dto.getPrice());
			ps.setString(7, dto.getPhone());
			ps.setString(8, dto.getAdr());
			ps.setString(9, dto.getDsc());
			ps.setInt(10, dto.getActive());
			ps.setString(11,sdf.format(dt));
			ps.setString(12, dto.getDiscount());
			ps.executeUpdate();
			
			for(int i=0;i<dto.getPhoto().size();i++){
				psimg.setInt(1, dto.getPhoto().get(i).getImage_id());
				psimg.setInt(2, dto.getPhoto().get(i).getPost_id());
				psimg.setString(3, dto.getPhoto().get(i).getImage());
				psimg.setInt(4, dto.getPhoto().get(i).getOrder());
				psimg.executeUpdate();
			}
			
			SqlConnection.getConnection().commit();
			
			return true;
		}catch(SQLException e){
			System.err.println("SQL Error : insert"+ e);
			return false;
		}
	}
	
	///   list posting
	
	public List<PostingListDto> getPostingList(MemberDto memberDto){
		ResultSet rs=null;
		String sql="select p.PostingId,p.MemId,p.ProductName,p.Price,p.Phone,"+
		"p.Address,p.Description,p.Discount ,i.Image,sc.Name from tbl_posting p INNER JOIN tbl_image i "+
		"on p.PostingId=i.PostingId INNER JOIN tbl_sub_category sc "+
		"on p.SubCateId=sc.SubCateId where i.order=1 and p.MemId=? "		
		+ "GROUP BY p.PostingId ORDER BY p.PostDate DESC";
 
		List<PostingListDto> postinglist=new ArrayList<>();
		
		try {
			System.out.println(" Member Id : "+memberDto.getId());
			ps=SqlConnection.getConnection().prepareStatement(sql);
			ps.setInt(1, memberDto.getId());
			rs=ps.executeQuery();
		    while(rs.next()){
		    	
		    	PostingListDto posintdto=new PostingListDto();
		    	posintdto.setPostingId(rs.getInt("PostingId"));
		    	posintdto.setMemId(rs.getInt("MemId"));
		    	posintdto.setProductName(rs.getString("ProductName"));
		    	posintdto.setPrice(rs.getInt("Price"));
		    	posintdto.setPhone(rs.getString("Phone"));
		    	posintdto.setAdr(rs.getString("Address"));
		    	posintdto.setDsc(rs.getString("Description"));
		    	posintdto.setDiscount(rs.getString("Discount"));
		    	posintdto.setImg(rs.getString("Image"));
		    	posintdto.setSubCateName(rs.getString("Name"));
		    	postinglist.add(posintdto);
		    }
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			postinglist=null;
		}
		return postinglist;
	}
	
	public int countPostingByUser(MemberDto memberDto,String search){
		ResultSet rs=null;
		String sql="select count(*) total from  (select p.PostingId from tbl_posting p INNER JOIN tbl_image i  "
					 +"on p.PostingId=i.PostingId INNER JOIN tbl_sub_category sc "
					 +"on p.SubCateId=sc.SubCateId where i.order=1 and p.MemId=?  "
					 + "and p.ProductName like ? or p.Price like ? OR  "
					 + "p.phone like ? OR p.Address like ? OR p.Description like ?	"
					 + " GROUP BY p.PostingId) as product "	;
		int count=0;
		//System.out.println("Search :"+search);
		try {
			ps=ds.getConnection().prepareStatement(sql);
			ps.setInt(1, memberDto.getId());
			ps.setString(2, "%"+search+"%");
			ps.setString(3, "%"+search+"%");
			ps.setString(4, "%"+search+"%");
			ps.setString(5, "%"+search+"%");
			ps.setString(6, "%"+search+"%");
			rs=ps.executeQuery();
		    while(rs.next()){
		    	count=rs.getInt("total");
		    }
			return count;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		return 0;
	}
	
	public List<PostingListDto> getSearchPostingList(MemberDto memberDto,String search,int start,int ent){
		ResultSet rs=null;
		String sql="select p.PostingId,p.MemId,p.ProductName,p.Price,p.Phone,"+
		"p.Address,p.Description,p.Discount ,i.Image,sc.Name from tbl_posting p INNER JOIN tbl_image i "+
		"on p.PostingId=i.PostingId INNER JOIN tbl_sub_category sc "+
		"on p.SubCateId=sc.SubCateId where i.order=1 and p.MemId=? "
		+ "and p.ProductName like ? or p.Price like ? OR "
		+ "p.phone like ? OR p.Address like ? OR p.Description like ? "		
		+ "GROUP BY p.PostingId ORDER BY p.PostDate DESC";
 
		List<PostingListDto> postinglist=new ArrayList<>();
		
		try {
			System.out.println(" Member Id : "+memberDto.getId() + "search : "+search);
			ps=SqlConnection.getConnection().prepareStatement(sql);
			ps.setInt(1, memberDto.getId());
			ps.setString(2, "%"+search+"%");
			ps.setString(3, "%"+search+"%");
			ps.setString(4, "%"+search+"%");
			ps.setString(5, "%"+search+"%");
			ps.setString(6, "%"+search+"%");
			//System.out.println("PS : "+ps);
			rs=ps.executeQuery();
		    while(rs.next()){
		    	
		    	PostingListDto posintdto=new PostingListDto();
		    	posintdto.setPostingId(rs.getInt("PostingId"));
		    	posintdto.setMemId(rs.getInt("MemId"));
		    	posintdto.setProductName(rs.getString("ProductName"));
		    	posintdto.setPrice(rs.getInt("Price"));
		    	posintdto.setPhone(rs.getString("Phone"));
		    	posintdto.setAdr(rs.getString("Address"));
		    	posintdto.setDsc(rs.getString("Description"));
		    	posintdto.setDiscount(rs.getString("Discount"));
		    	posintdto.setImg(rs.getString("Image"));
		    	posintdto.setSubCateName(rs.getString("Name"));
		    	postinglist.add(posintdto);
		    }
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			postinglist=null;
		}
		return postinglist;
	}
	
	
	public int readCountPage(String category_id){
		int count=0;
		try{
			String sql="select count(*) as total from tbl_posting "
					+ "p INNER JOIN tbl_sub_category sc on p.SubCateId=sc.SubCateId "
					+ "INNER JOIN tbl_category c on c.CateId=sc.CateId INNER JOIN tbl_image "
					+ "i on p.PostingId=i.PostingId WHERE c.CateId=? and p.Active=1 and i.order=1";
		
			ps=ds.getConnection().prepareStatement(sql);
			ps.setInt(1,Integer.valueOf(category_id));
			rs=ps.executeQuery();
			while(rs.next()){
				count=rs.getInt("total");
			}
			return count;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	public List<PostingDto> readProductByCategory(String category_id,int start,int end){
		List<PostingDto> productList=new ArrayList<>();
		try{			
			String sql="select sc.SubCateId,c.CateId,i.Image,p.PostingId,p.ProductName,p.Price,p.Discount,p.KeyNotice from tbl_posting "
					+ "p INNER JOIN tbl_sub_category sc on p.SubCateId=sc.SubCateId "
					+ "INNER JOIN tbl_category c on c.CateId=sc.CateId INNER JOIN tbl_image "
					+ "i on p.PostingId=i.PostingId WHERE c.CateId=? and p.Active=1 and i.order=1  LIMIT ? OFFSET ?";
			
			ps=ds.getConnection().prepareStatement(sql);
			ps.setInt(1,Integer.valueOf(category_id));
			ps.setInt(2, start);
			ps.setInt(3, end);
			rs=ps.executeQuery();
			while(rs.next()){
				PostingDto posting=new PostingDto();
				Image image=new Image();
				MainCategoryDto mainCategory=new MainCategoryDto();
				SubCategoryDto subcategory=new SubCategoryDto();
				image.setImage(rs.getString("Image"));				
				posting.setTitle(rs.getString("ProductName"));
				posting.setKey(rs.getString("KeyNotice"));
				posting.setPostingId(rs.getInt("PostingId"));
				posting.setPrice(rs.getInt("Price"));
				posting.setDiscount(rs.getString("Discount"));
				mainCategory.setId(rs.getInt("CateId"));
				subcategory.setId(rs.getInt("SubCateId"));
				posting.setMainCategory(mainCategory);
				posting.setSubCategory(subcategory);
				posting.setImage(image);
				productList.add(posting);
			}
			return productList;
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	public List<PostingDto> readProductByCategoryAndSubCategory(String category_id,String subCategoryId){
		List<PostingDto> productList=new ArrayList<>();
		try{
			String sql="select sc.SubCateId,c.CateId,i.Image,p.PostingId,p.ProductName,p.Price,p.Discount,p.KeyNotice from tbl_posting "
					+ "p INNER JOIN tbl_sub_category sc on p.SubCateId=sc.SubCateId "
					+ "INNER JOIN tbl_category c on c.CateId=sc.CateId INNER JOIN tbl_image "
					+ "i on p.PostingId=i.PostingId WHERE c.CateId=? and p.Active=1 and i.order=1 and sc.SubCateId=?";
			ps=ds.getConnection().prepareStatement(sql);
			ps.setInt(1,Integer.valueOf(category_id));
			ps.setInt(2,Integer.valueOf(subCategoryId));
			rs=ps.executeQuery();
			while(rs.next()){
				PostingDto posting=new PostingDto();
				Image image=new Image();
				MainCategoryDto mainCategory=new MainCategoryDto();
				SubCategoryDto subcategory=new SubCategoryDto();
				image.setImage(rs.getString("Image"));
				posting.setTitle(rs.getString("ProductName"));
				posting.setPostingId(rs.getInt("PostingId"));
				posting.setPrice(rs.getInt("Price"));
				posting.setKey(rs.getString("KeyNotice"));
				posting.setDiscount(rs.getString("Discount"));
				mainCategory.setId(rs.getInt("CateId"));
				subcategory.setId(rs.getInt("SubCateId"));
				posting.setMainCategory(mainCategory);
				posting.setSubCategory(subcategory);
				posting.setImage(image);
				productList.add(posting);
			}
			return productList;
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	public PostingDto readProductByCategoryAndSubCategory(String category_id,String subCategoryId,String productId){
		PostingDto posting=new PostingDto();	
		try{
			String sql="select p.PostingId,p.ProductName,p.Price,p.Discount,p.KeyNotice from tbl_posting "
					+ "p INNER JOIN tbl_sub_category sc on p.SubCateId=sc.SubCateId "
					+ "INNER JOIN tbl_category c on c.CateId=sc.CateId "
					+ " WHERE c.CateId=? and p.Active=1 and sc.SubCateId=? and p.PostingId=?";
			String sql1 = "select i.image from tbl_image i INNER JOIN tbl_posting p "
					+ "on i.PostingId=p.PostingId where "
					+ "p.PostingId=? ORDER BY i.`order`";
			ps=ds.getConnection().prepareStatement(sql);
			ps.setInt(1,Integer.valueOf(category_id));
			ps.setInt(2,Integer.valueOf(subCategoryId));
			ps.setInt(3, Integer.valueOf(productId));
			rs=ps.executeQuery();
			System.out.println(" Posting Dto "+category_id + "Sub "+subCategoryId+" pro "+productId);	
			while(rs.next()){
			    /*System.out.println(" Posting Dto 123");	*/
				/*MainCategoryDto mainCategory=new MainCategoryDto();
				SubCategoryDto subcategory=new SubCategoryDto();*/			
				
				PreparedStatement ps1=ds.getConnection().prepareStatement(sql1);
				ResultSet rs1=null;
				ps1.setInt(1, Integer.valueOf(productId));
				rs1=ps1.executeQuery();
				
				List<Image> imageList=new ArrayList<>();
				while(rs1.next()){
					Image image=new Image();
					image.setImage(rs1.getString("image"));
					imageList.add(image);
				}
				posting.setTitle(rs.getString("ProductName"));
				posting.setPostingId(rs.getInt("PostingId"));
				posting.setPrice(rs.getInt("Price"));
				posting.setKey(rs.getString("KeyNotice"));
				posting.setDiscount(rs.getString("Discount"));
				posting.setImageList(imageList);
				
			}
			return posting;
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	

}
