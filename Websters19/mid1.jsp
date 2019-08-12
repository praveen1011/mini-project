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
int flag = 0;
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
String sub = request.getParameter("change").toString();
session.setAttribute("subject",sub);
out.println("<p>"+sub+"</p>");
String branch = request.getParameter("branch").toString();
String lt = branch + "login";
String Tablename = "m1" + branch + String.valueOf(sem) + String.valueOf(fro) + String.valueOf(to);
String query = "create table #tbn (rolno varchar2(225),name varchar2(225))";
query = query.replace("#tbn",Tablename);
String query1 = "insert into #tbn (rolno,name) values(?,?)";
query1 = query1.replace("#tbn",Tablename);
String selec = "select * from #tbn";
selec = selec.replace("#tbn",branch + String.valueOf(fro) + String.valueOf(to));
out.println("<p>"+selec+"</p>");
String selec2 = "select * from #tbn where rolno = ?";
selec2 = selec2.replace("#tbn",Tablename); 
session.setAttribute("tablename",Tablename);
out.println("<p>"+query+"</p>");
session.setAttribute("from",fro); 
session.setAttribute("to",to); 
ArrayList roll = new ArrayList();
ArrayList name = new ArrayList();
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css">
<script src="/scripts/snippet-javascript-console.min.js?v=1"></script>
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
                input {
        width: 100%;
        box-sizing: border-box;
}
.dd{
    background-color: rgba(0,0,0,0.5);
    opacity: .9;
    border-radius: 10px;
  width: 300px;
  height: 100px;
  margin: 8px auto;
    top: 50%;
    left: 50%;
    transform: translate(-50%,-50%);
    position: absolute;
    padding: 40px;
}
    h5.pls{
        color: #daf1ff;
    }
    a.pls{
        color: red;
    }
        .btn-success {
    background-color: #1c6288;
    font-size: 19px;
    border-radius: 5px;
    padding: 7px 14px;
    border: 1px solid #daf1ff;
    }
    .btn-success:hover {
    background-color: #13445e;
    border: 1px solid #daf1ff;
    }
</style>
<script src="/scripts/snippet-javascript-console.min.js?v=1"></script>
</head>
<body>
<form id = "follow" action="mid1_1.jsp" method="get">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<input type="hidden" id="players" name = "players"/>
<%
try{ 
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",user,password1);
String log = "SELECT * FROM #tbn where userid=#dt1 AND password=#dt2";
log = log.replace("#tbn",lt);
log = log.replace("#dt1","'"+userid+"'");
log = log.replace("#dt2","'"+password+"'");
PreparedStatement st9=con.prepareStatement(log);
ResultSet rs9 = st9.executeQuery();
if(rs9.next())
{ 
%>
<h1>Mid - 1 Marks sheet</h1>
<table border="1" id="table" class="table">
<thead>
<tr>
<th>RollNumber</th>
<th>Name of the student</th>
<th>Assessment-1</th>
<th>Assessment-2</th>
<th>Mid-1</th>
</tr>
</thead>
<tbody>
<%
flag = flag + 1;
response.setContentType("text/html");			
Statement stmt=con.createStatement();
try{
    int f = stmt.executeUpdate(query);
} catch (Exception e) {
out.println("<p>not appended</p>");
e.printStackTrace();
}	
PreparedStatement st1 = con.prepareStatement(selec);
PreparedStatement st2 = con.prepareStatement(query1);
PreparedStatement st0 = con.prepareStatement(selec2);
ResultSet rs = st1.executeQuery();
while(rs.next()){
%>
<tr>
<td><%=rs.getString("ROLNO")%></td>
<td><%=rs.getString("NAME")%></td>
<%
roll.add(rs.getString("ROLNO"));
name.add(rs.getString("NAME"));
st0.setString(1,rs.getString("ROLNO"));
ResultSet rs1  = st0.executeQuery();
int size=0;
while(rs1.next()){
size++;
}
if(size>0){
}else{    
st2.setString(1,rs.getString("ROLNO"));
st2.setString(2,rs.getString("NAME"));
st2.executeUpdate();
}
%>
<td><input type="text" name="term_3[]" value="00" class="form-control number-only"></td>
<td><input type="text" name="term_4[]" value="00" class="form-control number-only"></td>
<td><input type="text" name="term_5[]" value="00" class="form-control number-only"></td>
</tr>
<%
}
%>
<tr>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
</tbody>
</table>
</form>
<center><button class="btn btn-success" onClick = "submit()">Submit</button></center>
<%
}
session.setAttribute("names",name); 
session.setAttribute("rolls",roll); 
connection.close();
} catch (Exception e) {
if(flag == 0){
%>
<script type="text/javascript">
alert("error!!! wrong password entered please login again");
</script>
<center><a href = 'tlogin.html'><img src = 'wrong.png' style="height: 200px;width: 200px;"></a></center>
<div class = "form-row dd">
<h5 class="pls">Please login again : </h5>&nbsp&nbsp
<h5><a href = 'tlogin.html' class="pls">Click Here!!!</a></h5>
</div>
<%
}
else
{
%>
<script type="text/javascript">
alert("You're logged in!!!");
</script>
<%
}
e.printStackTrace();
}
%>
 <script type="text/javascript">
        function submit() {
            //String f = request.getParameter("attend");
            //alert(f);
            var array = new Array();
            alert("i am here");
            var oTBL = document.getElementById('table')
            for (var x = 1; x < oTBL.rows.length-1; x++) {
                for (var y = 0; y < oTBL.rows[x].cells.length-2; y++) {
                    oTBL.rows[x].cells[y].firstChild.data;
                }
            }
    $('.table :input').on('input', function(e) {
    var cellIdx = $(this).closest('td').index()+1;
    alert(cellIdx);
    var cellsInput = $(this).closest("table tbody").find("tr:not(:last+1) td:nth-child(" + cellIdx + ") :input");
    // reset value 
    cellsInput.each(function (key, r) {
        array.push(+r.value);
    });
});
            
// comput at dom ready each average
$('.table tbody tr:first :input').trigger('input');
var st = JSON.stringify(array);
document.getElementById('players').value = st;
alert(st);
alert("hello"+document.getElementById('players').value);
      document.getElementById("follow").submit();   
 }
</script>
</body>
</html> 