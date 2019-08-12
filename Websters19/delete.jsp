<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<html>
<head>
<script src="/scripts/snippet-javascript-console.min.js?v=1"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<%
String driver = "oracle.jdbc.driver.OracleDriver";
String connectionUrl = "jdbc:oracle:thin:@localhost:1521:xe";
String userid = "system";
String password = "Websters";
String fro = session.getAttribute("from").toString();
String to = session.getAttribute("to").toString();
String sem = session.getAttribute("sem").toString();
String branch = session.getAttribute("branch").toString();
String Tablename = branch + fro + to;
String strQuery = "DROP TABLE #tbn";
String query =strQuery.replace("#tbn",Tablename);
session.setAttribute("tablename",Tablename);
out.println("<p>"+query+"</p>");
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
try{ 
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",userid,password); 
response.setContentType("text/html");			
PreparedStatement st=con.prepareStatement(query);
resultSet = st.executeQuery();
if(resultSet != null){
	out.println("<p>excecuted correctely</p>");
}
else
{
	out.println("<p>excecuted incorrectely</p>");
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
