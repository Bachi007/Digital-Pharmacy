<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
</head>
<body>
<%
try
{
String username=request.getParameter("Un");
String medicine=request.getParameter("Mn");
String quantity=request.getParameter("Qu");
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","paddu.1993");
PreparedStatement ps=con.prepareStatement("insert into orde(username,medicine,quantity)values(?,?,?)");
ps.setString(1,username);
ps.setString(2,medicine);
ps.setString(3,quantity);
int u=ps.executeUpdate();
if(u>0)
{
	%><script language="javascript">
	window.location="Queries.html";
	window.alert("Ordered sucessfully");</script><%
}
con.close();
}
catch(Exception e)
{
%><script language="javascript">window.location="Order2.html";window.alert("Order failed");</script><%
}
%>
</body>
</html>