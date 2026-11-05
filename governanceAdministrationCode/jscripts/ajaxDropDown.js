function xstooltip_findPosX(obj) 
{
  var curleft = 0;
  if (obj.offsetParent) 
  {
    while (obj.offsetParent) 
        {
            curleft += obj.offsetLeft
            obj = obj.offsetParent;
        }
    }
    else if (obj.x)
        curleft += obj.x;
    return curleft;
}

function xstooltip_findPosY(obj) 
{
    var curtop = 0;
    if (obj.offsetParent) 
    {
        while (obj.offsetParent) 
        {
            curtop += obj.offsetTop
            obj = obj.offsetParent;
        }
    }
    else if (obj.y)
        curtop += obj.y;
    return curtop;
}

function lookup(thisa, inputString , i , what) {
//alert(i);
l = xstooltip_findPosX(thisa);
t = xstooltip_findPosY(thisa);

document.getElementById('suggestions'+i).style.top=(t+24)+"px";
document.getElementById('suggestions'+i).style.left=l+"px";

//alert(l+"--"+t);

if(inputString.length == 0) {

     $('#suggestions'+i).hide();

} else {


   $.post("../user/projectnames.jsp", {queryString: ""+inputString+"" ,  index : ""+i+"" ,  what : ""+what+""}, function(data){

		 $('#suggestions'+i).show();
     $('#autoSuggestionsList'+i).html("<div class=\"bigblue\"><img src=\"../images/loading.gif\" border=\"0\"> Loading..</div>");
if(data.length >0) {

     $('#suggestions'+i).show();
     $('#autoSuggestionsList'+i).html(data);
}
});
}
}

function fill(thisValue , i) {

	var temp = "inputString" ;
	eval("document.frmActivity."+temp+i).value = thisValue;
	 setTimeout("$('#suggestions"+i+"').hide();", 20);
}