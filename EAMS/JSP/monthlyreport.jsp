<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dbpackage.*" %>
<%@ page import="java.sql.*" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Monthly Report</title>
</head>
<body >
<%
int year=Integer.parseInt(request.getParameter("fyear"));
String month=request.getParameter("month");
String vb=request.getParameter("viewsup");
String ctgy=request.getParameter("viewsub");
String table="salary"+year+"_"+(year+1);
Database db=new Database();
Database db1=new Database();
ResultSet rs=null,rs1=null;
ResultSetMetaData rsmd=null;
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
%>
<br>
<table align="center" border="1" >
<%
int i,j,k;
try
{
   rs=db.executeDBQuery("select * from "+table);
   rsmd=rs.getMetaData();
   %><caption><b>Salary Statement for the month of <%=month%>,<%=year%>-<%=year+1 %><br><br></b></caption>
   <tr><th>SL.NO.</th><%
   j=rsmd.getColumnCount();
	for(i=1;i<=j;i++)
	{
		if(i!=4)	
	  		out.println("<th>"+rsmd.getColumnName(i)+"</th>");
	}
}
catch(Exception e)
{
     out.println("<br><Br><center><b>Salary Table doesn't exist for the corresponding year</b></center>");
     throw new Exception(e);
}
%>
</tr>
<%
try
{
	i=1;
	String query;
	if(vb.equals("All"))
	{
		query="select t.* from "+table+" t,designations d where month='"+month+"' and t.designation=d.designation order by d.pno";
	}
	else
	{
		query="select t.* from "+table+" t, employees e,designations d ";
		if(vb.equals("Department"))
		{
			query+="where month='"+month+"' and t.empid=e.empid and e.department='"+ctgy+"' and t.designation=d.designation order by d.pno";
			out.println("<b>Department wise - "+ctgy+"</b><br>");
		}
		else if(vb.equals("Post"))
		{
			if(ctgy.equals("Non-Teaching"))
			query+="where month='"+month+"' and t.empid=e.empid and e.post like '"+ctgy+"%' and d.pno like '2%' and t.designation=d.designation order by d.pno";
			else
			query+="where month='"+month+"' and t.empid=e.empid and e.post='"+ctgy+"' and t.designation=d.designation order by d.pno";
			out.println("<b>Post wise - "+ctgy+"</b><br>");
		}
		else if(vb.equals("Designation"))
		{
			query="select * from "+table+" where month='"+month+"' and designation='"+ctgy+"'";
			out.println("<b>Designation wise - "+ctgy+"</b><br>");
		}
	}
	rs=db.executeDBQuery(query);
	rsmd=rs.getMetaData();
	k=rsmd.getColumnCount();
	while(rs.next())
	{
		out.println("<tr><th align='center'>"+(i++)+"</th>");
		for(j=1;j<=k;j++)
		{
			if(j!=4)
				out.println("<td align='center'>"+rs.getString(j)+"</td>");
		}
		out.println("</tr>");
	}
	%>
	<tr><td colspan="26" align="center">
	<input type="button" name="Print" value="Print" onClick="javascript:window.print()">
	</td></tr>
	</table>
	<%
}
catch(Exception e)
{
	out.println("<br><br><center><b>"+e.getMessage()+"</b></center>");	
}
}
catch(Exception e)
{
	out.println("<br><br><center><b>"+e.getMessage()+"</b><br><input type='Button' value='Back' onclick='javascript:history.go(-1)'></center>");	
}
finally
{
	db.closeConnections();
	db1.closeConnections();
}
%>
</body>
</html>