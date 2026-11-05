var active = 0;
var height = 0;
var currentdiv='';
var currentVisit='';
var previousAction='';
var load='';
var carLoad='';
var byMe='';
var myInterest='';
var msgMyoffers='';
var msgInterested='';
var goback_array = new Array();
var backing_now='';
backi=0;
var offerId='';

function partFresh(part,data,tab){
    var dc='';
    var newclass='';

    if(data=='-'){
        dc='t';
        data='';
        newclass='current';
        document.getElementById(part).innerHTML =data;
    }else if(data!=''){
        document.getElementById(part).innerHTML =data;
        dc='t';
        newclass='current';
    }else{
        dc='st';
        newclass='current';
    }

    var elet=document.getElementById(tab);
    var i=0;

    while(i<10 && document.getElementById(dc+i)){
        elet = document.getElementById(dc+i);
        elet.className='';
        i++;
    }

    elet = document.getElementById(tab);
    elet.className='current';

}

function toggle_visible(whichdiv){
	currentdiv=whichdiv;
	height = document.getElementById(currentdiv).style.height;

	if(document.getElementById(currentdiv).style.visibility!="visible"){
	    divPlusOne();
    }else{
        divMinusOne();
    }
}


function divMinusOne(){
    if(height >= 10) {
        height = height - 5;
        window.setTimeout('divMinusOne()');
    } 
    else {
        document.getElementById(currentdiv).style.visibility="hidden";
        document.getElementById(currentdiv).style.display="none";
    }
}

function divPlusOne(){
    if(document.getElementById(currentdiv).style.visibility!="visible"){
        document.getElementById(currentdiv).style.visibility="visible"; 
        document.getElementById(currentdiv).style.display="block"; 
    }

    if(height <= 100){
        height = height + 5;
        window.setTimeout('divPlusOne()');
    }
}

function Show_Layer(lay){
    document.getElementById(lay).style.visibility = 'visible';
} // Show

function Hide_Layer(lay) {
	document.getElementById(lay).style.visibility = 'hidden';
} // Hide

function backing(){
    goback_array.splice(backi-1,2);
    backi=backi-2;
    backing_now="returning";
}

function removeAll()
{
    goback_array.splice(0,goback_array.size);
    backi=0;
    load='';
    carLoad='';
    byMe='';
    myInterest='';
    msgMyoffers='';
    msgInterested='';
}

function loadFragment(fragment_url, element_id, for_what){
    var xmlhttp = "";
    //alert(fragment_url);
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
    var processingRequest='<table width="30%" height="100%"><tr><td align="center"><div align="center"><span class="loading"><img src="../images/loading.gif" valign="absmiddle">&nbsp;&nbsp;'+for_what+' Loading...</span></div></td></tr></table>';
    
    if(for_what=="read"){
        processingRequest='loading..';
    }else if(for_what=="addMessages"){
        processingRequest='loading..';
    }
    element.innerHTML = processingRequest;

    try{
        xmlhttp.open("GET", fragment_url);
        xmlhttp.onreadystatechange = function(){

            if (xmlhttp.readyState == 4 && xmlhttp.status == 200){
                var gotresponse	=	xmlhttp.responseText;
                var responseArray = gotresponse.split('@@');

                if(responseArray[1]=="Done"){
                    if(for_what=="addMessages"){
                        message =  '';
                        ourcities = responseArray[2].split('*dds*');
                    }else{
                        message =  responseArray[2];
                    }

                    currentVisit= fragment_url;
                }else{
                    message =  "<img src=\"../images/ack_try.jpg\" valign=\"absmiddle\">";
                    repeatTimer(messageRefresh,900000);
                }
                
                if((for_what!="Offers By Me")&&(for_what!="Offers Of My Interest")&&(for_what!="Responses For My Offers")&&(for_what!="Responses To My Interested Offers")){
                    goback_array[backi] = currentVisit+':for_what:'+for_what;
                    backi=backi+1;
               }

                var goback = '';
                if(goback_array[backi-2]){
                    goback = goback_array[backi-2].split(':for_what:');
                }

                previousAction="<img src=\"../images/but_back.gif\"  border=\"0\" align=\"absmiddle\" onclick='backing();loadFragment(\""+goback[0]+"\", \"Work-Area\", \""+goback[1]+"\")'>";
                message = message.replace("-@;back-@;",previousAction);
                element.innerHTML = message;
                                
                //if(for_what=="View Offers"){
                //    loadFragment('../requestor/viewOffers.jsp'+load, 'Work-Area', 'Offers');
                //}

                //if(for_what=="Car Pool"){
                //    loadFragment('../requestor/viewPoolings.jsp'+carLoad, 'Work-Area', 'Poolings');
                //}

                if(for_what=="My Offers"){
                    loadFragment('../requestor/myOffers_ByMe.jsp'+byMe, 'myOffersContainer1', 'Offers By Me');
                    loadFragment('../requestor/myOffers_MyInterest.jsp'+myInterest, 'myOffersContainer2', 'Offers Of My Interest');
                }

                if(for_what=="My Messages"){
                    loadFragment('../requestor/messages_MyOffers.jsp'+msgMyoffers, 'myMessagesContainer1', 'Responses For My Offers');
                    loadFragment('../requestor/messages_InterestedOffers.jsp'+msgInterested, 'myMessagesContainer2', 'Responses To My Interested Offers');
                }

            }
		}
		xmlhttp.send(null);
	 }// display an error in case of failure
	 catch (e){
	  alert("Can't connect to server:\n" + e.toString());
	 }
}

//--- Code for Ad Display in Ajax
var refreshedTime=0;
var arrMesage = -1;
var messagesToShow="";
var newMessageRefreshRate=1000;
var messageRefresh=2000;
var mouseInAdsDiv=0;
var showNumOfMessages =4;
//ourcities	=	new Array("Please "," wait "," Loading "," data ... ");
ourcities	=	new Array("<tr><td></td><td>&nbsp;</td></tr>","<tr><td></td><td>&nbsp;</td></tr>","<tr><td></td><td>&nbsp;</td></tr>","<tr><td></td><td valign='middle' align='center' class='loading' style='border:0px;'><img src='../images/loading.gif' valign='absmiddle'>&nbsp;&nbsp;Loading...</td></tr>");
var thTable= '<tr><td colspan="100%"><div class="spacerTabletopHome" style="width:100%;"><block type="spacer"></div></td></tr><tr class="trayTitle commonText homeTableHeading"><td><div style="width:20px;">No</div> </td><td colspan="2"><div style="width:230px;">Offer Title <span style="padding-left:40px;padding-top:5px;" onmouseover="mouseInAdsDiv=1;" onmouseout="mouseInAdsDiv=0;"><a href="#" class="prevNext"  onclick="arrMesage=arrMesage-showNumOfMessages;previousNext();"><img src="../images/but_previous.gif" align="absmiddle" border="0">&nbsp;Previous</a> | <a href="#"  class="prevNext" onclick="arrMesage=arrMesage+showNumOfMessages;previousNext();">Next&nbsp;<img src="../images/but_next.gif" align="absmiddle" border="0"></a></span></div></td><td><div>Request</div></td></tr><tr><td colspan="100%"><div class="spacerTabletopHome" style="width:100%;"><block type="spacer"></div></td></tr>';
function tickkerTime(messageRefreshRate){
	var tt=setTimeout("timerDoEvent();tickkerRepeatTimer();",messageRefreshRate);
}

function tickkerRepeatTimer(){
    tickkerTime(newMessageRefreshRate);
}

function previousNext(){
   
    messagesToShow="<table cellpadding='0' cellspacing='0' border='0'>"+thTable;
    if(arrMesage<0 || arrMesage>ourcities.length){
        arrMesage=0;
    }
    for(i=0;i<showNumOfMessages;i++){
        if(arrMesage+i<ourcities.length){
                messagesToShow +=''+ourcities[arrMesage+i]+'';
        }else{
                messagesToShow +=''+ourcities[(arrMesage+i)-(ourcities.length)]+'';
        }
     
    }
    messagesToShow += '</table>';
    document.getElementById('exchangeAdds').innerHTML =messagesToShow;
    if(arrMesage==ourcities.length-1){
        arrMesage=-1;
    }

}

function timerDoEvent(){
    if(mouseInAdsDiv==0){
        arrMesage++;
        messagesToShow="<table width='100%' cellpadding='0' cellspacing='0' border='0'>"+thTable;
        if(arrMesage<0 || arrMesage>ourcities.length){
             arrMesage=0;
        }
        
         if(ourcities.length<showNumOfMessages)
             showNumOfMessages=ourcities.length;
               
        for(i=0;i<showNumOfMessages;i++){
            
                if(arrMesage+i<ourcities.length){
                    messagesToShow +=''+ourcities[arrMesage+i]+'';
                }else{
                    messagesToShow +=''+ourcities[(arrMesage+i)-(ourcities.length)]+'';
                }
           
        }   	

        messagesToShow += '</table>';
        document.getElementById('exchangeAdds').innerHTML =messagesToShow;
        if(arrMesage==ourcities.length-1){
            arrMesage=-1;
        }
    }
}

function timedMsg(howMuchTime){
    var t=setTimeout("doEvent();repeatTimer("+messageRefresh+",900000);",howMuchTime);
}

function repeatTimer(messageAt,newFetchAt){
    newMessageRefreshRate=messageAt;
    timedMsg(newFetchAt);//Set to 60 Seconds
}

function doEvent(){
    loadFragment('../requestor/messageCount.jsp','messageCount', 'Messages');
    loadFragment('../requestor/writeFile.jsp','exchangeAdds', 'addMessages');
    //loadFragment('../../groupware/requestor/writeMessages.jsp','messages', 'Group Messages');
}