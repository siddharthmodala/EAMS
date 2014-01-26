<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="dbpackage.*" %>
	<%@ page import="java.sql.*" %>	
	<%@ page import="java.util.*" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CurrentSalaryDetails</title>
<script type="text/javascript" src="../JavaScript/validate.js"></script>
<script language="javascript">
function validate()
{
	with(document.f)
	{ 
		if(isNaN(it.value) || it.value=="" || it.value<0 )
		{		
			alert("Enter Income Tax value !!");
			return false;
	    }
		if(isNaN(soc.value)|| soc.value=="" || soc.value<0)
		{		
			alert("Enter Society value !!");
			return false;
	    }
		if(isNaN(arrs.value)|| arrs.value=="")
		{		
			alert("Enter Arrears value !!");
			return false;
	    }
		if(isNaN(others.value)|| others.value=="" || others.value<0)
		{		
			alert("Enter Others value  !!");
			return false;
	    }
		if(isNaN(ndp.value)|| ndp.value=="" || ndp.value<0|| ndp.value>31)
		{		
			alert("Enter no. of days present value between 0 to 31!!");
			return false;
	    }
	}
	return true;
}
function change(m)
{
	alert(" you cannot change this field value ");
	m.blur();
}
</script>
</head>
<body background="../Images/bg87.jpeg" >
<br></br>
<%
Database db2=new Database();
ResultSet rs2=null;
String emp=request.getParameter("empcode");
int year=Integer.parseInt(request.getParameter("fyear"));
String month=request.getParameter("month");
String it="",soc="",arrs="",other="";
String table="salary"+year+"_"+(year+1);
try
{
try
{
	rs2=db2.executeDBQuery("select "+month+" from freezeacc where year='"+year+"'");
	if(rs2.next())
	{
		if(rs2.getInt(1)==1)
			throw new Exception("Accounts for the month are locked.<br> You cannot modify the details");
	}
	else
	{
		throw new Exception("Salary table details not found in freezeaccounts");
	}
}
catch(Exception e)
{
	throw new Exception(e.getMessage());
}
%>
<br></br>
<form name="f" method="post" action="computecursaldtls.jsp" onSubmit="return validate()">
<%
 	rs2=db2.executeDBQuery("select ename,itax,soc,arrs,others from "+table+" where empid='"+emp+"' and month='"+month+"'");
	if(rs2.next())
	{
		it=rs2.getString(2);
		soc=rs2.getString(3);
		arrs=rs2.getString(4);
		other=rs2.getString(5);
%>
<table border="0" align="center" cellspacing="20px">
<caption><b>Enter Current Salary Details<br></br></b></caption>
<tr>
		<td> <b>Employee Code  :</b> </td>
		<td><input type="text" name="ecode" value="<%=emp%>" onfocus="change(this)" /></td>
		<td><b>Employee Name : </b></td>
		<td><b><%=rs2.getString(1)%></b></td>
</tr>
<tr>
		<td> <b>Income Tax :</b> </td>
		<td><input type="text" name="it" value="<%=it%>" ></td>
		<td><b>Society :</b></td>
		<td><input type="text" name="soc" value="<%=soc%>" ></td>
</tr>
<tr>
		<td><b> Arrears :</b> </td>
		<td><input type="text" name="arrs" value="<%=arrs%>" ></td>
		<td><b>Others :</b></td>
		<td><input type="text" name="others" value="<%=other%>" ></td>
</tr>
<tr>
		<td> <b>No. of Days Present :</b> </td>
		<td><input type="text" name="ndp" ></td>		
</tr>
<tr>
<td><input type="hidden" name="year" value="<%=year %>"></input></td>
<td><input type="hidden" name="month" value="<%=month %>"></input></td>
</tr>
<tr>
		<td colspan="4" align="center"><input type="submit" name="submit" value="Submit"></td>
</tr>
</table>	
</form>
<%
 }
 else
  {
	%>
	<center><br><b>Salary details doesn't exist for the given details.<br><br>
	<a href="../Accountant/ModifyCurSalDtlsPrompt.html" target="f3">Back</a></b></center>
	<%
  }
}
catch(Exception e)
{
	out.println("<center><br><br><b>"+e.getMessage()+"<br><br></b><center>");
	db2.closeConnections();
}
%>
</body>
</html>