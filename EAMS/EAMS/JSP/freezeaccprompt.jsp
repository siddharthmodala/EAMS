<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dbpackage.*" %>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Freeze accounts prompt</title>
<script language="javascript">
function validate()
{
	if(document.f.month.value=="")
	{
		alert("Select month value");
		return false;
	}
	return true;
}
</script>
</head>
<body background="../Images/bg86.jpeg">
<br><br><br>
<form name="f" method="post" action="./freezeaccounts.jsp" onSubmit="return validate()">
<table align="center" cellspacing="20px">
<caption><b>Select Month for accounts</b></caption>
<%
Database db2=new Database();
ResultSet rs2=null;
String mon[]={"Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec","Jan","Feb","Mar"};
int i=0,k=0;
String s="<option selected></option>";
String year=request.getParameter("year");
String opr=request.getParameter("opr");
try
{
rs2=db2.executeDBQuery("select * from freezeacc where year='"+year+"'");
if(rs2.next())
{	
	if(opr.equals("0"))
	{
		for(i=1;i<13;i++)
		{
			s=s+"<option ";
			if(rs2.getInt(i+1)==1)			
				s+=">";			
			else
				{
				s+="disabled='disabled'>";
				k++;
				}
			s=s+mon[i-1];
			s=s+"</option>";
		}
		if(k!=12)
			s+="<option>All</option>";
			
	}	
	else if(opr.equals("1"))
	{	
		for(i=1;i<13;i++)
		{
			s=s+"<option ";
			if(rs2.getInt(i+1)==0)
				s+=">";
			else
				{
				s+="disabled='disabled' >";
				k++;
				}
			s=s+mon[i-1];
			s=s+"</option>";
		}
		if(k!=12)
			s+="<option>All</option>";
	}	
}
else
{
		out.println("<center><b> Financial year not available (created) to freeze </b></center>");	
}
%>	
		<tr>
		<td><b>Financial Year :</b></td><td><%=year%>-<%=Integer.parseInt(year)+1%><input type="hidden" name="year" value="<%=year%>"></input></td>
		</tr>
		<tr>
		<td><b>Operation :</b></td><td><%=(opr.equals("1"))?"Lock":"Unlock"%><input type="hidden" name="opr" value="<%=opr %>"></input></td>
		</tr>
		<tr>
		<td><b>Month :</b></td>
		<td><select name="month" ><%=s%></select></td>
		</tr>
		<tr><td align="center" colspan="2"><input type="Submit" value="Submit" ></input></td></tr>
<%		
}
catch(Exception e)
{
	out.println("error");
}
%>
</table>
</form>
</body>
</html>