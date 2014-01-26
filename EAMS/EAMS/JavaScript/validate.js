function isNull(field,alerttxt)
{
	if(field.value==null )
    {	alert(alerttxt);
		field.focus();
		return true;
    }
  else
    {
	    return false;
    }
}
function isEmpty(field,alerttxt)
{
	if(field.value=="")
	{   alert(alerttxt);
		field.focus();
	    return true;
    }
  else
    {
		return false;
    }
}
function checkDay(field)
{
		if(field.value=="")
		{   alert("Enter the Day value!!");
			field.focus();
		    return true;
		}
		if(isNaN(field.value))
		{
			alert("Enter the Day in numbers.");
			field.focus();
			return true;
		}
		if(field.value<1 ||field.value>31)
		{
			alert("Enter the Day b/w 1 to 31.");			
			return true;		
		}
		return false;
}
function checkMonth(field)
{
	return isEmpty(field,"Enter the Month!!");
}
function checkYear(field)
{
		var d = new Date();
		var year=d.getFullYear();
		if(field.value=="")
		{
			alert("Enter Year Value!!");
			field.focus();
			return true;
		}
		if(isNaN(field.value))
		{
			alert("Please enter Year in Numbers.");
			field.focus();
			return true;		
		}

		if(field.value<1900 || field.value>year)
		{
				alert("Invalid Year Value!!");	
				field.focus();
				return true;		
		}
		return false;
}
function checkPhoneNo(field)
{
		if(field.value!="0"&&(field.value=="" ||isNaN(field.value) ||field.value.length<6 || field.value.length>12) )
		{
			alert("please enter correct Phone or Cell number\n Or enter No. : as 0");
			field.focus();
			return true;
		}
		return false;
}
function checkPercentage(field)
{
	if(isNotNumber(field,"Not a Number!!") | isEmpty(field,"Field is Empty!!"))
		return true;
	else if(field.value<0 | field.value>100)	
		{
			alert("Value should be b/w 1 to 100 only(Percentage)");
			field.focus();
			return true;
		}
	else
		return false;
}	
function isNotNumber(field,alerttxt)
{
	if(field.value=="")
	{	alert(alerttxt);
	field.focus();
	return true;
	}
	if(isNaN(field.value))
	{	alert(alerttxt);
		field.focus();
		return true;
	}
	else
		return false;
}
function rangeCheck(field1,field2)
{	if (isNotNumber(field1,"Not a number") || isNull(field1,"Field is null") || isEmpty(field1,"Field is empty"))
			return true;
	if (isNotNumber(field2,"Not a Number") || isNull(field2,"Field is null") || isEmpty(field2,"field is Empty"))
			return true;
	var x=parseInt(field1.value);
	var y=parseInt(field2.value);
	if(x>=y)
	{
		alert("Lower limit should be less than Higher limit.");
			return true;
	}
	return false;
}
function checkBound(field1,field2,text)
{
	var x=parseInt(field1.value);
	var y=parseInt(field2.value);
	if(x+1==y)
	{
	return false;	
	}
	else
	{	alert("Range Miss Match b/w "+text);
	return true;
	}
}
function isValidEmail(field,alerttxt)
{
	var str=field.value;
	if(str=="")
		return false;
	else
	{
	var re1=new RegExp("^[a-zA-Z0-9_]+\@[a-zA-Z0-9]+\.[a-zA-Z0-9 ]{2,3}$");
	var re2=new RegExp("^[a-zA-Z0-9_]+\@[a-zA-Z0-9]+\.[a-zA-Z0-9 ]{2,3}\.[a-zA-Z0-9 ]{2,3}$");
	if(str.match(re1)||str.match(re2))
		return false;
	else
	{
		alert(alerttxt);
		field.focus();
		return true;
	}
	}
}
function isPhoto(temp)
{
	var file=temp.value;
	var l=file.length;
	var index1=file.lastIndexOf(".jpeg");
	var index2=file.lastIndexOf(".jpg");
	if((l-index2)==4)
	{
		return false;
	}
		else if((l-index1)==5)
	{
		return false;
	}
	alert("Please Upload files only in .jpeg or .jpg fromat");
	return true;
}