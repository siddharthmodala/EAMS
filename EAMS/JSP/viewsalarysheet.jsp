<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dbpackage.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title> Salary Sheet </title>
</head>
<body  background="../Images/bg88.jpeg">
<%
Database db=new Database();
ResultSet rs=null;
String table="salary"+request.getParameter("fyear")+"_"+request.getParameter("lyear");
String month=request.getParameter("month");
String ecode=null,query=null;
try
{
if(request.getParameter("ewise")!=null)
{
ecode=request.getParameter("empid");		  
rs=db.executeDBQuery("select * from "+table+" where empid='"+ecode+"' and month='"+month+"'");
	if(rs.next())
	{
	%>
	<br>
	<table border="0" align="center" >
	<caption><b>Salary Sheet for the Month  <%=month%>,<%=request.getParameter("fyear")+"-"+request.getParameter("lyear") %><br><br></b></caption>
	<tr>
	<td>
	<table cellspacing="10px">
	<tr><td> <b> Employee Code  :</b> </td><td align="right"><label><%=rs.getString(1) %></label></td></tr>
	<tr><td> <b> Employee Name :</b> </td><td align="right"><label><%=rs.getString(2) %></label></td></tr>
	<tr><td> <b> Designation  :</b> </td><td align="right"><label><%=rs.getString(3) %></label></td></tr>
	<tr><td> <b> Basic Salary : </b></td><td align="right"><label><%=rs.getString(5) %></label></td></tr>
	<tr><td> <b> Dearness Pay :</b> </td><td align="right"><label><%=rs.getString(6) %></label></td></tr>
	<tr><td> <b> Merged Basic :</b></td><td align="right"><label><%=rs.getString(7) %></label></td></tr>
	<tr><td> <b> Direct Allowance :</b> </td><td align="right"><label><%=rs.getString(8) %></label></td></tr>
	<tr><td> <b> House Rent Allowance :</b> </td><td align="right"><label><%=rs.getString(9) %></label></td></tr>
	<tr><td> <b> City Compensatory Allowance :</b> </td><td align="right"><label><%=rs.getString(10) %></label></td></tr>
	<tr><td> <b> Special Allowance  :</b> </td><td align="right"><label><%=rs.getString(11) %></label></td></tr>
	<tr><td> <b> Arrears : </b></td><td align="right"><label><%=rs.getString(12) %></label></td></tr>
	<tr><td> <b> GROSS Salary : </b></td><td align="right"><label><%=rs.getString(13) %></label></td></tr>
	</table>
	</td>
	<td>
	<table cellspacing="10px">
	<tr><td> <b> Income Tax :</b> </td><td align="right"><label><%=rs.getString(14) %></label></td></tr>
	<tr><td> <b> Provident Fund :</b> </td><td align="right"><label><%=rs.getString(15) %></label></td></tr>
	<tr><td> <b> Profession Tax :</b> </td><td align="right"><label><%=rs.getString(16) %></label></td></tr>
	<tr><td> <b> LIC  : </b></td><td align="right"><label><%=rs.getString(17) %></label></td></tr>
	<tr><td> <b> Group Insurance Scheme (GIS) :</b></td><td align="right"><label><%=rs.getString(18) %></label></td></tr>
	<tr><td> <b> Loss Of Pay : </b></td><td align="right"><label><%=rs.getString(19) %></label></td></tr>
	<tr><td> <b> Transport charges :</b> </td><td align="right"><label><%=rs.getString(20) %></label></td></tr>
	<tr><td> <b> Vehicle Loan  :</b></td><td align="right"><label><%=rs.getString(21) %></label></td></tr>
	<tr><td> <b> Andhra Bank Loan  :</b></td><td align="right"><label><%=rs.getString(22) %></label></td></tr>
	<tr><td> <b> Society :</b> </td><td align="right"><label><%=rs.getString(23) %></label></td></tr>
	<tr><td> <b> Others :</b> </td><td align="right"><label><%=rs.getString(24) %></label></td></tr>
	<tr><td> <b> Total Deductions :</b> </td><td align="right"><label><%=rs.getString(25) %></label></td></tr>
	</table>
	</td>
	</tr>
	<tr>
	<td colspan="4" align="center"><b>NET SALARY : </b><label><%=rs.getString(26) %></label></td>
	</tr>
	<tr></tr>
	<tr><td align="center" colspan="2"><br><input type="button" value="Back" onClick="javascript:history.go(-1);"></input></td></tr>
	</table>
	<%
	}
	else
	{
		out.println("<center><br><br><b>Salary details not available for the given details.</b><br>");
		out.println("<br><input type='button' value='Back' onClick='javascript:history.go(-1);'></input></center>");
	}
}
else
{		  	
	rs=db.executeDBQuery("select t.* from "+table+" t,designations d where month='"+month+"' and t.designation=d.designation order by(d.pno)");
	ResultSetMetaData rsmd=rs.getMetaData();
	int i,j,k=1;
	if(rs.next())
	{
	j=rsmd.getColumnCount();
	%>
	<br>
	<table border="1" align="center" >
	<caption><b>Salary Sheet for the Month  <%=month%>,<%=request.getParameter("fyear")+"-"+request.getParameter("lyear") %><br><br></b></caption>	
	<tr><th>SL.NO.</th>
	<%
	for(i=1;i<=j;i++)
	{
		if(i!=4)	
  			out.println("<th>"+rsmd.getColumnName(i)+"</th>");
	}
	%></tr><%	
	do{		
		out.println("<tr><th align='center'>"+(k++)+"</th>");
		for(i=1;i<=j;i++)
		{
			if(i!=4)
				out.println("<td align='right'>"+rs.getString(i)+"</td>");
		}
		out.println("</tr>");
	}while(rs.next());
	%>
	<tr><td align="center" colspan="26"><br><input type="button" value="Back" onClick="javascript:history.go(-1);"></input></td></tr>
	</table>
	<%
	}
	else
	{
		out.println("<center><br><br><b>Salary details not available for the given details.<br></b>");
		out.println("<br><input type='button' value='Back' onClick='javascript:history.go(-1);'></input></center>");
		
	}	
}
}
catch(Exception e)
{
	out.println("<center><br><Br><b>"+e.getMessage()+" </b><br>");
	out.println("<br><input type='button' value='Back' onClick='javascript:history.go(-1);'></input></center>");
}
%>
</body>
</html>