<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update</title>
</head>
<body>
<%
String a=request.getParameter("Ol");
String b=request.getParameter("Ne");
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","paddu.1993");
Statement st=con.createStatement();
PreparedStatement ps=con.prepareStatement("update ente set name='"+b+"' where name='"+a+"'");
int u=ps.executeUpdate();
if(u>0)
{
%><script>window.location="PharmAdmin.html";window.alert("Updated sucessfully");</script><%
}
else
{
	%><script>window.location="Update.html";window.alert("Updation failed,try again");</script><%
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