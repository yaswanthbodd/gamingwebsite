<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<%!
    String name;
%>
<%
  //  out.println("hi sai");
    name=request.getParameter("del1");

    try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","yash");
		out.println("success connected");
		String sql="delete from registers where name=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setString(1, name);
	int row=pstmt.executeUpdate();
		response.sendRedirect("/main_project/display.jsp");
	
	}catch(Exception ee)
	{
		ee.printStackTrace();
	}
%>		