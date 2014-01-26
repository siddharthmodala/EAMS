<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dbpackage.*" %>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Provident Fund Reports</title>
</head>
<body >
<br><br>
<%
int year=Integer.parseInt(request.getParameter("fyear"));
String month=request.getParameter("month");
String table="salary"+ year +"_"+(year+1);
Database db1=new Database();
Database db2=new Database();
ResultSet rs1=null;
int sqno=1,sum=0;
try{
	ResultSet rs2=db2.executeDBQuery("select "+month+" from freezeacc where year='"+year+"'");
	if(rs2.next())
	{
		if(rs2.getInt(1)!=1)
			throw new Exception("Account details not freezed for the given month in the financial year<br>");			
	}
	else
	{
  		throw new Exception("Salary tables not created for the given financial year<br>");	
	}
	rs1=db1.executeDBQuery("select t.empid,t.ename,t.pf from "+table+" t,designations d where month='"+month+"'  and t.designation=d.designation order by (d.pno)");	
	%>
	<table align="center" border="1" >
	<caption><b>Provident Fund Statement for the month of <%=month%>,<%=year%>-<%=year+1%><br><br></b></caption>
	<tr>
	<th >SL.No</th>
	<th width="250px">Name of the Employee</th>	
	<th width="200px">PF Amount(Rs.)</th>
	</tr>
	<%
	while(rs1.next())
	{				
		if(rs1.getInt(3)!=0)
		{
		%>
		<tr>
		<th><%=sqno++%></th>
		<td align="left"><%=rs1.getString(2)%></td>		
		<td align="right"><%=rs1.getString(3) %></td>
		</tr><%
		sum=sum+rs1.getInt(3);
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
	db2.closeConnections();
}
%>
</body>
</html>