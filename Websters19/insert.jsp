<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
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
</head>
<body>
<%
String id = request.getParameter("userid");
String driver = "oracle.jdbc.driver.OracleDriver";
String connectionUrl = "jdbc:oracle:thin:@localhost:1521:xe";
String database = "test";
String userid = "system";
String password = "Websters";
String table = session.getAttribute("tablename").toString();
String rollList = request.getParameter("players");
String rolllist = rollList.replaceAll("\\["," ").replaceAll("\\]"," ");
String[] rm = rolllist.split(",");
String nameList = request.getParameter("players1");
String namelist = nameList.replaceAll("\\[", " ").replaceAll("\\]"," ");
String[] nm = namelist.split(",");
String strQuery = "insert into #tbn values(?,?)";
String query =strQuery.replace("#tbn",table);
out.println("<p>"+query+"</p>");
int j = 0;
int a = 0;
int i = 0;
int length = rm.length;
try{
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
    <table border='1' id="tblData">
    <tr>
    <td>Roll</td>
    <td>Name</td>
    </tr>
<%
        for(i=0;i<length;i++){
                out.print("<tr>");
                out.print("<td>"+rm[i].replaceAll("\"", "")+"</td>");
                out.print("<td>"+nm[i].replaceAll("\"", "")+"</td>");
                out.print("</tr>");
}
%>
    </table>
<%
try{ 
i = 0;
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",userid,password); 
response.setContentType("text/html");			
PreparedStatement st=con.prepareStatement(query);
while( i < length ){
                if(rm[i] != null)
                {
                st.setString(1,rm[i].replaceAll("\"", ""));
                st.setString(2,nm[i].replaceAll("\"", ""));
                st.executeUpdate();
                i = i+1;
    }
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
