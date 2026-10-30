<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
</head>
<jsp:useBean id="competitiondatacaptureWebController" class="com.bccl.competitiondatacapture.web.controller.competitiondatacaptureWebController" />

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css"
        rel="stylesheet" type="text/css" />
    <script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js"
        type="text/javascript"></script>
		<script Language="JavaScript" src="jscripts/newsprint.js"></script>
    <script type="text/javascript">
        $(function () {
            $('#lstFruits').multiselect({
                includeSelectAllOption: true
            });
            $('#btnSelected').click(function () {
                var selected = $("#lstFruits option:selected");
                var message = "";
                selected.each(function () {
                    message += $(this).text() + " " + $(this).val() + "\n";
					
                });
                //alert(message);

            });
        });
    </script>

	<script type="text/javascript">
		
		 function getSelectedOptions(sel) {
			// alert("HII");
  $('#lstFruits').multiselect({
                includeSelectAllOption: true
            });
            
                var selected = $("#lstFruits option:selected");
                var message = "";
				var url;
                selected.each(function () {
                    message += "" + $(this).val() + "','";

					loadFragment1("includes/ss.jsp?message="+message, "metrics", "Data");


                });
                //alert(url);
}

    </script>
    <%
Hashtable zoneData = new Hashtable();

	ArrayList zoneList	=  new ArrayList();
	String zoneDataArry[] = null;
	String lstZons = "";
	String plantName = "";
	String selected = "";
	String nprString = "NEWSPRINT";

	//zoneData.put("BUYEREMAILID","laveena.gupta@timesgroup.com");
	//zoneData.put("STATUS","A");
	zoneList =	priceApprovalWebController.listSubCategories(nprString);
%>
<h5>Competetion Section</h5>

<table border = "1" width = "100%">
<tr width = "100%">
	<td width = "80%">
    <select id="lstFruits" multiple="multiple" onchange="getSelectedOptions(this);">
        <!-- <option value="0">Select Plant</option> -->
						
						<%
						for(int kk=0;kk<zoneList.size();kk++)
						{
						String tempArr[] = (String[])zoneList.get(kk);

								if(plantName.equals(tempArr[0]))
								//selected="selected";
								//else
								//selected="";
								%>
						<option value="<%=tempArr[0]%>" <%=selected%>><%=tempArr[0]%></option>
						<%
						}
						%>
    </select>
	</td>
	 <!-- <td width = "20%" colspan = "4"><input type="button" id="btnSelected" value="Select" /></td>  -->
	<td ><div id="dummy"></div>​</td>
</tr>
</table>	


</html>
