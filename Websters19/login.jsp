<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTMLm  4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
     html{
            font:0.75em/1.5 sans-serif;
            color:#333;
            background-color:#fff;
            padding:1em;
        }

        /* Tables */
        table{
            width:100%;
            margin-bottom:1em;
            border-collapse: collapse;
        }
        th{
            font-weight:bold;
            background-color:#ddd;
        }
        th,
        td{
            padding:0.5em;
            border:1px solid #ccc;
        }
</style>
<script src="/scripts/snippet-javascript-console.min.js?v=1"></script>
</head>
<body>
<form id = "log" action="login1.jsp" method="get">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<h1>Retrieve data from database in jsp</h1>
<input type="text" id="players" name = "players"/>
Total attendance : <input type="number" name="total" id = "total" />
<table border="1" id="table" class="table">
<thead>
<tr>
<th>User</th>
<th>Password</th>
</tr>
</thead>
<tbody>
<%
String driver = "oracle.jdbc.driver.OracleDriver";
String connectionUrl = "jdbc:oracle:thin:@localhost:1521:xe";
String database = "test";
String userid = "system";
String password = "Websters";
String fro = session.getAttribute("from").toString();
String to = session.getAttribute("to").toString();
String sem = session.getAttribute("sem").toString();
String branch = session.getAttribute("branch").toString();
String Tablename = branch + "logins";
String strQuery = "CREATE TABLE #tbn (ROLNO VARCHAR2(100),NAME VARCHAR2(100))";
String query =strQuery.replace("#tbn",Tablename);
session.setAttribute("tablename",Tablename);
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
while(rs.next()){
%>
<tr>
<td><input type = "text" value = <%=rs.getString("userid")%>></td>
<td><input type = "text" value = <%=rs.getString("password")%>></td>
</tr>
<%
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</tbody>
</table>
</form>
</body>
</html>

