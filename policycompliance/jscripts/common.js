	// js for tooltip

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

//js for tooltip
function xstooltip_show(tooltipId, parentId, posX, posY, width)
{
 
    it = document.getElementById(tooltipId);
    img = document.getElementById(parentId); 

	x = xstooltip_findPosX(img) + posX;
    y = xstooltip_findPosY(img) - posY;
    //alert(x+'&'+y);
    it.style.top = y + 'px';
    it.style.left = x + 'px';
    it.style.width = width +'px';
    it.style.visibility = 'visible'; 
}

function xstooltip_hide(id)
{
    it = document.getElementById(id); 
    it.style.visibility = 'hidden'; 
}
 
function show(remark){

    loadFragment('../common/userRemarks.jsp?remark='+remark, 'tooltip','Remark');
}


function showHeader(url, name, id){

	if(id == '3')
	{
		//$(".default2").css("background-color", "#999999");
		$("#"+name).css("background-color", "#000000");

	}else if(id == '2')
	{
		$(".default1").css("background-color", "#999999");
		$("#"+name).css("background-color", "#000000");

	}else if(id == '1')
	{
		$(".default0").css("background-color", "#999999");
		$("#"+name).css("background-color", "#000000");
	}
	//name = (name=="HALF YEARLY" ? "HALFYEARLY" : name); 
	
	//loadFragment('../approver/approveAnnually.jsp', 'showdetails','Page');
	//loadFragment('../requestor/weekly.jsp', 'showdetails','Page');
	loadFragment(url, 'showdetails','Loading...');
}

function dispHeader(name){

//	alert("disname----"+name);
	if(name == 'REPORT')
	{
		frmObj = document.frmCreateRequest;
		frmObj.action = "../reviewer/report.jsp";
		frmObj.submit( );
	}
	else if(name == 'ENSURE COMPLIANCE')
	{
		$("#head1").removeClass("style2").addClass("style4");
		$("#head0").removeClass("style4").addClass("style2");
		$(".default0").hide();
		$(".default1").show();
		$(".default1").css("background-color", "#999999");
		$("#DAILY1").css("background-color", "#000000");
		loadFragment('../approver/approveDaily.jsp','showdetails','Loading...');

	}
	else if(name == 'MY COMPLIANCE')
	{
		$("#head0").removeClass("style2").addClass("style4");
		$("#head1").removeClass("style4").addClass("style2");
		$(".default1").hide();
		$(".default0").show();
		$(".default0").css("background-color", "#999999");
		$("#DAILY").css("background-color", "#000000");
		loadFragment('../requestor/daily.jsp', 'showdetails','Loading...');
	}
	//alert("name--"+name);

}

function dispReportHeader(name, mainRoleId, toplinkId, arrId){

	if(name == 'REPORT')
	{
		frmObj = document.frmCreateRequest;
		frmObj.action = "../reviewer/report.jsp";
		frmObj.submit( );
	}
	else if(toplinkId == arrId)
	{
		$("#head1").removeClass("style2").addClass("style4");

		if(mainRoleId == 4)
		{
			$("#head0").removeClass("style4").addClass("style2");
			$("#head2").removeClass("style4").addClass("style2");
			

		}else if(mainRoleId == 3)
		{
			$("#head2").removeClass("style4").addClass("style2");
		}else
		{
			$("#head0").removeClass("style4").addClass("style2");
		}

		if(name == 'ENSURE COMPLIANCE')
		{
			$(".default0").hide();
			$(".default1").show();
			$(".default1").css("background-color", "#999999");
			$("#DAILY1").css("background-color", "#000000");
			loadFragment('../approver/approveDaily.jsp','showdetails','Loading...');

		}else
		{
			$(".default1").hide();
			$(".default0").show();
			$(".default0").css("background-color", "#999999");
			$("#DAILY").css("background-color", "#000000");
			loadFragment('../requestor/daily.jsp', 'showdetails','Loading...');
		}

	}else if(toplinkId != arrId)
	{
		$("#head0").removeClass("style2").addClass("style4");

		if(mainRoleId == 4)
		{
			$("#head1").removeClass("style4").addClass("style2");
			$("#head2").removeClass("style4").addClass("style2");
			

		}else if(mainRoleId == 3)
		{
			$("#head2").removeClass("style4").addClass("style2");
		}else
		{
			$("#head1").removeClass("style4").addClass("style2");
		}

		if(name == 'ENSURE COMPLIANCE')
		{
			$(".default0").hide();
			$(".default1").show();
			$(".default1").css("background-color", "#999999");
			$("#DAILY1").css("background-color", "#000000");
			loadFragment('../approver/approveDaily.jsp','showdetails','Loading...');

		}else
		{
			$(".default1").hide();
			$(".default0").show();
			$(".default0").css("background-color", "#999999");
			$("#DAILY").css("background-color", "#000000");
			loadFragment('../requestor/daily.jsp', 'showdetails','Loading...');
		}

	}
	/*else if(name == 'ENSURE COMPLIANCE')
	{
		$("#head1").removeClass("style2").addClass("style4");
		

		if(mainRoleId == 4)
		{
			alert("hi");
			$("#head0").removeClass("style4").addClass("style2");
			$("#head2").removeClass("style4").addClass("style2");
			

		}else if(mainRoleId == 3)
		{
			$("#head2").removeClass("style4").addClass("style2");
		}else
		{
			$("#head0").removeClass("style4").addClass("style2");
		}

		$(".default0").hide();
		$(".default1").show();
		$(".default1").css("background-color", "#999999");
		$("#DAILY1").css("background-color", "#000000");
		loadFragment('../approver/approveDaily.jsp','showdetails','Loading...');

	}
	else if(name == 'MY COMPLIANCE')
	{
		$("#head0").removeClass("style2").addClass("style4");
		

		if(mainRoleId == 4)
		{
			alert("com");
			$("#head1").removeClass("style4").addClass("style2");
			$("#head2").removeClass("style4").addClass("style2");
			

		}else if(mainRoleId == 3)
		{
			$("#head2").removeClass("style4").addClass("style2");

		}else
		{
			$("#head1").removeClass("style4").addClass("style2");
		}

		$(".default1").hide();
		$(".default0").show();
		$(".default0").css("background-color", "#999999");
		$("#DAILY").css("background-color", "#000000");
		loadFragment('../requestor/daily.jsp', 'showdetails','Loading...');
	}*/
	//alert("name--"+name);

}

function loadFragment(fragment_url, element_id, for_what){
    var xmlhttp = "";
    if (window.XMLHttpRequest){
        // code for Mozilla, etc.
        xmlhttp=new XMLHttpRequest();
    }else if (window.ActiveXObject){ 
        // code for IE
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }else{
        alert("Sorry Your Browser is not Supported");
    }
    
    var element = document.getElementById(element_id);
    
    var message = "";
    var processingRequest='<table width="30%" height="100%"><tr><td align="center"><div align="center"><span class="loading normal"><img src="../images/loading.gif" valign="absmiddle">&nbsp;&nbsp;'+for_what+'</span></div></td></tr></table>';
        
    element.innerHTML = processingRequest;

    try{
        xmlhttp.open("GET", fragment_url);
        xmlhttp.onreadystatechange = function(){

            if (xmlhttp.readyState == 4 && xmlhttp.status == 200){
                var gotresponse	=	xmlhttp.responseText;
                
				message =  gotresponse;
                   
                element.innerHTML = message;
             }
		}
		xmlhttp.send(null);
	 }// display an error in case of failure
	 catch (e){
	  alert("Can't connect to server:\n" + e.toString());
	 }
}

