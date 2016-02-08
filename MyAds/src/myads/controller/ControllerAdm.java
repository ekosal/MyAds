package myads.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import myads.controller.action.Action;
import myads.controller.action.ActionForward;

/**
 * Servlet implementation class Controller
 */
@WebServlet("*.adm")
public class ControllerAdm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdm() {
        super();
        // TODO Auto-generated constructor stub
    }

    private void doProccess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  	 	 String RequestURI=request.getRequestURI();//-------/myFriendProject/FriendWrite.friend
		 String contextPath=request.getContextPath();//-----/myFriendProject
		 String command=RequestURI.substring(contextPath.length());//----/FriendWrite.friend
		 
		 //System.out.println(command);
		 
		 ActionForward forward=new ActionForward();
		 Action action=null;
		 
		 if (command.equals("/")){
			 
		 }
		 
		 if (command.equals("/home.adm") || command.equals("/")){
			 try{
					forward.setPath("index.jsp");
				}catch(Exception e){
					e.printStackTrace();
				}
			 
			 System.out.println(forward.getPath());
			
		 }
		 
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doProccess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		doProccess(request, response);
	}

}
