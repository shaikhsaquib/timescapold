function ajax(id)
{
			if (window.XMLHttpRequest)
			{// code for IE7+, Firefox, Chrome, Opera, Safari
						xmlhttp=new XMLHttpRequest();
				
			}
		else
			{// code for IE6, IE5
						xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			}			
					
				//var j = 1;	
			xmlhttp.onreadystatechange=function()
								{
								  	if(xmlhttp.readyState==4 && xmlhttp.status==200)
									{
										document.getElementById("showData").innerHTML=xmlhttp.responseText;	
									}																	
								}
 		//alert("access.php?id="+id+"");						
		xmlhttp.open("POST","access.jsp?ids="+id,true);
		xmlhttp.send();
}