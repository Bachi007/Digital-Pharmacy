<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Queries</title>
</head>
<body>
<%
String id=request.getParameter("Ro");
String query=request.getParameter("Qu");

try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","paddu.1993");
PreparedStatement ps=con.prepareStatement("insert into quer(id,query)values(?,?)");
ps.setString(1,id);
ps.setString(2,query);
int u=ps.executeUpdate();
if(u>0)
{
	%><script language="javascript">
	window.location="Homepage.html";
	window.alert("Query sent sucessfully");</script><%
}
con.close();
}
catch(Exception e)
{
%><script language="javascript">window.location="Queries.html";window.alert("Query  submission failed,retry");</script><%
}
%>
</body>
</html>