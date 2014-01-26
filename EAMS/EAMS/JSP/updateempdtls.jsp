<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="dbpackage.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Details Update</title>
</head>
<body background='../Images/bg83.jpeg'>
<%
String empid=request.getParameter("empid");
String post=request.getParameter("post");
String dept=request.getParameter("dept");
String designation=request.getParameter("designation");
String doj=request.getParameter("doj")+"-"+request.getParameter("moj")+"-"+request.getParameter("yoj");
String ename=request.getParameter("ename");
String sex=request.getParameter("sex");
String fname=request.getParameter("fname");
String mname=request.getParameter("mname");
String dob=request.getParameter("dob")+"-"+request.getParameter("mob")+"-"+request.getParameter("yob");
String bgp=request.getParameter("bgp");
String caste=request.getParameter("caste");
String religion=request.getParameter("religion");
String caddr=request.getParameter("caddr");
String paddr=request.getParameter("paddr");
String phno=request.getParameter("phno");
String cellno=request.getParameter("cellno");
String emailid=request.getParameter("emailid");
String photo=request.getParameter("photo");
String sbacno=request.getParameter("sbacno");
String pfno=request.getParameter("pfno");
String panno=request.getParameter("panno");
String paytype=request.getParameter("paytype");
String scale=request.getParameter("scale");
String basic=request.getParameter("basic");
String moi=request.getParameter("moi");
String spec=request.getParameter("spec");
String te=request.getParameter("te");
String ie=request.getParameter("ie");
String oe=request.getParameter("oe");
String re=request.getParameter("re");
String ve=request.getParameter("ve");

String rep="''";
String ch="'";
caddr=caddr.replaceAll(ch,rep);
paddr=paddr.replaceAll(ch,rep);
spec=spec.replaceAll(ch,rep);
caste=caste.replaceAll(ch,rep);
religion=religion.replaceAll(ch,rep);
Database db=null;
try
{
 db=new Database();
String query=" update employees set "
	+"post='"+post+"',"
	+"department='"+dept+"',"
 	+"designation='"+designation+"',"
 	+"doj='"+doj+"',"
 	+"ename='"+ename+"',"
 	+"sex='"+sex+"',"
 	+"fname='"+fname+"',"
 	+"mname='"+mname+"',"
 	+"dob='"+dob+"',"
 	+"bloodgroup='"+bgp+"',"
 	+"caste='"+caste+"',"
 	+"religion='"+religion+"',"
 	+"caddress='"+caddr+"',"
 	+"paddress='"+paddr+"',"
 	+"phno='"+phno+"',"
 	+"cellno='"+cellno+"',"
	+"emailid='"+emailid+"',"
	+"photo='"+photo+"',"
	+"sbac='"+sbacno+"',"
 	+"pfno='"+pfno+"',"
 	+"panno='"+panno+"',"
 	+"paytype='"+paytype+"',"
 	+"scale='"+scale+"',"
 	+"basic='"+basic+"',"
	+"moi='"+moi+"',"
 	+"specializations='"+spec+"',"
 	+"teachingexp='"+te+"',"
 	+"industrialexp='"+ie+"',"
 	+"otherexp='"+oe+"',"
 	+"researchexp='"+re+"'," 		
 	+"vnrvjietexp='"+ve+"'"				
  	+" where empid='"+empid+"'";
db.executeDBUpdate(query);
db.closeConnections();
out.println("<br><br><br><br><br><br><h4><center>Employee Details Successfully Updated<br><br>");
out.println("<a href='../Establishment/EmployeeModify.html'>Click here to go Back</a></center></h4></body>");
}
catch(Exception e)
{
	out.println("<center><br><br><br><b>Unable to Update Employee Details</b><br><br><a href='../Establishment/EmployeeModify.html'>Click here to go Back</a></center>"+e);
	db.closeConnections();
}
%>
</body>
</html>