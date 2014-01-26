<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="dbpackage.*" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Limits</title>
<script type="text/javascript" src="../JavaScript/validate.js"></script>
<script type="text/javascript">
function validate()
{
	with( document.f )
	{
		if(checkPercentage(dp))
			return false;
		if(checkPercentage(da))
			return false;
		if(checkPercentage(hra))
			return false;		
	}
	return true;
}
</script>
</head>
<body background="../Images/bg86.jpeg">
<br><br><br>
<form name="f" method="post" action="updatesalarylimits.jsp" onsubmit="return validate();">
 <table border="0" align="center" cellspacing="20px">
 <caption><b>Salary Percentage Limits</b></caption>
<%
Database d=null;
String dp="",da="",hra="",maxPF="";
int flag=0;
try{
 d = new Database();
	ResultSet rs=d.executeDBQuery("select * from limitpercentages");
	if(rs.next())
	{
		flag=1;   /* to know that the values are there in the database*/
		dp=rs.getString(1);
		da=rs.getString(2);
		hra=rs.getString(3);
	}
	if(flag==0)
	{
	%><caption >No Values in the Database please enter the percentages</caption><%
	}
		%>
		  <tr>
	   		<td><b>Dearness Pay  : </b></td><td><input type="text" value='<%=dp%>' name="dp">  	%</td>
	   </tr> 
	   <tr>
	   		<td><b>Direct Allowance :</b>  </td><td><input type="text" value='<%=da%>' name="da">  %</td>
	   </tr> 
	   <tr>
	   		<td><b>House Rent Allowance  :</b> </td><td><input type="text" value='<%=hra%>' name="hra">  %</td>
	   </tr> 
	   <tr>
	   		<td colspan="2" align="center"><input type="Submit" name="submit" value="Update"> </td>
	   </tr> 
	   </table>
	   </form>
		<%
	d.closeResultSet();
}
catch(Exception e)
{
	out.println("DB ERROR!!!"+e);
	try{
		d.closeConnections();
	}
	catch(Exception a)
	{}
}
%>
</body>
</html>