<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<html>
<head>
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
      @import url(https://fonts.googleapis.com/css?family=Exo+2:400,700,500,300);

body {
  background: #ebeff2;
  font-family: "Exo 2";
}

.zone {      
  margin: auto;
  position: absolute;
  top: 0; left: 0; bottom: 0; right: 0;
  background: radial-gradient(ellipse at center,#EB6A5A 0,#c9402f 100%);
  width:80%;
  height:50%;  
  border:5px dashed white;
  text-align:center;
  color: white;
  z-index: 20;
  transition: all 0.3s ease-out;
  box-shadow: 0 0 0 1px rgba(255,255,255,.05),inset 0 0 .25em 0 rgba(0,0,0,.25);
  .btnCompression {
    .btn {

    } 
    .active {
      background: #EB6A5A;
      color:white;
    }
  }
  i {
    text-align: center;
    font-size: 10em;  
    color:#fff;
    margin-top: 50px;
  }
  .selectFile {
    height: 50px;
    margin: 20px auto;
    position: relative;
    width: 200px;          
  }

  label, input {
    cursor: pointer;
    display: block;
    height: 50px;
    left: 0;
    position: absolute;
    top: 0;
    width: 100%;
    border-radius: 5px;          
  }

  label {
    background: #fff;
    color:#EB6A5A;
    display: inline-block;
    font-size: 1.2em;
    line-height: 50px;
    padding: 0;
    text-align: center;
    white-space: nowrap;
    text-transform: uppercase;
    font-weight: 400;   
    box-shadow: 0 1px 1px gray;
  }

  input[type=file] {
    opacity: 0;
  }

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
.dd1{
    background-color: rgba(0,0,0,0.5);
    opacity: .9;
    border-radius: 10px;
  width: 300px;
  height: 200px;
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
</style>
</head>
<body>
<form id = "follow" action="insert.jsp" method="get">
<script src="jquery-3.4.1.min.js"></script>
<input type="hidden" id="players" name = "players"/>
<input type="hidden" id="players1" name = "players1"/>
   
<%
String driver = "oracle.jdbc.driver.OracleDriver";
String connectionUrl = "jdbc:oracle:thin:@localhost:1521:xe";
String database = "test";
String user = "system";
String password1 = "Websters";
String userid = request.getParameter("id");
String password = request.getParameter("psd");
String fro = request.getParameter("from");
String to = request.getParameter("to");
int flag = 0;
Calendar now = Calendar.getInstance();
int month = now.get(Calendar.MONTH) + 1;
int year = now.get(Calendar.YEAR);
String branch = request.getParameter("branch");
String Tablename = branch + fro + to;
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
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",user,password1);
String log = "SELECT * FROM admins where userid=#dt1 AND password=#dt2";
log = log.replace("#dt1","'"+userid+"'");
log = log.replace("#dt2","'"+password+"'");
PreparedStatement st9=con.prepareStatement(log);
ResultSet rs = st9.executeQuery();
if(rs.next())
{
  flag = flag + 1;
%>
 <div class="dd1">       
      <label for="file">Select file</label>                   
      <input type="file" name="files[]" id="file">
    </div>
<table id = "wrapper"></table>
<% 
response.setContentType("text/html");			
PreparedStatement st=con.prepareStatement(query);
resultSet = st.executeQuery();
if(resultSet != null){
	out.println("<p>Table created</p>");
}
else
{
	out.println("<p>Table exists</p>");
}
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
if(flag == 0){
%>
<script type="text/javascript">
alert("error!!! wrong password entered please login again");
</script>
<center><a href = 'admin.html'><img src = 'wrong.png' style="height: 200px;width: 200px;"></a></center>
<div class = "form-row dd">
<h5 class="pls">Please login again : </h5>&nbsp&nbsp
<h5><a href = 'admin.html' class="pls">Click Here!!!</a></h5>
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
</form>
 <script type="text/javascript">

$('#file').change(function(e){
     var reader = new FileReader();
     reader.readAsArrayBuffer(e.target.files[0]);
     reader.onload = function(e) {
             var data = new Uint8Array(reader.result);
             var wb = XLSX.read(data,{type:'array'});
             var htmlstr = XLSX.write(wb,{type:'binary',bookType:'html'});
             alert(htmlstr);
             $('#wrapper')[0].innerHTML += htmlstr;
             var array = new Array();
             var array1 = new Array();
             alert("i am here");
             var oTBL = document.getElementById('wrapper')
             for (var x = 1; x < oTBL.rows.length; x++) {
             array.push(oTBL.rows[x].cells[0].firstChild.data);
             array1.push(oTBL.rows[x].cells[1].firstChild.data);
             }
             var roll = JSON.stringify(array);
             var name = JSON.stringify(array1);
             document.getElementById('players').value = roll;
             document.getElementById('players1').value = name;
             alert(roll);
             alert(name);
             alert("hello"+document.getElementById('players').value);
             alert("hello"+document.getElementById('players1').value);
                   document.getElementById("follow").submit(); 
             }
});
  
</script>
</body>
</html>