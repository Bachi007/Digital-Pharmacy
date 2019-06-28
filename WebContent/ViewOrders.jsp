<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ViewOrder</title>
<style>
h2{color:black;}
#a{
background-color:#e6ac00;
font-weight:bold;border:3px solid black;
}
#header {
    background-color:#dfbe9f;
    color:black;font-weight:bolder;
    text-align:center;height:120px;
    padding:32px;margin:2px;
}
#nav {
    line-height:100px;font-size:25px;
    background-color:grey;font-color:black;
    height:580px;text-align:left;
    width:160px;
    float:left;border:1px solid grey;
    padding:15px; 
}
#section {
    width:1050px;height:530px;
    float:left;background:url("sve3.png");background-repeat:no-repeat;background-align:right;
    padding:30px;margin:2px;margin-color:black;background-size:320px;background-position:right;
}
#footer {
    background-color:grey;
    color:black;height:20px;
    clear:both;font-size:20px;
    text-align:center;
    padding:5px; 
}
#di
{
width:40px;height:5px;
background-color:#99ccff;
text-color:white;radius:2px;
text-decoration:none;
}
a
{
text-decoration:none;
color:#000000;
}
</style>

</head>
<body id="a">
<div id="nav">
<b  title="NEW STOCK"><a  href="Enter.html">Enter Stock</a></b><br>
<b  title="UPDATE STOCK"><a href="Update.html">Update Stock</a></b><br>
<b  title="REMOVE STOCK"><a href="Remove.html">Remove Stock</a></b><br>
<b  title="QUERIES & SUGGESTIONS"><a href="ViewQueries.jsp">Queries/feeds</a></b><br>
<b  title="LOGOUT SESSION"><a href="Homepage.html">Logout</a></b><br>
</div>
<%
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","paddu.1993");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from orde");
%>
<div id="section">
<h2>The existing orders are as follows..<br><br>
To dispatch an order enter "username" then click dispatch button.</h2>
<form action="Dispatch.jsp" method="post">
Username : <input type="text" title="ENTER USERNAME OF PARTICULAR ORDER" name="Un" placeholder="ORDER'S USERNAME"></input>
<input type="submit" value="DISPATCH" title="CLCIK HERE TO DISPATCH THE ORDERS"></form><br>

<table align="left" border="2">
<th>Username</th><th>Medicine</th><th>Quantity</th><tr>
<%
while(rs.next())
{
%>
<td><%out.print(rs.getString(1)); %>
<td><%out.print(rs.getString(2)); %>
<td><%out.print(rs.getString(3)); %><tr>
</tr>
<%
}
%>
</table>
</div>
<%
}
catch(Exception e)
{
	System.out.println(e);
}
%>

<div id="footer"><marquee style="font-size:20px">Pharmacy Management Systems under the valuable guidance of PROF. M.PADMAVATAMMA Garu (BoS Chairman),
Department Of Computer Science,MCA,SV University,Tirupati.</marquee></div>

</body>
</html>