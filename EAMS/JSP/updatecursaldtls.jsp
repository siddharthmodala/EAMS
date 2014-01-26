<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="dbpackage.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert Current Salary Details</title>
</head>
<body background="../Images/bg87.jpeg">
<br><br>
<%
Database db=new Database();
String ecode=request.getParameter("ecode");
String ename=request.getParameter("ename");
String desig=request.getParameter("designation");
String month=request.getParameter("month");
int basic=Integer.parseInt(request.getParameter("basic"));
int dp=Integer.parseInt(request.getParameter("dp"));
int merge=Integer.parseInt(request.getParameter("mergesal"));
int da=Integer.parseInt(request.getParameter("da"));
int hra=Integer.parseInt(request.getParameter("hra"));
int cca=Integer.parseInt(request.getParameter("cca"));
int splalnce=Integer.parseInt(request.getParameter("splalnce"));
int arrs=Integer.parseInt(request.getParameter("arrs"));
int tgs=Integer.parseInt(request.getParameter("tgs"));
int itx=Integer.parseInt(request.getParameter("itx"));
int pf=Integer.parseInt(request.getParameter("pf"));
int ptx=Integer.parseInt(request.getParameter("ptx"));
int lic=Integer.parseInt(request.getParameter("lic"));
int gis=Integer.parseInt(request.getParameter("gis"));
int lop=Integer.parseInt(request.getParameter("lop"));
int trpt=Integer.parseInt(request.getParameter("trpt"));
int vhcle=Integer.parseInt(request.getParameter("vhcle"));
int abl=Integer.parseInt(request.getParameter("abl"));
int soc=Integer.parseInt(request.getParameter("soc"));
int others=Integer.parseInt(request.getParameter("others"));
int td=Integer.parseInt(request.getParameter("td"));
int ns=Integer.parseInt(request.getParameter("ns"));
int year=Integer.parseInt(request.getParameter("year"));
String table="salary"+year+"_"+(year+1);
try
{    
	db.setDBAutoCommit(false);
    db.executeDBUpdate("delete from "+table+" where empid='"+ecode+"' and month='"+month+"'");
    db.executeDBUpdate("insert into "+table+" values('"+ecode+"','"+ename+"','"+desig+"','"+month+
 		  "',"+basic+","+dp+","+merge+","+da+","+hra+","+cca+","+splalnce+","+arrs+","+tgs+","+
		  itx+","+pf+","+ptx+","+lic+","+gis+","+lop+","+trpt+","+vhcle+","+abl+","+soc+","+
		  others+","+td+","+ns+")");
    db.DBCommit();
    out.println("<center><br><br><b>Updated Successfully</b></center>");
    out.println("<center><br><a href='../Accountant/ModifyCurSalDtlsPrompt.html' target='f3'><b>Back</b></a></center>");
}
catch(Exception e)
{
     db. DBRollback();
     out.println("<br><br><center><b>Unable to update details.</b> </center>");
     out.println("<center><br><a href='../Accountant/ModifyCurSalDtlsPrompt.html' target='f3'><b>Back</b></a></center>");
}
finally
{
	 db.setDBAutoCommit(true);
}
%>
</body>
</html>