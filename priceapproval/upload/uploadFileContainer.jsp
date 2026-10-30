<%--
 -- Project Approval
 -- @(#)uploadFileContainer.jsp	13/06/2012
 --
 -- Copyright 2009 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author		Ashutosh Shimpi
 -- @version 	1.00, 13/06/2012
 --%>
   
<%
	String requestNo = (String)request.getParameter("requestNo");
	//String formName = (String)request.getParameter("formName");
	//System.out.println("Container"+formName);

	//String impact = (String)request.getParameter("impact");
	//String supportedBy = (String)request.getParameter("supportedBy");
	//String attachment = (String)request.getParameter("uploadFilePath");
	//System.out.println("index no is"+index);

%>

<table width="100%" cellPadding=0 cellSpacing=0 border="0">
    <tr>
        <td background="../images/red_shadow.jpg" colspan="100%" align = "center" class="style5Copy" height="20">&nbsp;Upload File</td>
    </tr>

    <tr>
      <td colSpan=3><img height=2 src="../images/spacer.gif" width=1></td>
    </tr>

    <tr bgColor=#ffffff>
      <td class="bold" colSpan=3>
        <table width="100%" border="0" cellpadding=0 cellspacing=0 >
             <tr>
               <td colspan = "3" height = "20"> &nbsp;</td>
             </tr>             
			  <tr>
				<td class = "bold" width="30%">&nbsp;Select the file</td>
				<td class = "bold" width="5%">:</td>  
				<td class = "bold" width="65%" valign = "top"> 
					<input type="file" class = "bold" name="uploadFile" value="">
				</td>
              </tr>
                                                                       
              <tr>
                    <td colspan = "3" height = "20"> &nbsp;</td>
              </tr>

            <tr>
                 <td colspan = "3" height = "20" align = "center" class = "bold">
                    <input name="Submit" type="button" value="Submit" onclick = "validateFields('<%=attachmentName%>');" />
					<input name="Reset" type="button"  value="Reset" onclick = "this.form.reset();" />
                </td>
            </tr>           
        </table>
      </td>
    </tr>
 
</table>

<!-- Hidden Fields -->
<input type = "hidden" name = "hiddRequestNo" value = "<%=requestNo%>" >
<!-- <input type="submit"> -->
	
