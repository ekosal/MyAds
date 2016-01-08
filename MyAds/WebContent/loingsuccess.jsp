<%@page import="myads.model.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    
	    String fail = "";
		if(session.getAttribute("fail")!=null){
			fail = "Incorrect username or password";
			session.removeAttribute("fail");
		}
    
    %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>You have successfully logged in</h2>
<h2>Welcome: <%= session.getAttribute("membername") %></h2>
<a href="lay_log.ads">Logout</a>
</body>
</html>