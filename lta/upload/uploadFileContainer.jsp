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
 <!DOCTYPE >
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
	<link href="../jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet"/>  
	<link href="../bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"/> 
	<link href="../css/attach.css" rel="stylesheet"/>		
	<style>
	.form-control {
		height: 38px;
		//padding-bottom:42px;
	}

	</style>
<script src="http://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="http://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<script src="../jscript/jquery-1.9.1.min.js"></script>
<script src="../jquery-ui-1.11.4.custom/jquery-ui.js"></script>
<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<div class="row">
<div class="col-xs-12">
<table class="table table-bordered" id="">
	<thead>
		<tr class="info" >
			<th class="text-center" width="15%" colspan="2" > Upload File</th>
		</tr>
	</thead>
	<tbody>
		<tr class="">
			<td class="text-center" width="15%">Select the file</td>
			<td class="text-center" width="19%" height="35px" ><input type="file" name="uploadFile" value="" ></td>
		</tr>
	</tbody>
</table>

</div>
</div>
<div class="row">
<div class="col-xs-9">
	<div class="row">
		<div class="col-xs-offset-6 col-xs-6">		
			<button type="Button" name= "Submit" class="btn btn-danger" onclick = "validateFields();" >Submit</button>&nbsp;&nbsp;
			<button type="Button" name= "Reset" class="btn btn-danger" onclick = "this.form.reset();">Reset</button>			
		</div>
		
	</div>
</div>
<div class="col-xs-6">
</div>
</div>



	
<input type = "hidden" name = "attachmentName" id = "attachmentName" value = "<%=attachment%>" >
<input type = "hidden" name = "requestStr" id = "requestStr" value = "<%=str%>" >
<input type = "hidden" name = "formName" id = "formName" value = "<%=formName%>" >
