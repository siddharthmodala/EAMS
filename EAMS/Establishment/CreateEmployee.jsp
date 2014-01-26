<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dbpackage.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Employee</title>
<script type="text/javascript" src="../JavaScript/validate.js"></script>
<script language="javascript">
function changevalues()
{
	if(document.f.post.value=="Teaching")
	{
	 var temp1="<option selected> </option>"+
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
	 var temp2="<option SELECTED>"+
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
		var temp1="<option selected> </option>"+
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
		var temp2="<option SELECTED>"+
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
		var temp1="<option selected> </option>"+
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
		var temp2="<option SELECTED>"+
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
</script>
</head>
<body bgcolor="lightyellow" onload="changevalues()" >
<br></br>
<center><b><u>Please enter Employee details</u></b></center>
<br><br>
<form name="f" method="post" action="../JSP/createemployee.jsp" onSubmit="return validate()">
<fieldset>
<legend style=" color:blue"><b>Official Details</b></legend>
<table align="center" cellspacing="10px">
<tr>
<td><b>Employee ID :</b></td><td><input type="text" name="empid"></input></td>
<td>&nbsp;</td>
<td><b> Post :</b></td>
<td><select name="post" onChange="changevalues()">
									<option SELECTED></option>
									<option >Teaching</option>
									<option >Non-Teaching(Technical)</option>
									<option >Non-Teaching(Non-Technical)</option>
									</select>
</td>
</tr>
<tr>
<td><b>Department  :</b> </td><td><select name="dept">
									<option SELECTED></option>
									</select>									
</td>
<td>&nbsp;</td>
<td><b>Designation  : </b></td><td><select name="designation">
							<option SELECTED></option>							
							</select>
</td>
</tr>
<tr>
<td><b>Date of Join (dd-mon-yyyy):</b></td>
<td><input type="text" name="doj" size="2"></input>-
					   <select name="moj">
						<option selected></option>
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
						<input type="text" name="yoj" size="4">
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
<td><b>Employee Name :</b></td><td><input type="text" name="ename"></input></td>
<td>&nbsp;</td>
<td><b>Sex :</b></td>
<td> <select name="sex">
			<option selected></option>
			<option>Male</option>
			<option>Female</option>
			</select>
</td>
</tr>
<tr>
<td><b>Father's Name :</b></td><td><input type="text" name="fname"></input></td>
<td>&nbsp;</td>
<td><b>Mother's Name :</b></td><td><input type="text" name="mname"></input></td>
</tr>
<tr>
<td><b>Date of Birth (dd-mon-yyyy):</b></td>
<td><input type="text" name="dob" size="2"></input>-
					   <select name="mob">
						<option selected></option>
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
						<input type="text" name="yob" size="4">
</td>
<td>&nbsp;</td>
<td><b>Blood Group :</b></td>
<td><select name="bgp">
<option selected></option>
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
<td><b>Caste :</b></td><td><input type="text" name="caste" ></input></td>
<td>&nbsp;</td>
<td><b>Religion :</b></td><td><input type="text" name="religion"></input></td>
</tr>
<tr>
<td><b>Correspondence Address :</b></td><td><textarea name="caddr"></textarea></td>
<td>&nbsp;</td>
<td><b>Permanent Address :</b></td><td><textarea name="paddr"></textarea></td>
</tr>
<tr>
<td><b>Phone No. :</b></td><td><input type="text" name="phno"></input></td>
<td>&nbsp;</td>
<td><b>Cell No. :</b></td><td><input type="text" name="cellno"></input></td>
</tr>
<tr>
<td><b>Email ID :</b></td>
<td><input type="text" name="emailid"></input></td>
<td>&nbsp;</td>
<td><b>Photo (choose file) :</b></td><td><input type="file" name="photo"></input></td>
</tr>
</table>
</fieldset>
<br>
<fieldset>
<legend style=" color:maroon"><b>Pay Particulars</b></legend>
<table align="center" cellspacing="10px">
<tr>
<td><b>S.B. A/c No. :</b></td>
<td><input type="text" name="sbacno"></input></td>
<td>&nbsp;</td>
<td><b>Provident Fund No. : </b></td>
<td><input type="text" name="pfno"></input></td>
</tr>
<tr>
<td><b>PAN No. : </b></td>
<td><input type="text" name="panno"></input></td>
<td>&nbsp;</td>
<td><b>Pay Type : </b></td>
<td><select name="paytype">
									 <option selected></option>
									 <option>Scaled</option>
									 <option>Consolidated</option>
									 </select>
</td>
</tr>
<tr>
<td><b>Scale :</b></td>
<td>
<select name="scale">
 <option selected>800-9000</option>
 
</select>
</td>
<td>&nbsp;</td>
<td><b>Basic Salary :</b></td>
<td><input type="text" name="basic"></input></td>
</tr>
<tr>
<td><b>Month of Increment :</b></td>
<td><select name="moi">
						<option selected></option>
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
<td><b>Specializations :</b></td><td><textarea name="spec"></textarea></td>
<td>&nbsp;</td>
<td></td><td></td>
</tr>
<tr>
<td><b>Teaching Experience :</b></td><td><input type="text" name="te" size="2" ></input> years</td>
<td>&nbsp;</td>
<td><b>Industrial Experience :</b></td><td><input type="text" name="ie" size="2" ></input> years </td>
</tr>
<tr>
<td><b>Research Experience :</b></td><td><input type="text" name="re" size="2" ></input> years</td>
<td>&nbsp;</td>
<td><b>Other Experience :</b></td><td><input type="text" name="oe" size="2" ></input> years</td>
</tr>
<tr>
<td><b>VNR VJIET Experience :</b></td><td><input type="text" name="ve" size="2" ></input> years</td>
<td>&nbsp;</td>
<td></td><td></td>
</tr>
</table>
</fieldset>
<br><br>
<center><input type="Submit" value="Create Employee Record"></input></center>
</form>
</body>
</html>