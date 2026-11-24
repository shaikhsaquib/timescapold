<table  width="100%" cellPadding=0 cellSpacing=0 border="0">

    <tr bgcolor="#E0E78F">
        <td colspan="310%" class="whiteCopy" height="30" align= "left">&nbsp;<strong>Upload File</strong></td>
    </tr>

    <tr>
      <td colSpan=3><img height=2 src="../images/spacer.gif" width=1></td>
    </tr>

    <tr bgColor=#F7F7F7>
      <td class="normal" colSpan=3>
        <table width="100%" border="0" cellpadding=0 cellspacing=0 >
               <tr>
                    <td colspan = "3" height = "20"> &nbsp;</td>
              </tr>
             
              <tr>
                    <td colspan = "3" class = "style2" valign="top">&nbsp;Select the file : 
                        <input type="file" class = "normal" name="uploadFile" value="">
                    </td>
              </tr>
                             
            
                                          
              <tr  bgColor=#F7F7F7>
                    <td colspan = "3" height = "20"> &nbsp;</td>
              </tr>

            <tr  bgColor=#F7F7F7>
                <td align=center class="normal" width = "10%">&nbsp;
                </td> 
                 <td height=20 align=left class="normal">
					<img src="../images/spacer.gif" width="35" height="0" border="0">
					<input type="button" name="Submit" value="Submit" onclick="javascript:validateFields(<%=attachNo%>);">&nbsp;&nbsp;&nbsp;
                    <input type="button" name="Reset" value="Reset" onclick="javascript:document.frmUploadFile.reset();">
                </td>

                <td height=20 align=middle class="normal" width = "20%">
                </td>
            </tr>
           
        </table>
      </td>
    </tr>
 
</table>