<%@page import="java.sql.*"%>
<%
	try{
 		Class.forName("oracle.jdbc.OracleDriver");
 		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","yash");
 		Statement stmt=con.createStatement();
 		String query="select * from registers";
 		ResultSet rs=stmt.executeQuery(query);
%>
<html>
	<head>
		<title>Database</title>
	</head>
	<body bgcolor="pink">
		<center>
			<h1>Welcome to Admin Login</h1>
			<p>To show All details that are present in the website</p>
			<br><br>
			<h2>Sign up details<h2>
				<table border="5" bgcolor="white">
				<th>
					<tr>
						<td colspan="3" align="center">Login Details</td></tr>
				</th>
				<tr>
					<td>Name</td>
					<td>Email</td>
					<td>Password</td>
				</tr>
<%
	while(rs.next())
	{
%>
	<tr>
		<td><%=rs.getString(1)%></td>
		<td><%=rs.getString(2)%></td>
		<td><%=rs.getString(3)%></td>
	</tr>
<%
	}
%>
</table>
<br>
<br>
<%
 }
catch(Exception e)
{
 out.println(e.toString());
}
%>
