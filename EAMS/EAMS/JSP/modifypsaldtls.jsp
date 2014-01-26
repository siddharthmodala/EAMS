<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="dbpackage.*" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modify Employee's Permanent Salary Details</title>
<script type="text/javascript" src="../JavaScript/validate.js"></script>
<script type="text/javascript">
function validate()
{
	with(document.f)
	{
		if(isNotNumber(basic,"Invalid Basic Salary!!") | isEmpty(basic,"Basic Salary field is empty!!"))	
			return false;
		if(isNotNumber(splalnce,"Invalid Special Allowance!!") | isEmpty(splalnce,"Special Allowance Field is Empty!!"))	
			return false;
		if(isNotNumber(itax,"Invalid Income tax value!!") | isEmpty(itax,"Income tax field is Empty!!"))	
			return false;
		if(isNotNumber(pf,"Invalid P.F. value!!") | isEmpty(pf,"P.F. field is Empty!!"))	
			return false;
		if(isNotNumber(lic,"Invalid LIC value!!") | isEmpty(lic,"LIC field is Empty!!"))	
			return false;
		if(isNotNumber(gis,"Invalid GIS value!!") | isEmpty(gis,"GIS field is Empty!!"))	
			return false;
		if(isNotNumber(trpt,"Invalid Transport Charges value!!") | isEmpty(trpt,"Transport Charges field is Empty!!"))	
			return false;
		if(isNotNumber(vehicle,"Invalid Vehicle Loan value!!") | isEmpty(vehicle,"Vehicle Loan field is Empty!!"))	
			return false;
		if(isNotNumber(abl,"Invalid ABL value!!") | isEmpty(abl,"ABL field is Empty!!"))	
			return false;	
		if(isNotNumber(soc,"Invalid Society fund value!!") | isEmpty(soc,"Society field is Empty!!"))	
			return false;
		
	}
	return true;
}
function change(button)
{
	if(button.name=="empid")
	{
		alert("you can't change this value");
		button.blur();
	}
}
</script>
</head>
<body background="../Images/bg86.jpeg">
<br><br>
<%
String empcode=request.getParameter("empcode");
Database db=new Database();
ResultSet rs=db.executeDBQuery("select * from psaldtls where empid='"+empcode+"'");
	if (rs.next())
 	{
 %>
<form name="f"  action="./updatepsaldtls.jsp" onSubmit="return validate();">
<table align="center" cellspacing="20px">
<caption><b><u>Employee Permanent Salary Details </u></b><br><br></caption> 
 <%
		String s[]={"Employee ID : ","Basic Salary : "," Special Allowance : ","Income Tax :","Provident Fund : ","LIC : ","Group Insurance Scheme : ","Transport charges : "," Vehicle Loan : ","Andhra bank Loan :","Society :"};
		String sname[]={"empid","basic","splalnce","itax","pf","lic","gis","transport","vehicle","abl","soc"};
			ResultSetMetaData rsmd= rs.getMetaData();
			for( int i=1;i<=rsmd.getColumnCount();i++ )
			{
				%>  
				<tr>
					<td> <b><%=s[i-1]%> </b></td><td><input type="text"  name="<%=sname[i-1]%>" value=<%=rs.getString(i)%> onFocus="change(this)"></td>
				<% 
				if(i==1)
					continue;
				i=i+1;
				  if( i>rsmd.getColumnCount())
					  break;
				%>
				<td></td>	
				<td> <b><%=s[i-1]%> </b></td><td><input type="text"  name="<%=sname[i-1]%>" value=<%=rs.getString(i)%>>
				</tr>
			<%
		   }		
		%>
<tr><td></td><td></td><td align="center"><input type="submit" name="submit" value="Modify"></td></tr>
</table>
</form>
		<%
}
else
	out.println("<center>Employee Code doesn't exist.<br><a href='../AccountsManager/PSalDtlsModify.html'>Back</a></center>");
%>
</body>
</html>