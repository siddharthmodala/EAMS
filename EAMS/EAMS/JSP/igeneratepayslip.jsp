<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dbpackage.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Generate Pay Slip</title>
</head>
<body background="../Images/bg88.jpeg">
<br><br>
<%
String empid=request.getParameter("empcode");
String month=request.getParameter("month");
int year=Integer.parseInt(request.getParameter("fyear"));
String cl,el;
String table="salary";
table=table+year+"_"+(year+1);
Database db1=new Database();
Database db2=new Database();
ResultSet rs1=null,rs2=null,rs3=null;
try
{
	rs1=db1.executeDBQuery("select "+month+" from freezeacc where year='"+year+"'");
	if(rs1.next())
	{
		if(rs1.getInt(1)!=1)
			throw new Exception("Account details not freezed for the given month in the financial year<br>");			
	}
	else
	{
  		throw new Exception("Salary tables not created for the given financial year<br>");	
	}
	rs1=db1.executeDBQuery("select * from "+table+" where empid='"+empid+"' and month='"+month+"'");
	if(rs1.next())
	{
	rs2=db2.executeDBQuery("select cls,els from leaves where empid='"+empid+"'");
	if(rs2.next())
	{
		cl=rs2.getString(1);
		el=rs2.getString(2);
	}
	else
	{
		cl="N.A.";
		el="N.A.";
	}
	%>
	<table border="0" align="center" cellspacing="3px">
	<tr>
	<th align="center" colspan="6"> VNR VIGNANA JYOTHI INSTITUTE OF ENGINEERING and TECHNOLOGY<br> 
	 Bachupally (Via) Kukatpally, Hyderabad. - 500072.<br>
	 Pay Slip for the month of <%=month %>,<%=year%>-<%=year+1%>.
	 <hr></th>
	</tr>
	<tr>
	<td> <b> EMPLOYEE ID :</b></td><td align="right"><%=rs1.getString(1)%></td>
	<td> <b> NAME :</b></td><td  align="right"><%=rs1.getString(2)%></td>
	<td> <b> DESIGNATION :</b></td><td align="right"><%=rs1.getString(3)%></td>
	</tr>
	<tr>
	<td> <b> C.L.'S : </b></td><td align="right"><%=cl%></td>
	<td> <b> E.L.'S : </b></td><td align="right"><%=el%></td>
	<td>&nbsp;</td><td>&nbsp;</td>
	</tr>
	<tr><th colspan="6"><hr></hr></th></tr>
	<tr>
	<td> <b> BASIC PAY :</b></td><td align="right"><%=rs1.getString(5)%></td>
	<td> <b> IT :</b> </td><td align="right"><%=rs1.getString(14)%></td>
	<td> <b> VEH LOAN  :</b></td><td align="right"><%=rs1.getString(21)%></td>
	</tr>
	<tr>
	<td> <b> DP :</b> </td><td align="right"><%=rs1.getString(6)%></td>
	<td> <b> PF :</b> </td><td align="right"><%=rs1.getString(15)%></td>
	<td> <b> AB LOAN  :</b></td><td align="right"><%=rs1.getString(22)%></td>
	</tr>
	<tr>
	<td> <b> MB :</b></td><td align="right"><%=rs1.getString(7)%></td>
	<td> <b> PTAX :</b> </td><td align="right"><%=rs1.getString(16)%></td>
	<td> <b> TRPT :</b> </td><td align="right"><%=rs1.getString(20)%></td>
	</tr>
	<tr>
	<td> <b> DA :</b> </td><td align="right"><%=rs1.getString(8)%></td>
	<td> <b> LIC  : </b></td><td align="right"><%=rs1.getString(17)%></td>
	<td> <b> LOP : </b></td><td align="right"><%=rs1.getString(19)%></td>	
	</tr>
	<tr>
	<td> <b> HRA :</b> </td><td align="right"><%=rs1.getString(9)%></td>
	<td> <b> GIS :</b></td><td align="right"><%=rs1.getString(18)%></td>
	<td> <b> OTHERS :</b> </td><td align="right"><%=rs1.getString(24)%></td>
	</tr>
	<tr>
	<td> <b> CCA :</b> </td><td align="right"><%=rs1.getString(10)%></td>	
	<td> <b> SOCIETY :</b> </td><td align="right"><%=rs1.getString(23)%></td>
	</tr>
	<tr>
	<td> <b> SPL ALLOW  :</b> </td><td align="right"><%=rs1.getString(11)%></td>	
	</tr>
	<tr>
	<td> <b> ARREARS : </b></td><td align="right"><%=rs1.getString(12)%></td>	
	</tr>
	<tr>
	<td> <b> GROSS PAY : </b></td><td align="right"><%=rs1.getString(13)%></td>
	<td> <b> TOTAL DED :</b> </td><td align="right"><%=rs1.getString(25)%></td>
	<td><b>NET SALARY : </b></td><td align="right"><%=rs1.getString(26)%></td>
	</tr>
	</table>
	<br></br>
<center><input type="Button" value="PRINT" onclick="javascript:window.print()"></input></center>
	
	<%
	}
	else
	{
		out.println(" <center><b>Salary Sheet values not found.</b></center> ");
	}
}
catch(Exception e)
{
	out.println("<center><br><br><b>"+e.getMessage()+"</b></center>");
}
%>
</body>
</html>