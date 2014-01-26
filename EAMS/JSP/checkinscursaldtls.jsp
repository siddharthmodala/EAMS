<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dbpackage.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert Current Salary Details</title>
</head>
<body background="../Images/bg87.jpeg">
<%
Database db=new Database();
String year=request.getParameter("fyear");
String month=request.getParameter("month");
ResultSet rs1=null,rs2=null;
int y=Integer.parseInt(year);
try
{
	rs1=db.executeDBQuery("select "+month+" from freezeacc where year='"+year+"'");
	if(rs1.next())
	{
		if(rs1.getInt(1)==1)
		{
			throw new Exception("You cannot insert values as months accounts are freezed");			
		}
		else
		{
			rs2=db.executeDBQuery("select empid from employees where empid not in (select empid from psaldtls)");
			if(rs2.next())
			{
				out.println("<br><br><center><b> Some employees permanent salary details not inserted.<br><br> Please insert those details for the following employee ids.<br><br>");
				out.println("Employee ID's <br><br>");
				do
				{
					out.println(rs2.getString(1)+"<br>");
				}while(rs2.next());				
				out.println("</b></center>");
				out.println("<br><br><br><center><a href='../Accountant/InsertCurSalDtlsPrompt.html' target='f3'><b>Back</b></a></center>");
			}
			else
			{
				rs1=db.executeDBQuery("select * from salary"+y+"_"+(y+1)+" where month='"+month+"'");
				if(rs1.next())
				{
					rs2=db.executeDBQuery("select empid from employees where empid not in (select empid from salary"+y+"_"+(y+1)+" where month='"+month+"')");
					if(rs2.next())
					{
						out.println("<br><br><center><b>Salary details for few employees not inserted.<br><br> Employee IDs<br><br>(If insert, please take care of newly added employees)");
						do {
							out.println("<br>"+rs2.getString(1)+"<br>");
						}while(rs2.next());
						%>
						<form name="f" method="post" action="./insertcursaldtls.jsp" >
						<input type="hidden" name="year" value="<%=year %>"></input>
						<input type="hidden" name="month" value="<%=month %>"></input>
						<input type="hidden" name="type" value="few"></input>
						<input type="Submit"  value="Insert"></input>
						</form>
						<%
						out.println("</b></center>");
					}
					else
					{
					out.println("<br><br><center><b>Salary details already inserted.  Please view the salary sheet or else modify the details. </b></center>");
					out.println("<br><br><center><a href='../Accountant/ViewSalarySheet.html' target='f3'><b>Back</b></a></center>");
					}
				}
				else
				{
				%>
				<form name="f" method="post" action="./insertcursaldtls.jsp" >
				<input type="hidden" name="year" value="<%=year %>"></input>
				<input type="hidden" name="month" value="<%=month %>"></input>
				<input type="hidden" name="type" value="all"></input>				
				</form>
				<script>document.f.submit();</script>
				<%
				}
			}
		}		
	}	
}
catch(Exception e)
{
	out.println("<br><br><center><b>"+e.getMessage()+"</b></center>");
	out.println("<br><br><br><center><a href='../Accountant/InsertCurSalDtlsPrompt.html' target='f3'><b>Back</b></a></center>");
}
%>
</body>
</html>