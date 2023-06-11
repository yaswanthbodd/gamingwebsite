<%@ page import="java.sql.*"%>

<%!
    String name,email,psw,m,p;
%>
<%
    email=request.getParameter("email");
	session.setAttribute("email", email);
    psw=request.getParameter("pwd");

    try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","yash");
		out.println("success connected");
        Statement st= con.createStatement();

        ResultSet rs = st.executeQuery("select * from registers where email like '"+email+"' and password like '"+psw+"'");
	m="boddu4@gmail.com";
	p="Yashsai@2003";
        if(rs.next()){
		if(email.equals(m)&&psw.equals(p)){
		response.sendRedirect("/main_project/display.jsp");
		}else{
            response.sendRedirect("/main_project/home.jsp");
		}
	}
        else
            response.sendRedirect("/main_project/main_login.html");

		 
	}catch(Exception ee)
	{
		ee.printStackTrace();
	}
%>