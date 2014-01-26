<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dbpackage.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Annual Report</title>
</head>
<body >
<br><br>
<%
String table="salary";
String fyear=request.getParameter("fyear");
String lyear=request.getParameter("lyear");
String vb=request.getParameter("viewsup");
String ctgy=request.getParameter("viewsub");
table=table+fyear+"_"+lyear;
int i=1,sum=0;
Database db1=new Database();
Database db2=new Database();
ResultSet rs1=null,rs2=null;
try
{	
	rs1=db1.executeDBQuery("select * from freezeacc where year='"+fyear+"'");
	if(rs1.next())
	{
		for(int j=2;j<14;j++)
			if(rs1.getInt(j)!=1)
				throw new Exception("Account details not freezed for the given financial year<br>");			
	}
	else
	{
	  throw new Exception("Salary tables not created for the given financial year<br>");	
	}
%>
	<table align="center" border="1" >
	<caption><b>Annual Report for the financial year <%=fyear%>-<%=lyear%><br><br></b></caption>
	<tr>
	<th >SL.No</th>
	<th width="300px">Name of the Employee</th>
	<th width="150px">Designation</th>
	<th width="300px">Amount(Rs.)</th>
	</tr>
<%
	if(vb.equals("All"))
	{		
		rs1=db1.executeDBQuery("select distinct t.empid , t.ename , t.designation, d.pno from "+table+" t, designations d where t.designation=d.designation order by (d.pno) ");		
	}
	else if(vb.equals("Department"))
	{
		rs1=db1.executeDBQuery("select distinct t.empid , t.ename , t.designation,d.pno from "+table+" t, employees e, designations d where t.empid=e.empid and e.department='"+ctgy+"' and t.designation=d.designation order by (d.pno) ");
		out.println("<b>Department wise - "+ctgy+"</b><br>");
	}
	else if(vb.equals("Post"))
	{
		String query;
		if(ctgy.equals("Non-Teaching"))
		query="select distinct t.empid , t.ename , t.designation,d.pno from "+table+" t, employees e, designations d where t.empid=e.empid and e.post like '"+ctgy+"%' and t.designation=d.designation order by (d.pno) ";
		else
		query="select distinct t.empid , t.ename , t.designation,d.pno from "+table+" t, employees e,designations d where t.empid=e.empid and e.post='"+ctgy+"' and t.designation=d.designation order by (d.pno) ";
		rs1=db1.executeDBQuery(query);
		out.println("<b>Post wise - "+ctgy+"</b><br>");
	}
	else if(vb.equals("Designation"))
	{
		rs1=db1.executeDBQuery("select distinct(empid), ename , designation from "+table+" where designation='"+ctgy+"'");
		out.println("<b>Designation wise - "+ctgy+"</b><br>");
	}
	while(rs1.next())
	{
		out.println("<tr>");
		rs2=db2.executeDBQuery("select sum(grssal) from "+table+" where empid='"+rs1.getString(1)+"'");
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
}
%>
</body>
</html>