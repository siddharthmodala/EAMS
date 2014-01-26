<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dbpackage.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert Current Salary Details</title>
</head>
<body background="../Images/bg87.jpeg">
<%
float dpp=0,dap=0,hrap=0;
float basic=0,splal=0,itax=0,pf=0,lic=0,gis=0,trpt=0,vehcl=0,abl=0,dp=0,merge=0,da=0,hra=0,cca=0,grssal=0,pt=0,lop=0,totded=0,netsal=0,soc=0,arrs=0,other=0;
String month=request.getParameter("month");
String type=request.getParameter("type");
int year=Integer.parseInt(request.getParameter("year"));
Database db1=new Database();
Database db2=new Database();
Database db3=new Database();
Database db4=new Database();
ResultSet rs1=null,rs2=null,rs3=null;
String query=null,str=null;
try
{
if(type.equals("all"))	
	str="select empid,ename,designation from employees";
else if(type.equals("few"))
	str="select empid,ename,designation from employees where empid not in (select empid from salary"+year+"_"+(year+1)+" where month='"+month+"')";
rs1=db1.executeDBQuery(str);
while(rs1.next())
{
	rs2=db2.executeDBQuery("select * from psaldtls where empid='"+rs1.getString(1)+"'");	
	if( rs2.next())
	{
		basic=rs2.getFloat(2);
		splal=rs2.getFloat(3);
		itax=rs2.getFloat(4);
		pf=rs2.getFloat(5);		
		lic=rs2.getFloat(6);
		gis=rs2.getFloat(7);
		trpt=rs2.getFloat(8);
		vehcl=rs2.getFloat(9);
		abl=rs2.getFloat(10);
		soc=rs2.getFloat(11);
	}
	else
		throw new Exception("Permanent Salary Details doesnot exist.<br><br>Please contact Manager ");
	rs3=db3.executeDBQuery("select * from limitpercentages");
	if(rs3.next())
	{
		dpp=rs3.getFloat(1);
		dap=rs3.getFloat(2);
		hrap=rs3.getFloat(3);
	}
	else
		throw new Exception("Percentage Details doesnot exist.<br><br>Please contact Manager ");
	rs3=db3.executeDBQuery("select paytype from employees where empid='"+rs1.getString(1)+"'");
	rs3.next();
	if(rs3.getString(1).equals("Scaled"))
	{
	dp=Math.round((basic*dpp)/100);
	merge=basic+dp;
	da=Math.round((merge*dap)/100);
	hra=Math.round((merge*hrap)/100);
	rs3=db3.executeDBQuery("select cca from ccascale where "+merge+">=locca and "+merge+"<=hicca ");
	if(rs3.next())
		cca=rs3.getFloat(1);
	else
		throw new Exception("City Compensatory Scale value not found<br><br>Please contact Manager");
	}
	grssal=basic+dp+da+hra+cca+splal+arrs;
	rs3=db3.executeDBQuery("select ptax from ptaxscale where "+grssal+">=lopt and "+grssal+"<=hipt");
	if(rs3.next())
		pt=rs3.getFloat(1);
	else
		throw new Exception("Profession Tax Scale value not found<br><br>Please contact Manager");		
	totded=itax+pf+pt+lic+gis+lop+trpt+vehcl+abl+soc+other;
	netsal=grssal-totded;	
	query="insert into salary"+year+"_"+(year+1)+" values ( '"+rs1.getString(1)+"','"+rs1.getString(2)+"','"+rs1.getString(3)+"','"+month+"',"+basic+","+dp+","+merge+","+da+","+hra+","+cca+","+splal+","+arrs+","+grssal+","+itax+","+pf+","+pt+","+lic+","+gis+","+lop+","+trpt+","+vehcl+","+abl+","+soc+","+other+","+totded+","+netsal+")";
	db4.addDBBatch(query);	
}
try
{
db4.setDBAutoCommit(false);
db4.executeDBBatch();
db4.DBCommit();
}
catch(Exception e)
{
	db4.DBRollback();
	out.println("<br><br><center><b>Unable to insert salary values for this month.</b></center>");
	throw new Exception("");
}
out.println("<br><br><center><b>Salary Sheet values for the month successfully inserted.</b></center>");
out.println("<br><center><b><a href='../Accountant/InsertCurSalDtlsPrompt.html' target='f3'>Back</a></b></center>");
}
catch(Exception e)
{
	out.println("<br><br><center><b>"+e.getMessage()+"</b></center>");
	out.println("<br><center><b><a href='../Accountant/InsertCurSalDtlsPrompt.html' target='f3'>Back</a></b></center>");
}
finally
{
	db4.setDBAutoCommit(true);
}
%>
</body>
</html>