<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dbpackage.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Leave Limits</title>
<script language="javascript">
function validate()
{
	with(document.f)
	{
		if(cls.value=="" ||els.value=="" ||hpls.value=="" ||scls.value=="" ||mls.value=="" )
		{
			alert("Fields are empty");
			return false;
		}
		if(isNaN(cls.value) || cls.value<0)
		{
			alert("Enter value in positive numbers only");
			return false;
		}
		if(isNaN(els.value) || els.value<0)
		{
			alert("Enter value in positive numbers only");
			return false;
		}
		if(isNaN(hpls.value)|| hpls.value<0)
		{
			alert("Enter value in positive numbers only");
			return false;
		}
		if(isNaN(scls.value)|| scls.value<0)
		{
			alert("Enter value in positive numbers only");
			return false;
		}
		if(isNaN(mls.value)|| mls.value<0)
		{
			alert("Enter value in positive numbers only");
			return false;
		}
	}
	return true;
}
</script>
</head>
<body background="../Images/bg83.jpeg">
<br><br><br></br>
<form name="f" method="post" action="./updateleavelimits.jsp" onSubmit="return validate()">
<table align="center" cellspacing="20px">
<caption><b>Leave Limits</b></caption>
<%
Database db=new Database();
ResultSet rs=db.executeDBQuery("select * from leavelimits");
String cls="",hpls="",scls="",mls="",els="";
if(rs.next())
{
cls=rs.getString(1);
els=rs.getString(2);
hpls=rs.getString(3);
scls=rs.getString(4);
mls=rs.getString(5);
}
%>
<tr>
<td><b>Casual Leaves</b></td><td><input type="text" name="cls" value="<%=cls%>"></input></td>
</tr>
<tr>
<td><b>Earned Leaves</b></td><td><input type="text" name="els" value="<%=els%>"></input></td>
</tr>
<tr>
<td><b>Half Pay Leaves</b></td><td><input type="text" name="hpls" value="<%=hpls%>"></input></td>
</tr>
<tr>
<td><b>Special Casual Leaves</b></td><td><input type="text" name="scls" value="<%=scls%>"></input></td>
</tr>
<tr>
<td><b>Medical Leaves</b></td><td><input type="text" name="mls" value="<%=mls%>"></input></td>
</tr>
<tr>
<td align="center" colspan="2"><input type="Submit" value="Update" ></input></td>
</tr>
</table>
</form>
</body>
</html>