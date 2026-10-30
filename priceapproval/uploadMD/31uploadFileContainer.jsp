<%
	String attachment = (String)request.getParameter("attachment");
	String str = (String)request.getParameter("str");
	String formName = (String)request.getParameter("formName");

	//String impact = (String)request.getParameter("impact");
	//String supportedBy = (String)request.getParameter("supportedBy");
	//String attachment = (String)request.getParameter("uploadFilePath");
	//System.out.println("index no is"+index);
//out.println(" : "+ attachment + " : "+str + " : "+formName); 
%>

<table width="100%" cellPadding=0 cellSpacing=0 border="0">
    <tr  bgcolor="#2AA295">
        <td colspan="100%" align = "center" class="style1" height="20">&nbsp;Upload File</td>
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
                    <input name="Submit" type="button" class="redButton" value="Submit" onclick = "validateFields();" />
					<input name="Reset" type="button" class="redButton" value="Reset" onclick = "this.form.reset();" />
                </td>
            </tr>           
        </table>
      </td>
    </tr>
 
</table>

	
<input type = "hidden" name = "attachmentName" id = "attachmentName" value = "<%=attachment%>" >
<input type = "hidden" name = "requestStr" id = "requestStr" value = "<%=str%>" >
<input type = "hidden" name = "formName" id = "formName" value = "<%=formName%>" >
