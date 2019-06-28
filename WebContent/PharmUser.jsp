<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PharmUser</title>
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
<b  title="QUERIES & SUGGESTIONS"><a href="Queries.html">Queries/Feeds</a></b><br>
<b  title="Order"><a href="Order.jsp">Order</a></b><br>
<b  title="LOGOUT SESSION"><a href="Homepage.html">Logout</a></b><br>

</div>
<%
String username=request.getParameter("Us");
String password=request.getParameter("Pa");
String mm="";
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","paddu.1993");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from mahi where username='"+username+"'");
if(rs.next())
{
	mm=rs.getString(2);
	String a=rs.getString(8);
	String b=rs.getString(9);
	if((username.equals(a))&&(password.equals(b)))
			{
		%><script>window.alert("Welcome <%out.print(rs.getString(2));%> your login was sucessful");</script><% %>
<div id="section"><pre><h1>
Welcome Mr/Ms:<%out.print(rs.getString(2));%></h1><h2>
The main purpose of this website was to dispatch the orders of the users
based on  requirement and they can be able to get generic medicine based
on their health condition,so they will get an automatically generated 
prescription that contains all medicine with some advices and suggestions.

Illness:<select onchange="window.location.href=this.value" value="Select an option" title="Select an option">
<option value="Select">SELECT</option>
<option value="Fever.html">FEVER</option>
<option value="Cough.html">COUGH</option>
<option value="Headache.html">HEADACHE</option>
<option value="Bodypains.html">BODYPAINS</option>
<option value="Diarreah.html">DIARREAH</option>
<option value="Cold.html">COLD</option>
<option value="Gastric.html">GASTRIC</option>
<option value="Stomachpain.html">STOMACHPAIN</option>
</select>
<u>
NOTE:</u> In case of emergency you have to visit the nearest health center.
      There you are treated heartly and cured..here you can get prescription
      only for generic medicine..
      Thankyou....</h2>
</pre>
</div><% 
			}
	else
	{
		%><script language="javascript">window.location="User.html";window.alert("Login failed,retry");</script><%
	}
	
}
else
{
	%><script language="javascript">window.location="User.html";window.alert("Login failed,retry");</script><%
}
con.close();
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