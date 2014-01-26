<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,dbpackage.*" %>
    	<% 
   Database db1=null,db=null; 	
    	try{
    	db1=new Database();
  	  String empid=request.getParameter("empid");
    	ResultSet rs1=db1.executeDBQuery("select * from employees where empid='"+empid+"'");
	  if(rs1.next())
	  {
		  %>
<br></br>
<table id="table">
<tr>
<th>Sqno.</th><th>Certificate</th><th>Submitted</th><th>Remarks</th>
</tr>
  <%
  int i=1;
	  db=new Database();
  	ResultSet rs=db.executeDBQuery("select * from certificates where empid='"+empid+"'");
	  while(rs.next())
	  {
		  %>
<tr>
	<td><%=i%></td>
	<td><select name='<%="select"+i%>'>
	<option selected><%=rs.getString(2) %> </option>
	<option>S.S.C</option>
	<option>Intermediate/I.T.I</option>
	<option>Diploma</option>
	<option>B.C.A</option>
	<option>B.Sc</option>
	<option>B.Ed</option>
	<option>B.A</option>
	<option>B.Com</option>
	<option>B.E</option>
	<option>B.Tech</option>
	<option>P.G.Diploma</option>
	<option>M.Sc</option>
	<option>M.A</option>
	<option>M.Com</option>
	<option>M.Ed</option>
	<option>MCA</option>
	<option>M.E</option>
	<option>M.Tech</option>
	<option>M.Phil</option>
	<option>Ph.D</option></select>
	</td>
	<td><select name=<%="status"+i%>>
	<option selected><%=rs.getString(3) %></option>
	<option>Yes</option>
	<option>No</option>
	</select>
	</td>
	<td><input type="text" name='<%="remark"+i%>' id='<%="remark"+i%>' value='<%=rs.getString(4)==null?"":rs.getString(4) %>'></input></td>
</tr>
		  <%
		  i++;
	  }
%>
<tr>
	<td><%=i%></td>
	<td><select name='<%="select"+i%>'>
	<option selected>  </option>
	<option>S.S.C</option>
	<option>Intermediate/I.T.I</option>
	<option>Diploma</option>
	<option>B.C.A</option>
	<option>B.Sc</option>
	<option>B.Ed</option>
	<option>B.A</option>
	<option>B.Com</option>
	<option>B.E</option>
	<option>B.Tech</option>
	<option>P.G.Diploma</option>
	<option>M.Sc</option>
	<option>M.A</option>
	<option>M.Com</option>
	<option>M.Ed</option>
	<option>MCA</option>
	<option>M.E</option>
	<option>M.Tech</option>
	<option>M.Phil</option>
	<option>Ph.D</option></select>
	</td>
	<td><select name=<%="status"+i%>>
	<option selected></option>
	<option>Yes</option>
	<option>No</option>
	</select>
	</td>
	<td><input type="text" name='<%="remark"+i%>' id='<%="remark"+i%>'></input></td>
</tr>
</table>
<br></br>
<input type="button" onclick="addRowToTable()" value="New Field"></input>
<input type="button" onclick="removeRowFromTable()" value="Delete Filed"></input>
<br></br><br></br>
<input type="submit" value="Submit Data"></input>
<%
	  }
	  else
	  {
		  out.println("<br><br><b style='color:red'>Employee Id does not exists<b>");
	  }
    	}
    	catch(Exception e)
    	{
    		out.println("<b style='color:red'>Unable to execute the Operation<b>"+e);
    	}
    	finally{
    		if(db1!=null)
    		db1.closeConnections();
    		if(db!=null)
    		db.closeConnections();
    	}
%>

