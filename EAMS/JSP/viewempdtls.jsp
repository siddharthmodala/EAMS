<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.util.*" %>
    <%@ page import="dbpackage.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Employees List</title>
</head>
<body background="../Images/bg86.jpeg">

<%
    int c=0;
	Database db= new Database();
    String query=null ,etype,vtype,year,yeartype;
    String months[]={"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
    etype=request.getParameter("emptype");
    vtype=request.getParameter("viewtype");
	if(etype.equals("Resigned Employees"))
		etype="rememployees";
	if(vtype.equals("All Employees"))									
        query="select e.* from "+etype+" e,designations d where e.designation=d.designation ";
	else if(vtype.equals("Teaching"))
        query="select e.* from "+etype+" e,designations d where e.designation=d.designation and post='Teaching'";
	else if(vtype.equals("Non-Teaching"))
        query="select e.* from "+etype+" e,designations d where e.designation=d.designation and post like 'Non-Teaching%'";
	else if(vtype.equals("Non-Teaching(Technical)"))
        query="select e.* from "+etype+" e,designations d where e.designation=d.designation and post='Non-Teaching(Technical)' ";
	else if(vtype.equals("Non-Teaching(Non-Technical)"))
        query="select e.* from "+etype+" e,designations d where e.designation=d.designation and post='Non-Teaching(Non-Technical)' ";
	else 
        query="select e.* from "+etype+" e,designations d where e.designation=d.designation and department='"+vtype+"' ";
	String check=request.getParameter("cbyear");
	if(check!=null)
	{
		year=request.getParameter("year");
	    yeartype=request.getParameter("yeartype");
	    if(vtype.equals("All Employees"))
	    query+=" and to_char("+yeartype+",'yyyy')='"+year+"' order by (d.pno)";
	    else
	    query+=" and to_char("+yeartype+",'yyyy')='"+year+"' order by (d.pno)";
	}	
	else
	{
		query+=" order by (d.pno)";
	}	
	ResultSet rs=db.executeDBQuery(query);
if(rs.next())
{
c=1;
ResultSetMetaData rsmd= rs.getMetaData();
%>
<table align="center"  border="1" >
<caption><br><b><%=vtype%> &nbsp;  <%=etype %></b><br><br></caption>
<tr>
<td><b> SL. No.</b></td>
    <%
    for(int i=1;i<=rsmd.getColumnCount();i++)
    {
    	%>
        <td align="center"><b> <%=rsmd.getColumnName(i)%></b></td>
    	<%
    }
    %>
</tr>
<%   
int j=0;
 do
   	{
	 j++;
  %>	<tr>
          <td align="right"><b><%=j%></b></td>
   		<%
    		for(int i=1;i<=rsmd.getColumnCount();i++)
    		{
    			if(rsmd.getColumnName(i).equals("DOJ")||rsmd.getColumnName(i).equals("DOL"))
    	    	{
    	    		Calendar cal=Calendar.getInstance();
    	    		java.util.Date d = rs.getDate(i);
    				cal.setTime(d);
    				String str=cal.get(Calendar.DATE)+"-"+months[cal.get(Calendar.MONTH)]+"-"+(cal.get(Calendar.YEAR));
    	    	%>
    	    	 <td align="center"> <%=str%></td>
    	    	<%
    	    	}    		  				
    			else
    			{
    			%>
    			   <td align="center"> <%=rs.getString(i)%></td>
    			<%
    			}    				
    		}
    }while(rs.next());
    	%>
    	</tr>
		<%
   	}
    if(c==0)	
    {
    	if(etype.equals("rememployees"))
   		out.println("<br><br><center> <b>There are no Resigned Employees </b> </center><br>");
    	else
    	out.println("<br><br><center> <b>There are no Employees </b> </center><br>");
    	
   	}
%>
</table>
<br/><br/>
		<center><input type="button" name="Back" value="Back" onclick="javascript:history.go(-1)"></center>
</body>
</html>