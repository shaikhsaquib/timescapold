<link href="../style/compliance.css" rel="stylesheet" type="text/css" />
<script Language="JavaScript" src="../jscripts/daily.js"></script>
<script Language="JavaScript" src="../jscripts/common.js"></script>

<table width="100%" border="0" cellpadding="1" cellspacing="1">
<%
     ArrayList headerResult = new ArrayList();
	 String search = "header";
	 String header = "";
	 String subHeader = "";
     
     headerResult = policyController.viewPolicies(search, header, subHeader, timescapeUserOId, frequency, roleId, date);

	for(int ii=0;ii<headerResult.size();ii++){

		String[] tmpArr = (String [] )headerResult.get(ii); 
%>
	
 <tr>
		<td height="20px" colspan = "100%" align="left" valign="middle" bgcolor="#E0E78F" class="headCompliance" onclick="displaySubHead('<%=Utility.replaceAmparsandURL(tmpArr[0])%>',<%=ii%>,<%=frequency%>, '<%=date%>')"><%=tmpArr[0]%></td>
	</tr>
	<tr>
		<td  height="20px"  align="left" colspan = "100%" id="subHeader<%=ii%>"  style="display:none;"  valign="middle" bgcolor="#FFFFFF" class="subHeadCompliance">&nbsp;</td>
	</tr> 
<%
	}
%>
</table>
