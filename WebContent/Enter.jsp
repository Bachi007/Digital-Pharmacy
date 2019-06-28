<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Enter</title>
</head>
<body>
<%
String product=request.getParameter("Pt");
String name=request.getParameter("Na");
String price=request.getParameter("Pr");
String batch =request.getParameter("Ba");
String code=request.getParameter("Co");
String expiry=request.getParameter("Ex");

try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","paddu.1993");
PreparedStatement ps=con.prepareStatement("insert into ente(product,name,price,batch,code,expiry)values(?,?,?,?,?,?)");
ps.setString(1,product);
ps.setString(2,name);
ps.setString(3,price);
ps.setString(4,batch);
ps.setString(5,code);
ps.setString(6,expiry);
int u=ps.executeUpdate();
if(u>0)
{
%>
<script language="javascript">
window.location="PharmAdmin.html";
window.alert("Details sucessfully entered");</script>
<%
}
con.close();
}
catch(Exception e)
{
	System.out.println(e);
%><script language="javascript">
window.location="Enter.html";
window.alert("Details not entered");</script><%
}

%>
</body>
</html>