<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dbpackage.*" %>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Salary Report</title>
</head>
<body background="../Images/bg87.jpeg">
<br><br><br>
<% 
Database db1=new Database();
Database db2=new Database();
ResultSet rs1=null,rs2=null;
String empid=request.getParameter("empid");
int year=Integer.parseInt(request.getParameter("fyear"));
int fmon=Integer.parseInt(request.getParameter("fmonth"));
int lmon=Integer.parseInt(request.getParameter("lmonth"));
int sum=0,i,k=lmon-fmon+1;
String mon[]={"Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec","Jan","Feb","Mar"};
String table="salary"+year+"_"+(year+1);
String query="select ";
for(i=fmon-1;i<lmon;i++)
	if(i==lmon-1)
		query=query+mon[i];
	else
	query=query+mon[i]+",";
query=query+" from freezeacc where year='"+year+"'";
try
{
	rs1=db1.executeDBQuery(query);
	if(rs1.next())
	{
		for(i=1;i<=k;i++)
			if(rs1.getInt(i)!=1)
				throw new Exception("Accounts not freezed for the given months in the financial year");
	}
	else
	{
		throw new Exception("Salary tables not found for the given financial year");
	}
 int s=1;
	for(i=fmon-1;i<lmon;i++)
	{		
    	rs2=db2.executeDBQuery("select ename,designation ,grssal from "+table+" where month='"+mon[i]+"' and empid='"+empid+"'");
    	if(rs2.next())
    	{
    		if(s==1)
    		{    			
    			%>
    			<table align="center" border="1">				    	
    			<caption><b>Salary Report from <%=mon[fmon-1] %> to <%=mon[lmon-1] %>,<%=year %>-<%=year+1 %><br><br></br>
				Name : &nbsp;<%=rs2.getString(1) %><br></br>
				Designation : &nbsp;<%=rs2.getString(2) %></b><br><br>
				</caption>
				<tr>				
				<th width="130px">Month</th>
				<th width="230px">Gross Salary</th>
				</tr>
        		<%
    		s++;
    		}    		
    		out.println("<tr>");    		
    		out.println("<td>"+mon[i]+"</td>");
    		out.println("<td align='right'>"+rs2.getString(3)+"</td>");
    		out.println("</tr>");
    		sum=sum+rs2.getInt(3);
    	}    	
	}
%>
<tr><td><b>Total</b></td><td align="right"><b><%=sum %></b></td></tr>
<tr><td align="center" colspan="5"><input type="Button" value="PRINT" onclick="window.print()"></input></td></tr>
</table>
<%
}
catch(Exception e)
{
	out.println("<br><br><center><b>"+e.getMessage()+"</b><br><br><input type='Button' value='Back' onclick='javascript:history.go(-1)'></center>");
}
%>
</body>
</html>