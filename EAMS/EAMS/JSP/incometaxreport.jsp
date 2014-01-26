<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dbpackage.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Income Tax Report</title>
</head>
<body >
<br><br>
<%
int year=Integer.parseInt(request.getParameter("fyear"));
String month=request.getParameter("month");
String table="salary"+ year +"_"+(year+1);
Database db=new Database();
Database db1=new Database();
int sqno=1,sum=0;
try{
	ResultSet rs1=db1.executeDBQuery("select "+month+" from freezeacc where year='"+year+"'");
	if(rs1.next())
	{
		if(rs1.getInt(1)!=1)
			throw new Exception("Account details not freezed for the given month in the financial year<br>");			
	}
	else
	{
  		throw new Exception("Salary tables not created for the given financial year<br>");	
	}		
	ResultSet rs=db.executeDBQuery("select t.empid,t.ename,t.itax from "+table+" t,designations d where month='"+month+"' and t.designation=d.designation order by (d.pno)");	
	%>
	<table align="center" border="1" >
	<caption><b>Income Tax Statement for the month of <%=month%>,<%=year%>-<%=year+1 %><br><br></b></caption>
	<tr>
	<th >SL.No</th>
	<th width="300px">Name of the Employee</th>
	<th width="200px">IncomeTax Amount(Rs.)</th>
	</tr>
	<%
	while(rs.next())
	{		
		if(rs.getInt(3)!=0)
		{
		%>
		<tr>
		<th><%=sqno++%></th>
		<td align="left"><%=rs.getString(2)%></td>
		<td align="right"><%=rs.getString(3)%></td>
		</tr>
		<%
		sum=sum+rs.getInt(3);
		}
	}
%>
<tr><td colspan="2"><b>Total</b></td><td align="right"><%=sum %></td></tr>
</table>
<center><input type="Button" name="Print" value="Print" onClick="window.print()" ></center><br><br>
<%
}
catch(Exception e)
{
	out.println("<br><br><center><b>"+e.getMessage()+"</b><br><input type='Button' value='Back' onclick='javascript:history.go(-1)'></center>");
}
finally
{
	db1.closeConnections();
	db.closeConnections();
}
%>
</body>
</html>