package myads.model.util;

public class Pagination {
	public static int startpage=1;
	public static int endpage=2;
	public static int currentpage=1;
	public static int rowperpage=1;
	public static int totalpage=0;
	public static void countPage(int totalrow){
		if (totalrow % rowperpage == 0){
			totalpage=totalrow/rowperpage;
		}else{
			totalpage=(totalrow/rowperpage)+1;
		}
	}
	
	
}
