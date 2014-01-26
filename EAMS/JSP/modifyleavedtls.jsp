<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dbpackage.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modify Leave Details</title>
<script type="text/javascript" src="../JavaScript/validate.js"></script>
<script type="text/javascript">
function validate()
{
	with(document.f)
	{
		if(empid.value=="")
		{
			alert("Enter employee id");
			return false;
		}
		if(lvtp.value=="")
		{
			alert("Leave details not available");
			return false;
		}
		if(uls.value=="" || isNaN(uls.value))
		{
			alert("Enter leaves used/gained in numbers");
			return false;
		}		
	}
	return true;
}
function change(m)
{
	alert(" You cannot change this field value . \n\n To Change go back and check Leave details.");
	m.blur();
}	
</script>
</head>
<body background="../Images/bg85.jpeg">
<br><br>
<form name="f" method="post" action="./updateleavedtls.jsp" onSubmit="return validate();">	
<%
Database db=new Database();
String empid=request.getParameter("empid");
String ltype=request.getParameter("ltype");
try
{
ResultSet rs=db.executeDBQuery("select "+ltype+" from leaves where empid='"+empid+"'");
if(rs.next())
{
%>
	<table align="center" cellspacing="15px">
	<caption><b>Modify Leave Details</b><br><br></caption>
	<tr>
	<td><b>Emp ID:</b></td><td><input type="text" name="empid" value="<%=empid%>" onFocus="change(this)"></input></td>
	</tr>
	<tr>
	<td><b><%=ltype%></b></td><td><input type="text" name="lvtp" value="<%=rs.getString(1)%>" onFocus="change(this)"></input></td>	
	</tr>
	<tr>
	<td><b>No. of Leaves :</b></td><td><input type="text" name="uls"></input></td>
	</tr>
	<tr>
	<td><input type="radio" name="ult" value="sub" checked="checked"></input><b>Leaves Spent</b></td>
	<td><input type="radio" name="ult" value="add"></input><b>Leaves Gained</b></td>
	</tr>
	<tr>
	<td colspan="2" align="center"><input type="Submit" value="Update"></input></td>
	</tr>
	</table>
	<input type="hidden" name="ltype" value=<%=ltype%>></input>
<%
}
else
	out.println("<center><b>Leave Details not found in the database</b></center>");
}
catch(Exception e)
{
	out.println("<center><b>"+e.getMessage()+"</b></center>");
}
%>
</form>
</body>
</html>