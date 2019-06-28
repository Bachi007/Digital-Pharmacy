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
String profession=request.getParameter("Pr");
String name=request.getParameter("Na");
String gender=request.getParameter("Ge");
String age=request.getParameter("Ag");
String rollno=request.getParameter("Ro");
String college=request.getParameter("Col");
String department=request.getParameter("De");
String username=request.getParameter("Us");
String password=request.getParameter("Pa");
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","paddu.1993");
PreparedStatement ps=con.prepareStatement("insert into mahi(profession,name,gender,age,rollno,college,department,username,password)values(?,?,?,?,?,?,?,?,?)");
ps.setString(1,profession);
ps.setString(2,name);
ps.setString(3,gender);
ps.setString(4,age);
ps.setString(5,rollno);
ps.setString(6,college);
ps.setString(7,department);
ps.setString(8,username);
ps.setString(9,password);
int u=ps.executeUpdate();
if(u>0)
{
	%><script language="javascript">
	window.location="User.html";
	window.alert("Registered sucessfully");</script><%
}
con.close();
}
catch(Exception e)
{
%><script language="javascript">window.location="Urf.html";window.alert("Registration failed");</script><%
}
%>
</body>
</html>