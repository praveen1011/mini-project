<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.*"%>
<%
String driver = "oracle.jdbc.driver.OracleDriver";
String connectionUrl = "jdbc:oracle:thin:@localhost:1521:xe";
String database = "test";
String userid = "system";
String password = "Websters";
String attended,total,percentage;
String fro = session.getAttribute("from").toString();
String to = session.getAttribute("to").toString();
String sem = session.getAttribute("sem").toString();
String branch = session.getAttribute("branch").toString();
String Tablename = branch+ sem + fro + to;
String ref = branch + sem;
String query = "select #dt1,#dt2,#dt3 from #tbn";
query = query.replace("#tbn",Tablename);
String query1 = "select subjects from #tbn where id = ?";
query1 = query1.replace("#tbn","IT");
String query2 = "select faculty,subject from #tbn where code = ?";
query2 = query2.replace("#tbn",branch + "sub");
session.setAttribute("tablename",Tablename);
String chec = "select * from #tbn";
chec = chec.replace("#tbn",branch+ fro + to);
ArrayList attend = new ArrayList();
ArrayList tot = new ArrayList();
ArrayList per = new ArrayList();
ArrayList roll = new ArrayList();
ArrayList name = new ArrayList();
int len = 0;
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
	<title></title>
	<title>GVP</title>
	<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="jquery-3.4.1.min.js"></script>
  <script lang="javascript" src="xlsx.full.min.js"></script>
  <script lang="javascript" src="FileSaver.min.js"></script>
<style type="text/css">
	table{
		text-align: center;
	}
	#vertical th
	{
		height: 250px;
		transform: rotate(-90deg);
		}
	th.rotate{
		height: 250px;
		transform: rotate(-90deg);
	}
</style>
</head>
<body>
<table class="table-bordered" border="1px" id = "tab">
<tr style="height:200px;">
		<th style="width: 10px;">Sl<br>no.</th>
		<th style="width: 10px;">Roll no.</th>
		<th style="width: 10px;">Name</th>
<%
try{ 			
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",userid,password); 
response.setContentType("text/html");
PreparedStatement st0 = con.prepareStatement(chec);	
ResultSet RS0 = st0.executeQuery();
while(RS0.next()){
roll.add(RS0.getString("ROLNO"));
name.add(RS0.getString("NAME"));
}		
PreparedStatement st=con.prepareStatement(query1);
st.setString(1,ref);
ResultSet rs = st.executeQuery();
if(rs.next())
{
String[] s = rs.getString("subjects").split(",");
for(int i = 0;i<s.length;i++)
{	
	String a = s[i];
	String dup = query2.replace("?","'"+a+"'");
	PreparedStatement st1=con.prepareStatement(dup);
	ResultSet rs1 = st1.executeQuery();
	if(rs1.next())
	{
		
		String faculty = rs1.getString("faculty");
		String subject = rs1.getString("subject");

	out.write("<th>"+"<table border='1px'>");
	out.write("<tr >"+"<td colspan='3'>"+faculty +"</td>"+"</tr>");
	out.write("<tr >"+"<td colspan='3'> "+ subject + "</td>"+"</tr>");
	out.write("<tr>");		
				out.write("<th style='transform: rotate(-90deg);height: 250px;'>"+"Attended"+"</th>");
				out.write("<th style='transform: rotate(-90deg);height: 250px;'>"+"Total"+"</th>");
				out.write("<th style='transform: rotate(-90deg);height: 250px;'>"+"Percentage"+"</th>");
	out.write("</table>"+"</th>");	
}
else
{
	continue;
}
}
%>
</tr>
<%
for(int i = 0;i<s.length;i++)
{
	int flag = 1;
	String a = s[i];
	attended = "a"+a;
	total = "t"+a;
	percentage = "p"+a;
	String 	q = query.replace("#dt1",attended);
	q = q.replace("#dt2",total);
	q = q.replace("#dt3",percentage);
	try{
	PreparedStatement st2=con.prepareStatement(q);
	ResultSet rs2 = st2.executeQuery();
	while(rs2.next())
	{
		if(flag == 1)
		{
			len = len + 1;
			flag = 0;
		}
		String at = rs2.getString(attended);
		String t = rs2.getString(total);
		String p = rs2.getString(percentage);
		attend.add(at);
		tot.add(t);
		per.add(p);
	}
}
	catch(Exception e){
	continue;
}
}
int arb =  attend.size()/len;
out.println("<p>"+arb+","+len+"</p>");
for(int  i = 0;i < arb ;i++)
{
	out.write("<tr>");
	out.write("<td>"+i+"</td>");
	out.write("<td>"+roll.get(i)+"</td>");
	out.write("<td>"+name.get(i)+"</td>");
		for(int j = 0;j < len;j++)
	{
		
		out.write("<td>"+"<table border='1px'>");
		out.write("<td width = 50% >"+attend.get(i+j*len)+"</td>");
		out.write("<td width = 20% >"+tot.get(i+j*len)+"</td>");
		out.write("<td width = 50% >"+per.get(i+j*len)+"</td>");
		out.write("</table>"+"</td>");
		
	}
	out.write("</tr>");
}
%>
</table>
<%
}
else
{
	out.println("<center>"+"<h2>"+"Sorry!!! We are facing problems"+"</h2>"+"</center>");
}
connection.close();
}
catch (Exception e) {
e.printStackTrace();
}
%>
<div onclick="exportThis()" style="cursor: pointer; border: 1px solid #ccc; text-align: center;width:19%;">Export Multi Level Table to Excel</div>
<script>
       var exportThis = (function () {  
            var uri = 'data:application/vnd.ms-excel;base64,',   
template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel"  xmlns="http://www.w3.org/TR/REC-html40"><head> <!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets> <x:ExcelWorksheet><x:Name>{worksheet}</x:Name> <x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions> </x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook> </xml><![endif]--></head><body> <table>{table}</table></body></html>',  
                base64 = function (s) {  
                    return window.btoa(unescape(encodeURIComponent(s)))  
                },  
                format = function (s, c) {  
                    return s.replace(/{(\w+)}/g, function (m, p) { return c[p]; })  
                }  
            return function () {  
                var ctx = { worksheet: 'Multi Level Export Table Example' || 'Worksheet', table: document.getElementById("tab").innerHTML }  
                window.location.href = uri + base64(format(template, ctx))  
            }  
        })() 
</script>
</body>
</html>