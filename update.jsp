<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<%!
    String name,pas,pas1;
%>
<%
  //  out.println("hi sai");
    name=request.getParameter("mail");
	pas=request.getParameter("pass");
	pas1=request.getParameter("pass1");


    try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","yash");
		out.println("success connected");
		String sql="update registers set password=? where name=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	out.println("hello");
        

	if(pas.equals(pas1)){
		pstmt.setString(1,pas);
		pstmt.setString(2,name);
	int row=pstmt.executeUpdate();
		response.sendRedirect("/main_project/main_login.html");
	
	}else{
		response.sendRedirect("/main_project/update.html");
	}


	}catch(Exception ee)
	{
		ee.printStackTrace();
	}
%>		