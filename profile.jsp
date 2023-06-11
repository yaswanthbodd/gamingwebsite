<!DOCTYPE html>
<html lang="en">
<%@page import="java.sql.*" %>
    <% String first_name=(String)session.getAttribute("email"); try{ Class.forName("oracle.jdbc.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","yash"); Statement
        stmt=con.createStatement(); String query="select * from registers" ; ResultSet rs=stmt.executeQuery(query); %>

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>profile..</title>
            <style>
                * {
                    margin: 0px;
                    padding: 0px;
                    box-sizing: border-box;
                    background-color: rgb(90, 80, 100);
                }


                div .icon {
                    display: inline-block;
                    border-radius: 100px;
                    padding: 10px;
                    background-color: yellow;
                    margin-top: 60px;
                    margin-left: 200px;
                    height: 200px;
                }

                .desc {
                    margin-left: 200px;
                    color: rgb(45, 226, 84);
                    height: 2rem;
                }
            </style>
        </head>

        <body>
            <a href="index.html" style="text-decoration: none;">
                <li
                    style="color: rgb(222, 29, 29);font-size:30px;padding-left: -30px;text-shadow: 10px 5px 6px red;list-style: none;margin:30px ;">
                    Gamming
                    Room</li>
            </a>
            <div class="profile">
                <div class="im">
                    <img src="img/icon1.png" alt="icon" class="icon">
                </div>
            </div>
            <div class="desc">
                <% PreparedStatement pst1=con.prepareStatement("select * from registers where email='"+first_name+ "'");
            
ResultSet rs1 = pst1.executeQuery();
            while(rs1.next()) {
                %><h3><%out.print(" First Name : "+rs1.getString(1));%></h3><%
                %><h3><%out.print(" Email : "+rs1.getString(2));%></h3><%
                %><h3><%out.print(" Password : "+rs1.getString(3));%></h3><%
            }
%>
</div>

</table>
</body>

</html>
<%
 }
catch(Exception e)
{
 
}
%>