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
int fro = (int)session.getAttribute("from");
int to = (int)session.getAttribute("to");
String nameList = request.getParameter("players");
String namelist = nameList.replaceAll("\\[", "").replaceAll("\\]","");
String[] nm1 = namelist.split(",");
int j = 0;
int a = 0;
int i = 0;
int l = 0;
int len = nm1.length/3;
ArrayList names = (ArrayList)session.getAttribute("names");
ArrayList rolls = (ArrayList)session.getAttribute("rolls");
String sub = session.getAttribute("subject").toString();
String table = session.getAttribute("tablename").toString();
String query = "ALTER TABLE #tbl ADD (#cl1 number(3),#cl2 number(3),#cl3 number(3))";
query = query.replace("#tbl",table);
query = query.replace("#cl1","a3" + sub);
query = query.replace("#cl2","a4" + sub );
query = query.replace("#cl3","m2" + sub);
out.println("<p>"+query+"</p>");
String intquery = "insert into #tbl (#cl1,#cl2,#cl3) values (?,?,?)";
intquery = intquery.replace("#tbl",table);
intquery = intquery.replace("#cl1","a3" + sub);
intquery = intquery.replace("#cl2","a4" + sub );
intquery = intquery.replace("#cl3","m2" + sub);
out.println("<p>"+intquery+"</p>");
String upquery = "UPDATE #tbl SET #cl1=?,#cl2=?,#cl3=? where rolno=?";
upquery = upquery.replace("#tbl",table);
upquery = upquery.replace("#cl1","a3" + sub);
upquery = upquery.replace("#cl2","a4" + sub );
upquery = upquery.replace("#cl3","m2" + sub);
out.println("<p>"+upquery+"</p>");
String tquery = "select * from #tbl where rolno=?";
tquery = tquery.replace("#tbl",table);
out.println("<p>"+tquery+"</p>");
try {
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
    <th>Name</th>
    <th>Rollno</th>
    <th>Assessment-3</th>
    <th>Assessment-4</th>
    <th>Mid-2</th>
    </tr>
<%
        for(i=0;i<len;i++){
                out.print("<tr>");
                out.print("<td>"+names.get(i)+"</td>");
                out.print("<td>"+rolls.get(i)+"</td>");
                out.print("<td>"+nm1[i]+"</td>");
                out.print("<td>"+nm1[len + i]+"</td>");
                out.print("<td>"+nm1[len*2 + i]+"</td>");
                out.print("</tr>");
}
%>
    </table>
<%
try{ 
i = 0;
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",userid,password); 
response.setContentType("text/html");
Statement stmt=con.createStatement();
try{
    int f = stmt.executeUpdate(query);
} catch (Exception e) {
out.println("<p>not appended</p>");
e.printStackTrace();
}			
while( i != len ){
PreparedStatement st1=con.prepareStatement(tquery); 
st1.setString(1,(String)rolls.get(i)); 
ResultSet rs=st1.executeQuery();
int size=0;
while(rs.next()){
size++;
}
if(size>0){
    out.println("<p>"+size+"</p>");
    PreparedStatement st2=con.prepareStatement(upquery);
                j = Integer.parseInt(nm1[i]);
                st2.setInt(1,j);
                l = Integer.parseInt(nm1[len+i]);
                st2.setInt(2,l);
                a = Integer.parseInt(nm1[len*2+i]);
                st2.setInt(3,a);
                st2.setString(4,(String)rolls.get(i)); 
                st2.executeUpdate();
                i = i+1;
    }
else{
    PreparedStatement st3=con.prepareStatement(intquery); 
                j = Integer.parseInt(nm1[i]);
                st3.setInt(1,j);
                l = Integer.parseInt(nm1[len+i]);
                st3.setInt(2,l);
                a = Integer.parseInt(nm1[len*2+i]);
                st3.setInt(3,a);
                st3.executeUpdate();
                i = i+1;


}
}

connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
<script>
function exportTableToExcel(tableID, filename = ''){
    var downloadLink;
    var dataType = 'application/vnd.ms-excel';
    var tableSelect = document.getElementById(tableID);
    var tableHTML = tableSelect.outerHTML.replace(/ /g, '%20');
    
    // Specify file name
    filename = filename?filename+'.xls':'excel_data.xls';
    
    // Create download link element
    downloadLink = document.createElement("a");
    
    document.body.appendChild(downloadLink);
    
    if(navigator.msSaveOrOpenBlob){
        var blob = new Blob(['\ufeff', tableHTML], {
            type: dataType
        });
        navigator.msSaveOrOpenBlob( blob, filename);
    }else{
        // Create a link to the file
        downloadLink.href = 'data:' + dataType + ', ' + tableHTML;
    
        // Setting the file name
        downloadLink.download = filename;
        
        //triggering the function
        downloadLink.click();
    }
}    
</script>
<button onclick="exportTableToExcel('tblData', 'members-data')">Export Table Data To Excel File</button>
</body>
</html>
