<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DispatchOrder</title>
</head>
<body>
<%
String username=request.getParameter("Un");
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","paddu.1993");
PreparedStatement ps=con.prepareStatement("delete from orde where username='"+username+"'");
int u=ps.executeUpdate();
if(u>0)
{
%>
<script language="javascript">
window.location="ViewOrders.jsp";
window.alert("ORDER DISPATCHED SUCESSFULLY");</script>
<%
}
else
{
	%><script>window.location="ViewOrders.html";window.alert("DISPATCHING FAILED TRY AGAIN.");</script><%
}
con.close();
}
catch(Exception e)
{
System.out.println(e);
}
%>
</body>
</html>