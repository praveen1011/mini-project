<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.*"%>
<%
String userid = request.getParameter("uid");
String password = request.getParameter("psw");
String driver = "oracle.jdbc.driver.OracleDriver";
String connectionUrl = "jdbc:oracle:thin:@localhost:1521:xe";
String database = "test";
String user = "system";
String password1 = "Websters";
int fro = Integer.parseInt(request.getParameter("from"));
int to = Integer.parseInt(request.getParameter("to"));
int sem;
Calendar now = Calendar.getInstance();
int month = now.get(Calendar.MONTH) + 1;
int year = now.get(Calendar.YEAR);
if(month >= 5 && month <= 12)
{
     sem = (year - fro)*2 + 1; 
}
else
{
    sem = (year - fro)*2;
}
String sub = request.getParameterValues("change");
out.println("<P>"+sub+"</p>");
String branch = request.getParameter("branch").toString();
String lt = branch + "login"; 
int flag = 0;
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTMLm  4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
try{ 
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",user,password1);
String log = "SELECT * FROM #tbn where userid=#dt1 AND password=#dt2";
log = log.replace("#tbn",lt);
log = log.replace("#dt1","'"+userid+"'");
log = log.replace("#dt2","'"+password+"'");
PreparedStatement st9=con.prepareStatement(log);
ResultSet rs = st9.executeQuery();
if(rs.next())
{ 
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</head>
</html>