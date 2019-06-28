<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PharmUser</title>
</head>
<body>

<%
String medicinename=request.getParameter("Mn");

try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","paddu.1993");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from ente where name='"+medicinename+"'");
if(rs.next())
{
	String a=rs.getString(2);
    if((medicinename.equals(a)))
		{
    	%><script>window.location="Order2.html";window.alert("Searched  and found medicine sucessfully,move to shop for ordering.");</script>out.print(a);<%
		}	
    
 }

else
{
	%><script language="javascript">window.location="UserLogin.html";window.alert("Search failed,retry again if not found move to query/feedback section and contact admin to add the particular medicine..Thank you");</script><%
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