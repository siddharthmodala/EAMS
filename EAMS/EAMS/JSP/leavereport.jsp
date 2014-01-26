<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dbpackage.*,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Leave Report</title>
</head>
<body >
<br><br>
<%
String vb=request.getParameter("viewsup");
String ctgy=request.getParameter("viewsub");
int i=1;
Database db1=new Database();
Database db2=new Database();
ResultSet rs1=null,rs2=null;
%>
<table align="center" border="1" >
<caption><b>Leave Report<br><br></b></caption>
<tr>
<th >SL.No</th>
<th width="200px">Name of the Employee</th>
<th width="200px">Designation</th>
<th width="90px">Casual leaves</th>
<th width="90px">Earned leaves</th>
<th width="90px">Half pay leaves</th>
<th width="90px">Special casual leaves</th>
<th width="90px">Medical leaves</th>
</tr>
<%
String q1=null,q2=null;
if(vb.equals("All"))	
	q1="select distinct e.empid , e.ename ,e.designation,d.pno from employees e,designations d where e.designation=d.designation order by (d.pno)";
if(vb.equals("Department"))
	q1="select e.empid,e.ename,e.designation from employees e,designations d where e.designation=d.designation and department='"+ctgy+"' order by (d.pno)";
if(vb.equals("Designation"))
{
	if(ctgy.equals("Non-Teaching"))
		q1="select e.empid,e.ename,e.designation from employees e,designations d where e.designation=d.designation and post like '"+ctgy+"%' order by (d.pno)";
	else
		q1="select e.empid,e.ename,e.designation from employees e,designations d where e.designation=d.designation  and post='"+ctgy+"' order by (d.pno)";
}
if(vb.equals("Employee wise"))
{
	String empid=request.getParameter("empid");
	q1="select e.empid,e.ename,e.designation from employees e where e.empid='"+empid+"'";
}
try
{
rs1=db1.executeDBQuery(q1);		
while(rs1.next())
{			
	out.println("<tr>");				
	rs2=db2.executeDBQuery("select * from leaves where empid='"+rs1.getString(1)+"'");
	if(rs2.next())
	{
	out.println("<th align='center'>"+(i++)+"</th>");			
	out.println("<td>"+rs1.getString(2)+"</td>");			
	out.println("<td>"+rs1.getString(3)+"</td>");		
	out.println("<td align='right'>"+rs2.getString(2)+"</td>");	
	out.println("<td align='right'>"+rs2.getString(3)+"</td>");	
	out.println("<td align='right'>"+rs2.getString(4)+"</td>");	
	out.println("<td align='right'>"+rs2.getString(5)+"</td>");	
	out.println("<td align='right'>"+rs2.getString(6)+"</td>");	
	}
	out.println("</tr>");
}
}
catch(Exception e)
{
out.println("<br><br><center><b>"+e.getMessage()+"</b></center>");	
}
finally
{
db1.closeConnections();
db2.closeConnections();
}
%>
<tr><td colspan="8" align="center"><input type="Button" value="Print" onclick="window.print()"></input></td></tr>
</table>
</body>
</html>