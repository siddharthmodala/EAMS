<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="dbpackage.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Calculate current Salary Details</title>
</head>
<script language="javascript">
function change(m)
{
	alert(" You cannot change this field value . \n\n To Change go back and check Salary details.");
	m.blur();
}
</script>
<body background="../Images/bg87.jpeg">
<%
float grsal=0,lop=0,totded=0,netsal=0,it=0,soc=0,arrs=0,ndp=0,other=0,wd=0,cca=0,nda=0;
String mon[]={"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
String ecode=null,month=null;
int year,m=0;
int y[]={31,28,31,30,31,30,31,31,30,31,30,31};
Database db1=new Database();
Database db2=new Database();
ResultSet rs1=null,rs2=null,rs3=null;
ecode=request.getParameter("ecode");
year=Integer.parseInt(request.getParameter("year"));
month=request.getParameter("month");
it=Float.parseFloat(request.getParameter("it"));
soc=Float.parseFloat(request.getParameter("soc"));
arrs=Float.parseFloat(request.getParameter("arrs"));
ndp=Float.parseFloat(request.getParameter("ndp"));
other=Float.parseFloat(request.getParameter("others"));
for(int i=0;i<mon.length;i++)
	if(mon[i].equals(month))
	{
		m=i;
		break;
	}
if(m==1)
{
	if((((year+1)%4==0)&&((year+1)%100!=0)) ||((year+1)%400==0))
	   wd=29;
	else
		wd=y[m];
}
else
   wd=y[m];
nda=wd-ndp;
if(nda<0)
	out.println("<br><br><center><b>Days present are more than working days in the month</b></center>");
else
{	
	try
	{
	rs1=db1.executeDBQuery("select * from salary"+year+"_"+(year+1)+" where empid='"+ecode+"' and month='"+month+"'");
	if(rs1.next())
	{    
	cca=Math.round(rs1.getFloat(10)*(ndp/wd));
	grsal=rs1.getFloat(13)+arrs+cca-(rs1.getFloat(10)+rs1.getFloat(12));
	lop=Math.round((grsal*nda)/wd);
	totded=rs1.getFloat(25)+-(rs1.getFloat(14)+rs1.getFloat(19)+rs1.getFloat(23)+rs1.getFloat(24))+it+lop+soc+other;
	netsal=grsal-totded;
%>
<form method="post" action="updatecursaldtls.jsp">
<table border="0" align="center" >
<caption><b>Pay Slip </b></caption>
<tr>
<td>
<table cellspacing="10px">
<tr><td> <b> Employee Code  :</b> </td><td><input type="text" name="ecode" value="<%=rs1.getString(1)%>" onfocus="change(this)"></td></tr>
<tr><td> <b> Employee Name :</b> </td><td><input type="text" name="ename" value="<%=rs1.getString(2)%>" onfocus="change(this)" ></td></tr>
<tr><td> <b> Designation  :</b> </td><td><input type="text" name="designation" value="<%=rs1.getString(3)%>" onfocus="change(this)" ></td></tr>
<tr><td> <b> Basic Salary : </b></td><td><input type="text" name="basic" value="<%=rs1.getString(5)%>" onfocus="change(this)" ></td></tr>
<tr><td> <b> Dearness Pay :</b> </td><td><input type="text" name="dp" value="<%=rs1.getString(6)%>" onfocus="change(this)"></td></tr>
<tr><td> <b> Merged Basic :</b></td><td><input type="text" name="mergesal" value="<%=rs1.getString(7)%>" onfocus="change(this)" ></td></tr>
<tr><td> <b> Direct Allowance :</b> </td><td><input type="text" name="da"  value="<%=rs1.getString(8)%>" onfocus="change(this)"></td></tr>
<tr><td> <b> House Rent Allowance :</b> </td><td><input type="text" name="hra" value="<%=rs1.getString(9)%>" onfocus="change(this)"></td></tr>
<tr><td> <b> City Compensatory Allowance :</b> </td><td><input type="text" name="cca" value="<%=(int)cca%>" onfocus="change(this)"></td></tr>
<tr><td> <b> Special Allowance  :</b> </td><td><input type="text" name="splalnce" value="<%=rs1.getString(11)%>" onfocus="change(this)"></td></tr>
<tr><td> <b> Arrears : </b></td><td><input type="text" name="arrs" value="<%=(int)arrs%>" onfocus="change(this)"></td></tr>
<tr><td> <b> GROSS Salary : </b></td><td><input type="text" name="tgs" value="<%=(int)Math.round(grsal)%>" onfocus="change(this)"></td></tr>
</table>
</td>
<td>
<table cellspacing="10px">
<tr><td> <b> Income Tax :</b> </td><td><input type="text" name="itx" value="<%=(int)it%>" onfocus="change(this)"></td></tr>
<tr><td> <b> Provident Fund :</b> </td><td><input type="text" name="pf" value="<%=rs1.getString(15)%>" onfocus="change(this)"></td></tr>
<tr><td> <b> Profession Tax :</b> </td><td><input type="text" name="ptx" value="<%=rs1.getString(16)%>" onfocus="change(this)"></td></tr>
<tr><td> <b> LIC  : </b></td><td><input type="text" name="lic" value="<%=rs1.getString(17)%>" onfocus="change(this)"></td></tr>
<tr><td> <b> Group Insurance Scheme (GIS) :</b></td><td><input type="text" name="gis" value="<%=rs1.getString(18)%>" onfocus="change(this)"></td></tr>
<tr><td> <b> Loss Of Pay : </b></td><td><input type="text" name="lop" value="<%=(int)lop%>" onfocus="change(this)"></td></tr>
<tr><td> <b> Transport charges :</b> </td><td><input type="text" name="trpt" value="<%=rs1.getString(20)%>" onfocus="change(this)"></td></tr>
<tr><td> <b> Vehicle Loan  :</b></td><td><input type="text" name="vhcle" value="<%=rs1.getString(21)%>" onfocus="change(this)"></td></tr>
<tr><td> <b> Andhra Bank Loan  :</b></td><td><input type="text" name="abl" value="<%=rs1.getString(22)%>" onfocus="change(this)"></td></tr>
<tr><td> <b> Society :</b> </td><td><input type="text" name="soc" value="<%=(int)soc%>" onfocus="change(this)"></td></tr>
<tr><td> <b> Others :</b> </td><td><input type="text" name="others" value="<%=(int)other%>" onfocus="change(this)"></td></tr>
<tr><td> <b> Total Deductions :</b> </td><td><input type="text" name="td" value="<%=(int)totded%>" onfocus="change(this)"></td></tr>
</table>
</td>
</tr>
<tr>
<td colspan="4" align="center"><b>NET SALARY : </b><input type="text" name="ns" value="<%=(int)Math.round(netsal)%>" onfocus="change(this)"></td>
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
		out.println("<br><br><center><b> Salary details not available for the given details</b></center>");
	}
}
catch(Exception e)
{
    out.println("<br><br><center><b> "+e+"</b> </center>");
}
}
%>
</body>
</html>