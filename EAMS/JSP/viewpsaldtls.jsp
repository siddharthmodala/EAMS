<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ page import="dbpackage.*" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Permanent Salary Details</title>
</head>
<body background="../Images/bg88.jpeg">
<br></br><br></br>
<%
		String empcode=request.getParameter("empcode");
		String vtype=request.getParameter("viewtype");		
		Database db1=new Database();
		Database db2=new Database();
		ResultSet rs1=null,rs2=null;
		ResultSetMetaData rsmd=null;
if(vtype.equals("Individual Employee"))
{
		rs1=db1.executeDBQuery("select * from psaldtls where empid='"+empcode+"'");
		rs2=db2.executeDBQuery("select ename from employees where empid='"+empcode+"'");
		String s[]={"Employee ID : ","Employee Name : ","Basic Salary : "," Special Allowance : ","Income Tax : ","Provident Fund : ","LIC : ","Group Insurance Scheme : ","Transport charges : "," Vehicle Loan : ","Andhra bank Loan :","Society : "};
		if(rs2.next())
		{
		 if (rs1.next())
			{
				%><table align="center" border="1" cellpadding="10px">
				<caption><big><u>Employee Permanent Salary Details </u></big><br/><br/><br></caption>
				<tr>
				<th><%=s[0]%></th><td><%=rs1.getString(1)%></td>
				<th><%=s[1]%></th><td><%=rs2.getString(1)%></td>
				</tr>
				<%
				rsmd= rs1.getMetaData();
				for( int i=2;i<=rsmd.getColumnCount();i++ )
				{
					%>  
					<tr>
					<th><%=s[i]%></th><td><%=rs1.getString(i)%></td>
					<% 
					     i=i+1;
					  if( i>rsmd.getColumnCount())
						  break;				  
					%>
					<th><%=s[i]%></th><td><%=rs1.getString(i)%></td>
				 	</tr>
					<%
				}
					%>
					</table>
					<%
			}
		 	else
			{
				 out.println("<br/><br/><center><h4>Employee permanent salary details doesn't exist</h4></center>");
		 	}
		}
		else
		{	
			out.println("<br/><br/><center><h4>Employee ID doesn't exist</h4></center>");
		}
		db2.closeResultSet();
}
else
{	
	String query1=null,query2=null;
	int j=0,s=1;
	if(vtype.equals("All Employees"))									
        query1="select  e.empid,e.ename from employees e,designations d where e.designation=d.designation order by(d.pno)";
	else if(vtype.equals("Teaching"))
        query1="select e.empid,e.ename from employees e,designations d  where post='Teaching' and  e.designation=d.designation order by(d.pno)";
	else if(vtype.equals("Non-Teaching"))
        query1="select e.empid,e.ename from employees  e,designations d where post like 'Non-Teaching%' and  e.designation=d.designation order by(d.pno)";
	else if(vtype.equals("Non-Teaching(Technical)"))
        query1="select e.empid,e.ename from employees e,designations d  where post='Non-Teaching(Technical)' and  e.designation=d.designation order by(d.pno)";
	else if(vtype.equals("Non-Teaching(Non-Technical)"))
        query1="select e.empid,e.ename from employees e,designations d  where post='Non-Teaching(Non-Technical)' and  e.designation=d.designation order by(d.pno)";
	else 
        query1="select e.empid,e.ename from employees e,designations d  where department='"+vtype+"' and e.designation=d.designation order by(d.pno)";
	rs1=db1.executeDBQuery(query1);
	if(rs1.next())
	{
		%>
		<table align="center" border="1" cellpadding="10px">
		<caption><big><u>Employee Permanent Salary Details </u></big><br/><br/><br></caption>
		<%
		rs2=db2.executeDBQuery("select * from psaldtls");
		rsmd=rs2.getMetaData();
		if(rs2.next())
		{	
			out.println("<tr>");
			out.println("<th>SL.No.</th>");
			j=rsmd.getColumnCount();
			for(int i=1;i<=j;i++)
			{
				out.println("<th>"+rsmd.getColumnName(i)+"</th>");
				if(i==1)
					out.println("<th>Name</th>");
			}
			out.println("</tr>");
		}
		do
		{
			query2="select * from psaldtls where empid='"+rs1.getString(1)+"'";
			rs2=db2.executeDBQuery(query2);
			if(rs2.next())
			{
				out.println("<tr>");
				out.println("<th align='center'>"+(s++)+"</th>");
				out.println("<td>"+rs1.getString(1)+"</td>");
				out.println("<td>"+rs1.getString(2)+"</td>");
				for(int i=2;i<=j;i++)
				{
					out.println("<td align='right'>"+rs2.getString(i)+"</td>");						
				}
				out.println("</tr>");				
			}
			else
			{
				out.println("<br/><br/><center><h4>Employees permanent salary details doesn't exist</h4></center>");
			}
			
		}while(rs1.next());
		out.println("<b>"+vtype+"  wise</b><br>");
		%>
		</table>
		<%
	}
	else
	{
		out.println("<br/><br/><center><h4>Employees details doesn't exist</h4></center>");
	}
  }		
%>
<br/>
<center><input type="button" name="Back" value="Back" onclick="javascript:history.go(-1)"></center>
</body>
</html>