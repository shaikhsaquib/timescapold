function textCounter(field,cntfield,maxlimit)
{
	//alert("Inside");
if (field.value.length > maxlimit) // if too long...trim it!
field.value = field.value.substring(0, maxlimit);
else cntfield.value = maxlimit - field.value.length;
}