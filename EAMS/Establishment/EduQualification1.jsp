<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Educational Qualifications</title>
<script type="text/javascript" src="../JavaScript/validate.js"></script>
<script type="text/javascript">
function addRowToTable()
{
  var tbl = document.getElementById('table');
  var lastRow = tbl.rows.length;
  var iteration = lastRow;
  var row = tbl.insertRow(lastRow);
  
  
  var cellLeft = row.insertCell(0);
  var textNode = document.createTextNode(iteration);
  cellLeft.appendChild(textNode);

  
  var cellRight = row.insertCell(1);
  var sel = document.createElement('select');
  sel.name = 'select' + iteration;
  sel.options[0] = new Option('', '');
  sel.options[1] = new Option('S.S.C.', 'S.S.C.');
  sel.options[2] = new Option('Intermediate/I.T.I', 'Intermediate/I.T.I');
  sel.options[3] = new Option('Diploma', 'Diploma');
  sel.options[4] = new Option('B.C.A', 'B.C.A');
  sel.options[5] = new Option('B.Sc', 'B.Sc');
  sel.options[6] = new Option('B.Ed', 'B.Ed');
  sel.options[7] = new Option('B.A', 'B.A');
  sel.options[8] = new Option('B.Com', 'B.Com');
  sel.options[9] = new Option('B.E', 'B.E');
  sel.options[10] = new Option('B.Tech', 'B.Tech');
  sel.options[11] = new Option('P.G.Diploma', 'P.G.Diploma');
  sel.options[12] = new Option('M.Sc', 'M.Sc');
  sel.options[13] = new Option('M.A', 'M.A');
  sel.options[14] = new Option('M.Com', 'M.Com');
  sel.options[15] = new Option('M.Ed', 'M.Ed');
  sel.options[16] = new Option('MCA', 'MCA');
  sel.options[17] = new Option('M.E', 'M.E');
  sel.options[18] = new Option('M.Tech', 'M.Tech');
  sel.options[19] = new Option('M.Phil', 'M.Phil');
  sel.options[20] = new Option('Ph.D', 'Ph.D');
  cellRight.appendChild(sel);


  cellRight = row.insertCell(2);
  var el = document.createElement('input');
  el.type = 'text';
  el.name = 'univ' + iteration;
  el.id = 'univ' + iteration;
  el.size = 20;
  cellRight.appendChild(el);

  cellRight = row.insertCell(3);
  el = document.createElement('input');
  el.type = 'text';
  el.name = 'yop' + iteration;
  el.id = 'yop' + iteration;
  el.size = 4;
  cellRight.appendChild(el);


  cellRight = row.insertCell(4);
  sel = document.createElement('select');
  sel.name = 'class' + iteration;
  sel.options[0] = new Option('', '');
  sel.options[1] = new Option('1st with Distn', '1st with Distn');
  sel.options[2] = new Option('1st Class', '1st Class');
  sel.options[3] = new Option('2st Class', '2st Class');
  sel.options[4] = new Option('3st Class', '3st Class');
  cellRight.appendChild(sel);

  cellRight = row.insertCell(5);
  el = document.createElement('input');
  el.type = 'text';
  el.name = 'percent' + iteration;
  el.id = 'percent' + iteration;
  el.size = 4;
  cellRight.appendChild(el);

  
  cellRight = row.insertCell(6);
    el = document.createElement('input');
  el.type = 'text';
  el.name = 'spec' + iteration;
  el.id = 'spec' + iteration;
  el.size = 20;
  cellRight.appendChild(el);

  
  cellRight = row.insertCell(7);
  el = document.createElement('input');
  el.type = 'text';
  el.name = 'remark' + iteration;
  el.id = 'remark' + iteration;
  el.size = 20;
  cellRight.appendChild(el);
}
function removeRowFromTable()
{
  var tbl = document.getElementById('table');
  var lastRow = tbl.rows.length;
  if (lastRow > 2) tbl.deleteRow(lastRow - 1);
}
function validate()
{
    var row = document.getElementsByTagName('tr');
	var length= row.length;
	var degree,univ,yop,cl,col,percent;
	if(document.f.empid.value=="")
		{
		alert("Please enter the employee id");
			return false;
		}
		for(var i=1;i<length;i++)
		{
			col=row[i].cells;
			 degree=col[1].firstChild;
		  if( degree.options[degree.selectedIndex].value.length<=0)
			{
				alert("Please Select A Degree");
				degree.focus();
				return false;
			}
			univ = document.getElementById('univ' + i);
			if(univ.value.length<=0)
			{
				alert("Please Enter the university name");
				univ.focus();
				return false;
			}
			yop = document.getElementById('yop' + i);
			if(checkYear(yop))
					return false;
			cl=col[4].firstChild;
			if(cl.options[cl.selectedIndex].value.length<=0)
			{
				alert("Please select A Class");
				cl.focus();
				return false;
			}
			percent = document.getElementById('percent' + i);
			if(percent.value.length<=0 || percent.value>100 )
			{
				alert("Please Enter the percentage obtained");
				percent.focus();
				return false;
			}
		}
		document.f.empid.disabled=false;
    return true;
}
function checkValue(temp)
{
	var url="./EduQualification2.jsp?empid="+temp;
	 
	if (window.XMLHttpRequest)
	xmlhttp=new XMLHttpRequest();
	else
	xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");

	xmlhttp.onreadystatechange=function()
	{
	if(xmlhttp.readyState==4)
	  {
		document.getElementById('result').innerHTML=xmlhttp.responseText
		}
	};
	xmlhttp.open("GET",url,true);
	xmlhttp.send(null);
}
function checkForwardValue()
{
	if(document.f.empid.value!="" & document.f.empid.value!=null)
	{
		document.f.empid.disabled=true;
		checkValue(document.f.empid.value);
	}
}
</script>
</head>
<body background="../Images/bg83.jpeg" onload="checkForwardValue()">
<center>
<br>
<h3><u>Educational qualifications</u></h3>

<form name="f" action="../JSP/eduqualification.jsp" onsubmit="return validate()">
<b>Enter Employee Code</b><input type="text" name="empid" value='<%=request.getParameter("empid")==null?"":request.getParameter("empid")%>' onkeyup="checkValue(this.value)"></input>
<div id="result">

</div>
</form>
</center>
</body>
</html>