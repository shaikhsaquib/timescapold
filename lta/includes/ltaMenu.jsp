
<%	
	if ( ltaRoleId.equals("2")) {

%>
		<table class="navbar" width="100%" noresize>
			<tr>
				<td width = "50%"></td>
				<td class="" width="" onmouseover="expand(this);"
				onmouseout="collapse(this);">
				<p><img src=" ../images/related_links.png">&nbsp;&nbsp;Related Links</p>
				<div class="menuNormal" width="155">

				  <table class="menu" width="155">
					<tr>
					<!-- SUBMENU 1 START  -->
					   <td class="menuNormal" width="100" onmouseover="expand(this);" 
					  onmouseout="collapse(this);"><a href="../requestor/apply.jsp"  class="menuNormal">Submit LTA
						<div class="menuNormal" width="100"></td></tr>

					  <td class="menuNormal" width="100" onmouseover="expand(this);" 
					  onmouseout="collapse(this);"><a href="../approver/approve.jsp"  class="menuNormal">Approve LTA
						<div class="menuNormal" width="100"></td></tr>
					  
					  <tr>
					  <td class="menuNormal" width="100" onmouseover="expand(this);" 
					  onmouseout="collapse(this);"><a href="../approver/checkDetails.jsp"  class="menuNormal">Check History
						<div class="menuNormal" width="100"></td></tr>

<!-- 						<tr> <td class="menuNormal" width="100" onmouseover="expand(this);" 
					  onmouseout="collapse(this);"><a href="../serviceJobsheetStatus.jsp" class="menuNormal" >Profile Manager
						<div class="menuNormal" width="100"></td></tr>	 -->	
					
				  </table>
				</div>
			  </td>
			<tr>
		<table>			  

<%
	
	} else if ( ltaRoleId.equals("1")) {
	
%>
<!-- 		<table class="navbar" width="100%" noresize>
			<tr>
				<td width = "50%"></td>
				<td class="" width="" onmouseover="expand(this);"
				onmouseout="collapse(this);">
				<p><img src=" ../images/plus.gif">&nbsp;&nbsp;Related Link</p>
				<div class="menuNormal" width="155">

				  <table class="menu" width="155">
					<tr> -->
					<!-- SUBMENU 1 START  -->
<!-- 
						<tr> <td class="menuNormal" width="160" onmouseover="expand(this);" 
					  onmouseout="collapse(this);"><a href="../serviceJobsheetStatus.jsp" >Profile Manager
						<div class="menuNormal" width="155"></td></tr>		
					
				  </table>
				</div>
			  </td>
			<tr>
		<table>	
 -->
<%
	}
%>