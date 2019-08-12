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
String sub = request.getParameter("change").toString();
session.setAttribute("subject",sub);
String branch = request.getParameter("branch").toString();
String lt = branch + "login";
String Tablename = branch + String.valueOf(fro) + String.valueOf(to);
String tb = branch + String.valueOf(sem) + String.valueOf(fro) + String.valueOf(to);
String query = "SELECT * FROM #tbn";
query = query.replace("#tbn",Tablename);
session.setAttribute("tablename",tb);
String ins = "create table #tbn (rolno varchar2(225),name varchar2(225))";
ins = ins.replace("#tbn",tb);
String query1 = "insert into #tbn (rolno,name) values(?,?)";
query1 = query1.replace("#tbn",tb);
String chec = "select * from #tbn where rolno = ?";
chec = chec.replace("#tbn",tb);
session.setAttribute("from",fro); 
session.setAttribute("to",to); 
ArrayList roll = new ArrayList();
ArrayList name = new ArrayList();
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
</head>
<body>
<form id = "follow" action="test1.jsp" method="get">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
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
%>
<center><h1>Attendance sheet</h1></center>
<input type="hidden" id="players" name = "players"/>
Total attendance : <input type="number" name="total" id = "total" onChange="tot()" />
<table border="1" id="table" class="table">
<thead>
<tr>
<th>RollNumber</th>
<th>Name of the student</th>
<th>attended</th>
</tr>
</thead>
<tbody>
<%
response.setContentType("text/html");
Statement stmt=con.createStatement();
flag = flag + 1;
try{
    int f = stmt.executeUpdate(ins);
} catch (Exception e) {
e.printStackTrace();
}			
PreparedStatement st = con.prepareStatement(query);
PreparedStatement st1 = con.prepareStatement(chec);
PreparedStatement st2 = con.prepareStatement(query1);
ResultSet RS1 = st.executeQuery();
while(RS1.next()){
%>
<tr>
<td><%=RS1.getString("ROLNO")%></td>
<td><%=RS1.getString("NAME")%></td>
<%
roll.add(RS1.getString("ROLNO"));
name.add(RS1.getString("NAME"));
st1.setString(1,RS1.getString("ROLNO"));
ResultSet rs1  = st1.executeQuery();
int size=0;
while(rs1.next()){
size++;
}
if(size>0){
}else{    
st2.setString(1,RS1.getString("ROLNO"));
st2.setString(2,RS1.getString("NAME"));
st2.executeUpdate();
}
    %>
<td><input type="text" name="term_3[]" value="" class="form-control number-only"></td>
</tr>
<%
session.setAttribute("names",name); 
session.setAttribute("rolls",roll); 
}
%>
<tr>
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
connection.close();
} catch (Exception e) {
e.printStackTrace();
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
}
%>

 <script type="text/javascript">
        function tot()
        {   
           $('#table th:nth-child(3),#table td:nth-child(3)').remove();
            tbl = document.getElementsByTagName("body")[0];
            var x = document.getElementById("total").value;
            tr = tbl.getElementsByTagName("tr");
            for (i = 0; i < tr.length-1; i++) {
            if(i == 0)
            {
              var th = document.createElement('th');
              var t = document.createTextNode("Total");
              th.appendChild(t);
              tr[i].appendChild(th);
            }
            else{
            var td = document.createElement('td');
            var input = document.createElement('INPUT');
            input.type = 'text';
            input.value = x;
            td.appendChild(input);
            tr[i].appendChild(td);
        }
        }
    }
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