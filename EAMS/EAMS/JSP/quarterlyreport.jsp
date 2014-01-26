<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dbpackage.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Quarterly report</title>
</head>
<body >
<br><br>
<%
String table="salary";
String fyear=request.getParameter("fyear");
String lyear=request.getParameter("lyear");
String value=request.getParameter("month");
String vb=request.getParameter("viewsup");
String ctgy=request.getParameter("viewsub");
table=table+fyear+"_"+lyear;
int i=1,sum=0;
String query=null;
Database db1=new Database();
Database db2=new Database();
Database db3=new Database();
ResultSet rs1=null,rs2=null,rs3=null;
String fm=null,lm=null;
if(value.equals("1"))
{
	fm="April";
	lm="June";
}
else if(value.equals("2"))
{
	fm="July";
	lm="September";
}
else if(value.equals("3"))
{
	fm="October";
	lm="December";
}
else if(value.equals("4"))
{
	fm="January";
	lm="March";
}
try
{	
	String qs=null;
	if(value.equals("1"))
		qs="select apr,may,jun from freezeacc where year='"+fyear+"'";
	else if(value.equals("2"))
		qs="select jul,aug,sep from freezeacc where year='"+fyear+"'";
	else if(value.equals("3"))
		qs="select oct,nov,dec from freezeacc where year='"+fyear+"'";
	else if(value.equals("4"))
		qs="select jan,feb,mar from freezeacc where year='"+fyear+"'";
	rs3=db3.executeDBQuery(qs);
	if(rs3.next())
	{
		for(int j=1;j<4;j++)
			if(rs3.getInt(j)!=1)
				throw new Exception("Account details not freezed for the given months in financial year<br>");			
	}
	else
	{
	  throw new Exception("Salary tables not created for the given financial year<br>");	
	}
%>
	<table align="center" border="1" >
	<caption><b>Quarterly Report from <%=fm%> to <%=lm %> for the financial year <%=fyear%>-<%=lyear%><br><br></b></caption>
	<tr>
	<th >SL.No</th>
	<th width="300px">Name of the Employee</th>
	<th width="250px">Designation</th>
	<th width="200px">Amount(Rs.)</th>
	</tr>
<%
String str="";
	if(vb.equals("All"))
	{		
		str="select distinct t.empid , t.ename , t.designation, d.pno from "+table+" t, designations d  where t.designation=d.designation order by (d.pno)";
	}
	else if(vb.equals("Department"))
	{
		str="select distinct t.empid , t.ename , t.designation,d.pno from "+table+" t, employees e, designations d where t.empid=e.empid and e.department='"+ctgy+"' and  t.designation=d.designation order by (d.pno)";
		out.println("<b>Department wise - "+ctgy+"</b><br>");
	}
	else if(vb.equals("Post"))
	{
		if(ctgy.equals("Non-Teaching"))
			str="select distinct t.empid , t.ename , t.designation,d.pno from "+table+" t, employees e, designations d where t.empid=e.empid and e.post like '"+ctgy+"%'  and t.designation=d.designation order by (d.pno)";
		else
		str="select distinct t.empid , t.ename , t.designation,d.pno from "+table+" t, employees e, designations d where t.empid=e.empid and e.post='"+ctgy+"' and t.designation=d.designation order by (d.pno)";
		out.println("<b>Post wise - "+ctgy+"</b><br>");
	}
	else if(vb.equals("Designation"))
	{
		str="select distinct t.empid , t.ename , t.designation from "+table+" t where t.designation='"+ctgy+"' order by (t.empid)";
		out.println("<b>Designation wise - "+ctgy+"</b><br>");
	}
rs1=db1.executeDBQuery(str);
while(rs1.next())
{
	if(value.equals("1"))
		query="select sum(grssal) from "+table+" where empid='"+rs1.getString(1)+"' and month in('Apr','May','Jun')";
	else if(value.equals("2"))
		query="select sum(grssal) from "+table+" where empid='"+rs1.getString(1)+"' and month in('Jul','Aug','Sep')";
	else if(value.equals("3"))
		query="select sum(grssal) from "+table+" where empid='"+rs1.getString(1)+"' and month in('Oct','Nov','Dec')";	
	else if(value.equals("4"))
		query="select sum(grssal) from "+table+" where empid='"+rs1.getString(1)+"' and month in('Jan','Feb','Mar')";
	out.println("<tr>");
	rs2=db2.executeDBQuery(query); 
	if(rs2.next())
	{
	out.println("<th align='center'>"+(i++)+"</th>");
	out.println("<td>"+rs1.getString(2)+"</td>");
	out.println("<td>"+rs1.getString(3)+"</td>");
	out.println("<td align='right'>"+rs2.getString(1)+"</td>");
	sum=sum+rs2.getInt(1);
	}
	out.println("</tr>");					
}
out.println("<tr><td colspan='3'><b>Total</b></td><td align='right'>"+sum+"</td></tr>");
	%>
	<tr><td colspan="4" align="center"><input type="Button" value="Print" onclick="window.print()"></input></td></tr>
	</table>
	<%
}
catch(Exception e)
{
	out.println("<br><br><center><b>"+e.getMessage()+"</b><br><input type='Button' value='Back' onclick='javascript:history.go(-1)'></center>");	
}
finally
{
	db1.closeConnections();
	db2.closeConnections();
	db3.closeConnections();
}
%>
</body>
</html>