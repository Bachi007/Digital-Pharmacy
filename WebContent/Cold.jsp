<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Prescription for Cold</title>
<style>
#ab{color:green;}
#a{
padding:5px;background:url("sve2.png");background-repeat:no-repeat;background-position:center;
background-align:center;background-size:300px;
font-weight:bold;border:3px solid black;
}

</style>
</head>
<body id="a" >
<%
String univ=request.getParameter("Na");
String password=request.getParameter("Pa");
String name="";
String gender="";
String age="";

try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","paddu.1993");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from mahi where rollno='"+univ+"'");
if(rs.next())
{
	name=rs.getString(2);
	gender=rs.getString(3);
	age=rs.getString(4);
	String a=rs.getString(5);
	String b=rs.getString(9);
	if((univ.equals(a))&&(password.equals(b)))
	{
		%><script>function uma(){window.print();}</script>
<pre><center>Sri Venkateswara University-Digital Pharmacy</center>
 Name    :<%out.print(name); %>     
 Age     :<%out.print(age); %>         
 UnivId  :<%out.print(a);    %>   
 Gender  :<%out.print(gender); %>
-----------------------------------------------------------------------------------------------
<img src="Rx.png" alt="Na" height="15px"></img>:Prescription for Cold,

          Medicine name                  |   Type    |   Morning    |    Noon    |  Evening |<br>
          Amoxcylin                      |   Tab     |      1       |      -     |      1   |<br>
          Levo-cetrizine                 |   Tab     |      -       |      -     |      1   |<br>
          Cheston cold                   |   Tab     |      1       |      -     |      1   |<br>
          
                                                               
 Remarks:Please,carry this prescription for any assistance.







                                                                    <b id="ab">I.Uma Maheswara Achari</b>
                                                                    Sr.Medical Officer,SVU 
-----------------------------------------------------------------------------------------------
 Suggestions:
 1.Take light food and have a plenty of sleep.
 2.Don't stop running nose and drink warm water.
 3.Follow the prescription carefully and take the medicine at regular intervals.
 NOTE:
 In case of emergency contact nearest hospital,this  digitally generated & 
 need not to be verified.         
                                        Thanking for using Digital Svu...</pre> 
                          <center><button onclick="uma()">Print</button></center>                  
                       <%
                     
}
	else
		{%><script>window.alert("Retry");
		window.location="Cold.html"</script><%
		}
}

con.close();
}
catch(Exception e)
{
	System.out.println(e);
}%>
</body>
</html>