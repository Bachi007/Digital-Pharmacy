<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order</title>
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
<b  title="QUERIES"><a href="Queries.html">Queries</a></b><br>
<b  title="HOMEPAGE OR LOGOUT"><a href="Homepage.html">Logout</a></b><br>
</div>
<%
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","paddu.1993");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from ente");
%>
<div id="section">
<h2>Click here for making an <a href="Order2.html"> <BUTTON>ORDER</BUTTON></a></h2>
<script>
window.alert("Hello,welcome to order page,for making an order please note the codes of the medicine and use the codes while making an order");
</script>
<h3>The existing stock details are as folows..<br>
For making an order please note the respective codes of the medicine & use the codes while making an order.</h3>

<table align="left" border="2">
<th>Product</th><th>Medicine</th><th>Price</th><th>Batch</th><th>Code</th><th>Expiry</th><tr>
<%
while(rs.next())
{
%>
<td><%out.print(rs.getString(1)); %>
<td><%out.print(rs.getString(2)); %>
<td><%out.print(rs.getString(3)); %>
<td><%out.print(rs.getString(4)); %>
<td><%out.print(rs.getString(5)); %>
<td><%out.print(rs.getString(6)); %><tr>
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