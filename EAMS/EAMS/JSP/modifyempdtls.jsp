<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="dbpackage.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modify Employee Details</title>
<script type="text/javascript" src="../JavaScript/validate.js"></script>
<script type="text/javascript">
function changevalues()
{
	if(document.f.post.value=="Teaching")
	{
	 var temp1="<option selected></option>"+
	 "<option >Professor </option>"+
	 "<option > Associate Professor</option>"+
	 "<option >Assistant Professor(Senior Grade)</option>"+
	 "<option >Senior Assistant Professor</option>"+
	 "<option >Assistant Professor</option>"+
	 "<option >Lecturer</option>"+
	 "<option >Lecturer cum Programmer</option>"+
	 "<option >Training & Placement officer</option>"+
	 "<option >Librarian</option>"+
	 "<option >Physical Director</option>"+
	 "<option >Research Associate</option>"+
	 "<option >Others</option>";
	 var temp2="<option SELECTED></option>"+
		"<option >CSE</option>"+
		"<option >ECE</option>"+
		"<option >IT</option>"+
		"<option >ME</option>"+
		"<option >CE</option>"+
		"<option >EEE</option>"+
		"<option >EIE</option>"+
		"<option >HS</option>"+
		"<option >Others</option>";
	document.f.designation.innerHTML=temp1;
	document.f.dept.innerHTML=temp2;
	}
	else if(document.f.post.value=="Non-Teaching(Technical)")
	{
		var temp1="<option selected></option>"+
			"<option >Assitant Computer Programmer</option>"+
			"<option >Junior Computer Programmer</option>"+
			"<option >Computer Operator</option>"+
			"<option >Instructor</option>"+
			"<option>Network & Hardware Programmer</option>"+
			"<option >Senior Skilled Assistant</option>"+
			"<option>Senior Technician</option>"+
			"<option >Skilled Assistant</option>"+
			"<option>Project Assistant</option>"+
			"<option >Electrician</option>"+
			"<option>Plumber</option>"+
			"<option>Diesel Generator Operator</option>"+
			"<option >Others</option>";
		var temp2="<option SELECTED></option>"+
		"<option >CSE</option>"+
		"<option >ECE</option>"+
		"<option >IT</option>"+
		"<option >ME</option>"+
		"<option >CE</option>"+
		"<option >EEE</option>"+
		"<option >EIE</option>"+
		"<option >HS</option>"+
		"<option >Admin</option>"+
		"<option >Library</option>"+
		"<option >Sports</option>"+
		"<option >RCC</option>"+
		"<option >Engg. Cell</option>"+
		"<option >HouseKeeping</option>"+
		"<option >Others</option>";
		document.f.designation.innerHTML=temp1;
		document.f.dept.innerHTML=temp2;
	}
	else if(document.f.post.value=="Non-Teaching(Non-Technical)")
	{
		var temp1="<option selected></option>"+
			"<option>Administrative Officer</option>"+
			"<option>Estate Officer</option>"+
			"<option >Office Manager</option>"+
			"<option >Office Superintendent</option>"+
			"<option >Training Officer</option>"+
			"<option >Registrar</option>"+			
			"<option>Administrative Assistant</option>"+
			"<option >Senior Office Assistant</option>"+
			"<option >Office Assistant</option>"+
			"<option>Junior Accountant</option>"+
			"<option >Junior Assitant</option>"+
			"<option >Stenotypist</option>"+			
			"<option >Assistant Librarian</option>"+
			"<option >Library Assistant</option>"+
			"<option >Library Attendant</option>"+
			"<option >Supervisor</option>"+
			"<option >Assistant Supervisor</option>"+		
			"<option >Record Assistant</option>"+
			"<option >Senior Telephone Operator</option>"+			
			"<option >Security Officer</option>"+
			"<option>Security personnel</option>"+
			"<option >Trainer - GYM</option>"+
			"<option >Trainer - Billiard</option>"+
			"<option >Trainer - BasketBall</option>"+
			"<option >Trainer - Badminton</option>"+
			"<option >Trainer - Tabletennis</option>"+
			"<option >Trainer - Others</option>"+
			"<option>Attendant</option>"+
			"<option >Drivers</option>"+
			"<option >Nurse</option>"+			
			"<option >House keeper</option>"+
			"<option >Site Supervisor</option>"+
			"<option >Gardener</option>"+
			"<option >Attender</option>"+
			"<option>Marker</option>"+
			"<option >Helper</option>"+
			"<option>Sweeper cum Cleaner</option>"+
			"<option>Aya</option>"+		
			"<option >Others</option>";
		var temp2="<option SELECTED></option>"+
		"<option >CSE</option>"+
		"<option >ECE</option>"+
		"<option >IT</option>"+
		"<option >ME</option>"+
		"<option >CE</option>"+
		"<option >EEE</option>"+
		"<option >EIE</option>"+
		"<option >HS</option>"+
		"<option >Admin</option>"+
		"<option >Library</option>"+
		"<option >Sports</option>"+
		"<option >RCC</option>"+
		"<option >Engg. Cell</option>"+
		"<option >HouseKeeping</option>"+
		"<option >Others</option>";
		document.f.designation.innerHTML=temp1;
		document.f.dept.innerHTML=temp2;
	}
	else if(document.f.post.value=="")
	{
		document.f.designation.innerHTML="";
		document.f.dept.innerHTML="";
	}
}
function validate()
{
	with(document.f)
	{
			if(isEmpty(empid,"Enter Employee Code."))
				return false;
			if(isEmpty(post,"Select Employee's Post."))
				return false;
			if(isEmpty(dept,"Select Employee's Department."))
				return false;
			if(isEmpty(designation,"Select Designation."))
				return false;			
			if(checkDay(doj))
				return false;
			if(checkMonth(moj))
				return false;
			if(checkYear(yoj))
				return false;	
			if(isEmpty(ename,"Enter Employee's Name."))
				return false;
			if(isEmpty(sex,"Select Employee's Sex."))
				return false;
			if(isEmpty(fname,"Enter Employee's Father Name."))
				return false;
			if(isEmpty(mname,"Enter Employee's Mother Name."))
				return false;			
			if(checkDay(dob))
				return false;
			if(checkMonth(mob))
				return false;
			if(checkYear(yob))
				return false;	
			if(isEmpty(bgp,"Select Employee's Blood Group."))
				return false;
			if(isEmpty(caste,"Enter Employee's Caste."))
				return false;			
			if(isEmpty(religion,"Enter Employee's Religion."))
				return false;			
			if(isEmpty(caddr,"Enter Employee's Correspondance address."))
				return false;			
			if(isEmpty(paddr,"Enter Employee's Permanent address."))
				return false;
			if(checkPhoneNo(phno))
				return false;
			if(checkPhoneNo(cellno))
				return false;			
			if(isValidEmail(emailid,"Enter Email ID in correct format."))
				return false;
			if(photo.value!="")
			{
			if(isPhoto(photo))
				return false;
			}
			if(isEmpty(sbacno,"Enter Employee's SB Acccount number."))
				return false;
			if(isEmpty(pfno,"Enter Employee's Provident fund number."))
				return false;
			if(isEmpty(panno,"Enter Employee's Pan number!!"))
				return false;
			if(isEmpty(paytype,"Select Employee's Paytype."))
				return false;
			if(isEmpty(scale,"Select Employee's Salary Scale."))
				return false;
			if(isEmpty(basic,"Enter Employee's Basic salary."))
				return false;
			if(isNaN(basic.value))
			{
				alert("Enter Basic salary in numbers only.");
			  	return false;
			}
			if(checkMonth(moi))
				return false;
			if(spec.value=="")
			{
				alert("Enter specialization or enter N.A. !!");
				return false;
			}
			var txt="Enter experience in numbers only otherwise enter 0.";
			if(isNotNumber(te,txt) || isNotNumber(re,txt)|| isNotNumber(ie,txt) || isNotNumber(oe,txt)|| isNotNumber(ve,txt))
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
<body bgcolor="lightyellow" >
<center><b><u>Please Modify Employee details</u></b></center>
<br><br>
<form name="f" action="./updateempdtls.jsp" onSubmit="return validate();">
<%

	String empcode = request.getParameter("empid");
		Database db = new Database();
		String str = "select * from employees where empid='" + empcode+ "'";
		try
		{
		ResultSet rs = db.executeDBQuery(str);
		ResultSetMetaData rsmd = rs.getMetaData();
		String months[] = {"Jan", "Feb", "Mar", "Apr", "May", "Jun",
				"Jul", "Aug", "Sep", "Oct", "Nov", "Dec" };
		if (rs.next()) 
		{
%>
<fieldset>
<legend style=" color:blue"><b>Official Details</b></legend>
<table align="center" cellspacing="10px">
<tr>
<td><b>Employee ID :</b></td><td><input type="text" name="empid" value="<%=rs.getString(1)%>" onFocus="change(this)"></input></td>
<td>&nbsp;</td>
<td><b> Post :</b></td>
<td><select name="post" onChange="changevalues()">
									<option SELECTED><%=rs.getString(15)%></option>
									<option >Teaching</option>
									<option >Non-Teaching(Technical)</option>
									<option >Non-Teaching(Non-Technical)</option>
									</select>
</td>
</tr>
<tr>
<td><b>Department  :</b> </td><td><select name="dept">
									<option SELECTED><%=rs.getString(17)%></option>
									</select>									
</td>
<td>&nbsp;</td>
<td><b>Designation  : </b></td><td><select name="designation">
							<option SELECTED><%=rs.getString(16)%></option>							
							</select>
</td>
</tr>
<%
	Calendar doj = Calendar.getInstance();
	java.util.Date d1 = rs.getDate(18);
	doj.setTime(d1);
%>	
<tr>
<td><b>Date of Join (dd-mon-yyyy):</b></td>
<td><input type="text" name="doj" size="2" value="<%=doj.get(Calendar.DATE)%>"></input>-
					   <select name="moj">
						<option selected><%=months[doj.get(Calendar.MONTH)]%></option>
						<option value="Jan">Jan</option>
						<option value="Feb">Feb</option>
						<option value="Mar">Mar</option>
						<option value="Apr">Apr</option>
						<option value="May">May</option>
						<option value="Jun">Jun</option>
						<option value="Jul">Jul</option>
						<option value="Aug">Aug</option>
						<option value="Sep">Sep</option>
						<option value="Oct">Oct</option>
						<option value="Nov">Nov</option>
						<option value="Dec">Dec</option>
						</select>-
						<input type="text" name="yoj" size="4" value=<%=doj.get(Calendar.YEAR)%>>
</td>
<td>&nbsp;</td>
<td></td><td></td>
</tr>
</table>
</fieldset>
<fieldset>
<legend style=" color:red"><b>Personal Details</b></legend>
<table align="center" cellspacing="10px">
<tr>
<td><b>Employee Name :</b></td><td><input type="text" name="ename" value="<%=rs.getString(2)%>"></input></td>
<td>&nbsp;</td>
<td><b>Sex :</b></td>
<td> <select name="sex">
			<option selected><%=rs.getString(6)%></option>
			<option>Male</option>
			<option>Female</option>
			</select>
</td>
</tr>
<tr>
<td><b>Father's Name :</b></td><td><input type="text" name="fname" value="<%=rs.getString(3)%>"></input></td>
<td>&nbsp;</td>
<td><b>Mother's Name :</b></td><td><input type="text" name="mname" value="<%=rs.getString(4)%>"></input></td>
</tr>
<%
	Calendar dob = Calendar.getInstance();
	java.util.Date d2 = rs.getDate(5);
	dob.setTime(d2);
%>	

<tr>
<td><b>Date of Birth (dd-mon-yyyy):</b></td>
<td><input type="text" name="dob" size="2" value="<%=dob.get(Calendar.DATE)%>"></input>-
					   <select name="mob">
						<option selected><%=months[dob.get(Calendar.MONTH)]%></option>
						<option value="Jan">Jan</option>
						<option value="Feb">Feb</option>
						<option value="Mar">Mar</option>
						<option value="Apr">Apr</option>
						<option value="May">May</option>
						<option value="Jun">Jun</option>
						<option value="Jul">Jul</option>
						<option value="Aug">Aug</option>
						<option value="Sep">Sep</option>
						<option value="Oct">Oct</option>
						<option value="Nov">Nov</option>
						<option value="Dec">Dec</option>
						</select>-
						<input type="text" name="yob" size="4" value=<%=dob.get(Calendar.YEAR)%>>
</td>
<td>&nbsp;</td>
<td><b>Blood Group :</b></td>
<td><select name="bgp">
<option selected><%=rs.getString(7)%></option>
<option>A+</option>
<option>A-</option>
<option>B+</option>
<option>B-</option>
<option>AB+</option>
<option>AB-</option>
<option>O+</option>
<option>O-</option>
<option>N.A.</option>
</select></td>
</tr>
<tr>
<td><b>Caste :</b></td><td><input type="text" name="caste" value=<%=rs.getString(8)%>></input></td>
<td>&nbsp;</td>
<td><b>Religion :</b></td><td><input type="text" name="religion" value=<%=rs.getString(9)%>></input></td>
</tr>
<tr>
<td><b>Correspondence Address :</b></td><td><textarea name="caddr"><%=rs.getString(11)%></textarea></td>
<td>&nbsp;</td>
<td><b>Permanent Address :</b></td><td><textarea name="paddr"><%=rs.getString(10)%></textarea></td>
</tr>
<tr>
<td><b>Phone No. :</b></td><td><input type="text" name="phno" value="<%=rs.getString(12)%>"></input></td>
<td>&nbsp;</td>
<td><b>Cell No. :</b></td><td><input type="text" name="cellno" value="<%=rs.getString(13)%>"></input></td>
</tr>
<tr>
<td><b>Email ID :</b></td>
<td><input type="text" name="emailid" value="<%=rs.getString(14)%>"></input></td>
<td>&nbsp;</td>
<td><b>Photo (choose file) :</b></td><td><input type="file" name="photo" value="<%=rs.getString(32)%>"></input></td>
</tr>
</table>
</fieldset>
<br>
<fieldset>
<legend style=" color:maroon"><b>Pay Particulars</b></legend>
<table align="center" cellspacing="10px">
<tr>
<td><b>S.B. A/c No. :</b></td>
<td><input type="text" name="sbacno" value="<%=rs.getString(19)%>"></input></td>
<td>&nbsp;</td>
<td><b>Provident Fund No. : </b></td>
<td><input type="text" name="pfno" value="<%=rs.getString(21)%>"></input></td>
</tr>
<tr>
<td><b>PAN No. : </b></td>
<td><input type="text" name="panno" value="<%=rs.getString(20)%>"></input></td>
<td>&nbsp;</td>
<td><b>Pay Type : </b></td>
<td><select name="paytype">
					 <option selected><%=rs.getString(22)%></option>
					 <option>Scaled</option>
					 <option>Consolidated</option>
	 </select>
</td>
</tr>
<tr>
<td><b>Scale :</b></td>
<td>
<select name="scale">
 <option selected><%=rs.getString(23)%></option>
</select>
</td>
<td>&nbsp;</td>
<td><b>Basic Salary :</b></td>
<td><input type="text" name="basic" value="<%=rs.getString(24)%>"></input></td>
</tr>
<tr>
<td><b>Month of Increment :</b></td>
<td><select name="moi">
				<option selected><%=rs.getString(25)%></option>
				<option value="Jan">Jan</option>
				<option value="Feb">Feb</option>
				<option value="Mar">Mar</option>
				<option value="Apr">Apr</option>
				<option value="May">May</option>
				<option value="Jun">Jun</option>
				<option value="Jul">Jul</option>
				<option value="Aug">Aug</option>
				<option value="Sep">Sep</option>
				<option value="Oct">Oct</option>
				<option value="Nov">Nov</option>
				<option value="Dec">Dec</option>
	</select>						
</td>
<td>&nbsp;</td>
<td></td><td></td>
</tr>
</table>
</fieldset>
<br></br>
<fieldset>
<legend style="color : green"><b>Previous Experiences</b></legend>
<table align="center" cellspacing="10px">
<tr>
<td><b>Specializations :</b></td><td><textarea name="spec"><%=rs.getString(26)%></textarea></td>
<td>&nbsp;</td>
<td></td><td></td>
</tr>
<tr>
<td><b>Teaching Experience :</b></td><td><input type="text" name="te" size="2" value="<%=rs.getInt(27)%>"></input> years</td>
<td>&nbsp;</td>
<td><b>Industrial Experience :</b></td><td><input type="text" name="ie" size="2" value="<%=rs.getInt(29)%>"></input> years </td>
</tr>
<tr>
<td><b>Research Experience :</b></td><td><input type="text" name="re" size="2" value="<%=rs.getInt(28)%>"></input> years</td>
<td>&nbsp;</td>
<td><b>Other Experience :</b></td><td><input type="text" name="oe" size="2" value="<%=rs.getInt(30)%>"></input> years</td>
</tr>
<tr>
<td><b>VNR VJIET Experience :</b></td><td><input type="text" name="ve" size="2" value="<%=rs.getInt(31)%>"></input> years</td>
<td>&nbsp;</td>
<td></td><td></td>
</tr>
</table>
</fieldset>
<br><br>
<center><input type="Submit" value="Update Employee Record"></input></center>
</form>
<%
 db.closeResultSet();
 }
  else
	out.println("<br><br><center><b>Employee ID doesnt exist. <br> <a href='../Establishment/EmployeeModify.html'>Back</a></b></center>");
}
catch(Exception e)
{
	out.println(e.getMessage());
}
%>
</body>
</html>