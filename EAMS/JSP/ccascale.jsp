<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="dbpackage.*" %>
   <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="City Compensatory Allowance Scale" content="text/html; charset=ISO-8859-1">
<title>Professional Tax</title>
<script type="text/javascript" src="../JavaScript/validate.js"></script>
<script type="text/javascript">
function validate()
{
	with(document.f)
	{
		if(pt11.value=="" & pt12.value=="" & pt13.value=="")
		;
		else
		{ 
			if(rangeCheck(pt11,pt12) || isEmpty(pt13,"Specify Some value") || isNull(pt13,"Field Cannot be Null"))
			return false;		
			if(isNaN(pt13.value))
			{
				alert("enter scale amount in numbers only");
				return false;
			}	
		}
		if(pt21.value=="" & pt22.value=="" & pt23.value=="");
		else
		{ 
			if(  rangeCheck(pt21,pt22)|| isEmpty(pt23,"Specify Some value") || isNull(pt23,"Field Cannot be Null"))
				return false;
			if(checkBound(pt12,pt21,"Row 1 and Row 2"))
			return false;
			if(isNaN(pt23.value))
			{
				alert("enter scale amount in numbers only");
				return false;
			}	
		}
		if(pt31.value=="" & pt32.value=="" & pt33.value=="");
		else
		{ 
			if(rangeCheck(pt31,pt32)|| isEmpty(pt33,"Specify Some value") || isNull(pt33,"Field Cannot be Null"))
				return false;
			if(checkBound(pt22,pt31,"Row 2 and Row 3"))
			return false;
			if(isNaN(pt33.value))
			{
				alert("enter scale amount in numbers only");
				return false;
			}	
		}
		if(pt41.value=="" & pt42.value=="" & pt43.value=="");
		else
		{
			 if(  rangeCheck(pt41,pt42)|| isEmpty(pt43,"Specify Some value") || isNull(pt43,"Field Cannot be Null"))
				return false;
			if(checkBound(pt32,pt41,"Row 3 and Row 4"))
				return false;
			if(isNaN(pt43.value))
			{
				alert("enter scale amount in numbers only");
				return false;
			}	
		}	
		if(pt51.value=="" & pt52.value=="" & pt53.value=="");
		else 
		{
			if(  rangeCheck(pt51,pt52)|| isEmpty(pt53,"Specify Some value") || isNull(pt53,"Field Cannot be Null"))
				return false;
			if(checkBound(pt42,pt51,"Row 4 and Row 5"))
				return false;
			if(isNaN(pt53.value))
			{
				alert("enter scale amount in numbers only");
				return false;
			}	
		}
		if(pt61.value=="" & pt62.value=="" & pt63.value=="");
		else
		{ 
			if(  rangeCheck(pt61,pt62)|| isEmpty(pt63,"Specify Some value") || isNull(pt63,"Field Cannot be Null"))
				return false;
			if(checkBound(pt52,pt61,"Row 5 and Row 6"))
			return false;
			if(isNaN(pt63.value))
			{
				alert("enter scale amount in numbers only");
				return false;
			}	
		}
		
		if(pt71.value=="" & pt72.value=="" & pt73.value=="");
		else
		{ 
			if(  rangeCheck(pt71,pt72)|| isEmpty(pt73,"Specify Some value") || isNull(pt73,"Field Cannot be Null"))
					return false;
			if(checkBound(pt62,pt71,"Row 6 and Row 7"))
			return false;
			if(isNaN(pt73.value))
			{
				alert("enter scale amount in numbers only");
				return false;
			}	
		}
		if(pt81.value=="" & pt82.value=="" & pt83.value=="");
		else
		{
			 if(  rangeCheck(pt81,pt82)|| isEmpty(pt83,"Specify Some value") || isNull(pt83,"Field Cannot be Null"))
					return false;		
			if(checkBound(pt72,pt81,"Row 7 and Row 8"))
					return false;
			if(isNaN(pt83.value))
			{
				alert("enter scale amount in numbers only");
				return false;
			}	
		}
	}
	return true;
}
</script>
</head>
<body background="../Images/bg86.jpeg">
<br><br><br>
 <form name="f" method="post" action="updatecca.jsp" onsubmit="return validate();">
  <table border="0" align="center">
   <caption> <b>City Compensatory Allowance Scale</b> </caption>
    <tr>
    	<th align="center"><h4>Sq.No</h4></th>
        <th align="center"><h4>Low limit</h4></th> 
	    <th align="center"><h4>High limit</h4></th> 
		<th align="center"><h4> Scale amount</h4></th>
	</tr>
<% 
	Database db=null;
	try{
		db=new Database();
		ResultSet rs=db.executeDBQuery("select * from ccascale order by sqno");
		int i=1;
		if(rs.next())
		{
		do
		{
			%>
			<tr>
			<td><%=rs.getString(1)%></td>
			<td><input type="text" name="pt<%=i%>1"  value=<%=rs.getString(2)%>></td> 
			<td><input type="text" name="pt<%=i%>2" value=<%=rs.getString(3)%>></td> 
			<td><input type="text" name="pt<%=i%>3"  value=<%=rs.getString(4)%>></td>
			</tr>
			<%
			i++;
		}while(rs.next());
		}
		if(i<=8)
		{
					for(;i<=8;i++)
					{
						%>
						<tr>
						<td><%=i%></td>
						<td><input type="text" name="pt<%=i%>1" ></td> 
						<td><input type="text" name="pt<%=i%>2" ></td> 
						<td><input type="text" name="pt<%=i%>3" ></td>
						</tr>
						<%
					}
		}
		%>
		<tr><td colspan="4" align="center"><br></br><input type="submit" value=update /></td></tr>
		</table>
		</form>
		<%
		}
		catch(Exception e)
		{
			out.println("unable to Display the Page."+e);
		}
		finally{
				db.closeConnections();	
		}
%>

</body>
</html>