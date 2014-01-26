<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dbpackage.*" %>
<%@ page import="java.sql.*" %>   
<%@ page import="java.util.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manager Home </title>
<script type="text/javascript">
 startList = function()
{
	 for(var i=0;i<4;i++)
	 {
		 var str="nav"+i;
	navRoot = document.getElementById(str);
	for (i=0; i<navRoot.childNodes.length; i++) 
	{
		node = navRoot.childNodes[i];
		if (node.nodeName=="LI") 
		{
			node.onmouseover=function()
			{
				this.className+=" over";
			};
			node.onmouseout=function() 
			{
				this.className=this.className.replace(" over", "");
			};
		}
	}
}
};
window.onload=startList;
</script>
<script language="javascript">
function yearcheck()
{
	<%
	Database db=new Database();
	int y,m;
	Calendar c= Calendar.getInstance();
	ResultSet rs=db.executeDBQuery("select * from salyear");
	if(rs.next())
	{
		y=rs.getInt(1);
		m=rs.getInt(2);		
		if((y+1)>(c.get(Calendar.YEAR)))
		{
			out.println("alert(' Please Create the Financial year table ')");				
		}
		else
		{
		if((y+1)==(c.get(Calendar.YEAR)))
		{
			if(c.get(Calendar.MONTH)>m)
			{
				out.println("alert(' Please Create the Financial year table ')"); 
			}
		}
		}
	}
	else
	 {	
	  %>
	 	alert(" Financial year Salary table not created.\n Please create it to handle furthur transactions");	 
      <%
    }
	%>	
}
</script>
<style type="text/css">
			  body {
				font: normal 11px verdana;
				}
			ul {
				margin: 0;
				padding: 0;
				list-style: none;
				width: 190px; /* Width of Menu Items */
				border-bottom: 1px solid #ccc;
				}

			ul li {
			position: relative;
				}
				
			li ul {
				position: absolute;
				left:0; /* Set 1px less than menu width */
				top: 29;
				display: none;
				}

			/* Styles for Menu Items */
			ul li a {
				display: block;
				text-decoration: none;
				color: blue;			/*color for the letters in the link*/
				padding: 5px;
				border: 0px solid #ccc; /* IE6 Bug */
				border-bottom: 1;
				}
				a
				{
				color: #0;  
				text-decoration: none;
				font-size: 12px;
				display: block;
				padding: 3px;
				width: 180px;
				background-color: greenyellow;	/*background color for the link*/
				border-bottom: 1px solid #fff;
				}
						
			a:hover
				{
				background-color: brown ; /*color of the background when the mouse hovers on it*/
				color: #fff;
				}
				
			li a#current
				{
				border-bottom: 3px solid #C0C018;
				background: #487890 ;
				color: #fff;
				}
			/* Fix IE. Hide from IE Mac \*/
			 html ul li { float: left; height: 1%; }
			 html ul li a { height: 1%; }
			/* End */
			li:hover ul{ display: block; }
</style>


</head>
<body bgcolor="darkgreen" onload="yearcheck()" >
<center>	
			<img src="../Images/Abanner1.jpeg" width="100%" height="100%"></img>
		<table> 
		<tr>
			  <td>
				  <ul id="nav1">
				  <li><a href="../ShowM.html" target="f3">Employees</a> 
					<ul> 					 
					<li><a href="PSalDtlsModify.html" target="f3">Modify Employee Permanent Salary Details</a></li> 
					<li><a onclick="javascript:window.open('../Establishment/ViewEmpPrompt.html','','menubar=yes,scrollbars=yes,left=200,top=200,width=700,height=300')">View Employee Details</a></li>
					<li><a onclick="javascript:window.open('../Accountant/ViewPSalDtlsPrompt.html','','menubar=yes,scrollbars=yes,left=200,top=200,width=700,height=300')">View Permanent Salary Details</a></li>
					<li><a onclick="javascript:window.open('../Clerk/LeavePrompt.html','','menubar=yes,scrollbars=yes,left=200,top=200,width=700,height=300')">View Leave Reports</a></li> 				   
					</ul> 
				  </li> 
				  </ul>
			  </td>
			  <td>
				   <ul id ="nav2">
				  <li><a href="../ShowM.html" target="f3">Scales</a> 
					<ul> 
					  <li><a href="../JSP/ptaxscale.jsp" target="f3">Profession tax</a></li> 
					  <li><a href="../JSP/ccascale.jsp" target="f3">City Compensation Allowance</a></li> 
					  <li><a href="../JSP/salarylimits.jsp" target="f3">Percentage Scale</a></li> 
					 </ul> 
				  </li> 
				  </ul>
			  </td>
			  <td>
				  <ul id="nav3" >
				  <li><a href="../ShowM.html" target="f3">Employee Access</a> 
					<ul> 
					  <li><a href="ProvideAccess.html" target="f3">Provide Access</a></li> 
					  <li><a href="RemoveAccess.html" target="f3">Remove Access</a></li>
					  <li><a href="../JSP/viewaccess.jsp?type=1" target="f3">View Users</a></li>  
					</ul> 
				  </li> 
				  </ul>
			  </td>
			  <td>
				  <ul id="nav4">
				  <li><a href="../ShowM.html" target="f3">Accounting</a> 
					<ul>
					 <li><a href="../JSP/lockaccounts.jsp" target="f3">Lock Accounts</a></li>
					 <li><a href="./FinancialYear.html" target="f3">New Financial Year</a></li>
					  <li><a href="./Reports.html" target="f3">Reports</a></li>  
					  <li><a href="../Accountant/ViewSalarySheet.html"target="f3">View Salary Sheets</a></li>					  
					  <li><a href="../Accountant/IPaySlip.html" target="f3">Generate Pay Slip</a></li>					 					 
					</ul> 
				  </li> 
				  </ul>
			  </td>
  			  <td>
				<ul id="nav4">
				  <li><a href="../ShowM.html" target="f3">User Options</a> 
					<ul>  
					<li><a href="../ChangePassword.html" target="f3">Change Password</a></li> 
					<li><a href="../Home.html" >Logout</a></li> 
					</ul> 
				  </li> 
				  </ul>
			  </td>
			</tr>
		</table>
		<iframe name="f3"  width="100%" height="500px"  src="../ShowM.html" ></iframe>
	</center>
</body>
</html>
