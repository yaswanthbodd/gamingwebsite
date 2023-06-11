<%@ page import="java.io.*, java.sql.*" %>

<%
  String imageName = request.getPart("image").getSubmittedFileName();
  InputStream imageStream = request.getPart("image").getInputStream();
  
  // Create a connection to the Oracle database
  Connection connection = null;
  PreparedStatement statement = null;
  try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "yash");
  
    // Prepare the SQL statement to insert the image
    String sql = "INSERT INTO imag (image_name, image_data) VALUES (?, ?)";
    statement = connection.prepareStatement(sql);
    statement.setString(1, imageName);
    statement.setBinaryStream(2, imageStream);
  
    // Execute the SQL statement
    statement.executeUpdate();
  
    out.println("Image uploaded successfully!");
  } catch (Exception e) {
    out.println("Error: " + e.getMessage());
  } finally {
    // Close the database connection and resources
    if (statement != null) {
      statement.close();
    }
    if (connection != null) {
      connection.close();
    }
  }
%>
