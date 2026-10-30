<%
	int myInt = 10;
	String myString = String.valueOf(myInt);
%>

<table width="100%" cellPadding=0 cellSpacing=0 border="0" bgcolor="#F4F2F2">
    <tr>
        <td colspan="100%" align="left" class="normalBig" height="30px" bgcolor="#e5e5e5">&nbsp;<b>Upload File</b></td>
    </tr>

    <tr>
      <td colSpan=3><img height=2 src="../images/spacer.gif" width=1></td>
    </tr>

    <tr bgColor=#ffffff>
      <td class="bold" colSpan=3>
        <table width="100%" border="0" cellpadding=0 cellspacing=0 bgcolor="#F4F2F2">
             <tr>
               <td colspan = "3" height = "20"> &nbsp;</td>
             </tr>             
			  <tr style="border:1px solid #000000;">
				<td class = "bold" width="35%"align = "right" >Select the file : &nbsp;</td>
				<!-- <td class = "bold" width="5%">:</td>   -->
				<td class = "bold" width="65%" valign = "top"> &nbsp;
					<input type="file" class = "bold" name="uploadFile" value="">
				</td>
              </tr>
                                                                       
              <tr>
                    <td colspan = "3" height = "20"> &nbsp;</td>
              </tr>

            			<tr>
				<td height="30px" width="30%" align="right">&nbsp;</td>
				<td height = "30px" align = "left" class = "bold">&nbsp;
				<input name="Submit" type="button"  value="SUBMIT" onclick = "javascript:validateFields();" />
				&nbsp;<input name="Reset" type="button"  value="RESET" onclick = "this.form.reset();" /></td>
			</tr>     
        </table>
      </td>
    </tr>
 
</table>

<!-- Hidden Fields -->
<input type="hidden" name="hiddIndex" value="<%=myString%>"/>
<!-- <input type="submit"> -->
	
