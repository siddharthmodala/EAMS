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
	with(document.f)
	{
	if(year.value=="")
	{
		alert("Select year value");
		return false;
	}
	if(opr.value=="")
	{
		alert("Select type of Operation");
		return false;
	}
	}
}
</script>
</head>
<body background="../Images/bg86.jpeg">
<br><br><br>
<form name="f" method="post" action="./freezeaccprompt.jsp" onSubmit="return validate()" >
<table align="center" cellspacing="20px">
<%
Database db1=new Database();
ResultSet rs1=null;
try
{
	rs1=db1.executeDBQuery("select year from freezeacc");
	if(rs1.next())
	{
		%>
		<caption><b>Enter details to lock or unlock accounts</b></caption>
		<tr>
		<td><b>Financial Year :</b></td>
		<td><select name="year" onchange="setoptions()">
		<option value="0" selected></option>
		<%
		do
		{
			%>
			<option><%=rs1.getString(1)%></option>
			<%
		}while(rs1.next());	
		%>
	</select></td>
	</tr>	
	<tr>
	<td><b>Operation :</b></td>
	<td><select name="opr">
		<option selected></option>
		<option value="1" >Lock</option>
		<option value="0">Unlock</option>
	</select></td>
	</tr>
	<tr><td align="center" colspan="2"><input type="Submit" value="Submit" ></input></td></tr>
		<%
	}
	else
	{
		out.println("<center><b> Financial years not available (created) to freeze </b></center>");
	}
}
catch(Exception e)
{
	out.println(e);
}
%>
</table>
</form>
</body>
</html>

