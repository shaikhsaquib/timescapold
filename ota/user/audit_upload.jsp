<%@ include file="../includes/empHeader.jsp" %>

<%@ page import="java.util.Hashtable, java.util.HashMap, java.util.ArrayList, java.util.Calendar, java.util.GregorianCalendar, java.util.Date, java.io.File, java.text.SimpleDateFormat" %>

<%@ page import="java.sql.Connection" %> 
<%@ page import="java.sql.PreparedStatement" %> 
<%@ page import="java.sql.ResultSet" %> 
<%@ page import="java.sql.DriverManager" %>

<!DOCTYPE html> <html lang="en">

<head>

<title>Audit Recommendations</title>

<meta charset="utf-8"> <meta http-equiv="X-UA-Compatible" content="IE=edge"> <meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="../bootstrap-3.3.2-dist/css/bootstrap.min.css">

<link rel="stylesheet" href="../css/ota.css"/>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="../js/bootstrap.min.js"></script>

<!-- SELECT2 SEARCH DROPDOWN -->

<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />

<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

<style>

body{ font-family:Calibri; font-size:16px; color:#000; }

.form-row{ display:flex; flex-wrap:nowrap; gap:15px; padding:15px; border:1px solid #BBBBBB; overflow-x:auto; background:#fff; margin-bottom:15px; align-items:flex-start; }

.form-group{ display:flex; flex-direction:column; min-width:220px; }

label{ font-weight:bold; color:#2F6C87; font-size:12px; margin-bottom:5px; }

.form-control{ border-radius:4px; height:36px; }

textarea.form-control{ height:70px !important; resize:none; }

.icon-btn{ width:40px; height:40px; padding:0; font-size:16px; text-align:center; }

.select2-container{ width:220px !important; }

.select2-container .select2-selection--single{ height:36px !important; padding-top:3px; }

.btn-row{ margin-top:20px; }

</style>

<script>

let maxRows = 10;

$(document).ready(function(){

    initializeSelect2();

    // Set today's date as minimum
    let today = new Date().toISOString().split('T')[0];

    $("input[name='targetDate[]']").attr("min", today);

});

function initializeSelect2(){

    $('.searchDropdown').select2({

        placeholder:"Search Email ID",
        allowClear:true,
        width:'220px'

    });

}

function addRow(){

    let container = document.getElementById("rowsContainer");

    let rows = container.querySelectorAll(".form-row");

    if(rows.length >= maxRows){

        alert("Maximum 10 rows allowed");

        return;
    }

    // Destroy select2 before cloning
    $('.searchDropdown').select2('destroy');

    let firstRow = rows[0];

    let newRow = firstRow.cloneNode(true);

    // Clear textarea + input
    newRow.querySelectorAll("input, textarea").forEach(function(el){

        el.value = "";

    });

    // Reset dropdowns
    newRow.querySelectorAll("select").forEach(function(el){

        el.selectedIndex = 0;

    });

    // Remove old select2 generated HTML
    $(newRow).find("span.select2").remove();

    // Remove hidden class
    $(newRow).find("select").removeClass("select2-hidden-accessible");

    // Append row
    container.appendChild(newRow);

    // Set min date for new row
    let today = new Date().toISOString().split('T')[0];

    $(newRow).find("input[name='targetDate[]']").attr("min", today);

    // Reinitialize Select2
    initializeSelect2();
}

function removeRow(btn){

let rows = document.querySelectorAll(".form-row");

if(rows.length == 1){

alert("At least one row required");

return; }

btn.closest(".form-row").remove(); }

 

 function validateRows() {

    var rows = document.querySelectorAll("#rowsContainer .form-row");

    var emailPattern = /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/;

    var yearPattern = /^\d{4}-\d{2}$/;

    for (var i = 0; i < rows.length; i++) {

        var row = rows[i];

        var year = row.querySelector("select[name='year[]']").value.trim();

        var entity = row.querySelector("select[name='entity[]']").value.trim();

        var severity = row.querySelector("select[name='severety[]']").value.trim();

        var area = row.querySelector("textarea[name='area[]']").value.trim();

        var obsTitle = row.querySelector("textarea[name='observationtitle[]']").value.trim();

        var observation = row.querySelector("textarea[name='observation[]']").value.trim();

        var recommendation = row.querySelector("textarea[name='recommendation[]']").value.trim();

        var mangComments = row.querySelector("textarea[name='mangComments[]']").value.trim();

        var targetDate = row.querySelector("input[name='targetDate[]']").value.trim();

        var userResp = row.querySelector("select[name='userResp[]']").value.trim();

        var superResp = row.querySelector("select[name='superResp[]']").value.trim();

        // ===== YEAR VALIDATION =====

        if (year === "") {

            alert("Please select Year (Row " + (i + 1) + ")");

            row.querySelector("select[name='year[]']").focus();

            return false;
        }

        if (!yearPattern.test(year)) {

            alert("Invalid Year Format (Row " + (i + 1) + ")");

            row.querySelector("select[name='year[]']").focus();

            return false;
        }

        // ===== ENTITY =====

        if (entity === "") {

            alert("Please select Entity (Row " + (i + 1) + ")");

            row.querySelector("select[name='entity[]']").focus();

            return false;
        }

        // ===== SEVERITY =====

        if (severity === "") {

            alert("Please select Severity (Row " + (i + 1) + ")");

            row.querySelector("select[name='severety[]']").focus();

            return false;
        }

        // ===== AREA =====

        if (area === "") {

            alert("Please enter Area (Row " + (i + 1) + ")");

            row.querySelector("textarea[name='area[]']").focus();

            return false;
        }

        // ===== OBSERVATION TITLE =====

        if (obsTitle === "") {

            alert("Please enter Observation Title (Row " + (i + 1) + ")");

            row.querySelector("textarea[name='observationtitle[]']").focus();

            return false;
        }

        // ===== OBSERVATION =====

        if (observation === "") {

            alert("Please enter Observation (Row " + (i + 1) + ")");

            row.querySelector("textarea[name='observation[]']").focus();

            return false;
        }

        // ===== RECOMMENDATION =====

        if (recommendation === "") {

            alert("Please enter Recommendation (Row " + (i + 1) + ")");

            row.querySelector("textarea[name='recommendation[]']").focus();

            return false;
        }

        // ===== MANAGEMENT COMMENTS =====

        if (mangComments === "") {

            alert("Please enter Management Comments (Row " + (i + 1) + ")");

            row.querySelector("textarea[name='mangComments[]']").focus();

            return false;
        }

        // ===== TARGET DATE =====

        if (targetDate === "") {

            alert("Please select Target Date (Row " + (i + 1) + ")");

            row.querySelector("input[name='targetDate[]']").focus();

            return false;
        }

        // ===== USER EMAIL =====

        if (userResp === "") {

            alert("Please select User Email (Row " + (i + 1) + ")");

            row.querySelector("select[name='userResp[]']").focus();

            return false;
        }

        if (!emailPattern.test(userResp)) {

            alert("Invalid User Email (Row " + (i + 1) + ")");

            row.querySelector("select[name='userResp[]']").focus();

            return false;
        }

        // ===== SUPERVISOR EMAIL =====

        if (superResp === "") {

            alert("Please select Supervisor Email (Row " + (i + 1) + ")");

            row.querySelector("select[name='superResp[]']").focus();

            return false;
        }

        if (!emailPattern.test(superResp)) {

            alert("Invalid Supervisor Email (Row " + (i + 1) + ")");

            row.querySelector("select[name='superResp[]']").focus();

            return false;
        }

    }

    return true;
}

</script>

</head>

<body>

<div style="background:#3784a5; padding:0%; height:50px;">

<div class="col-lg-10 col-md-10 col-sm-10" style="padding:0; float:left; height:50px;">

<img src="../images/header.png">

</div>

<div style="float:right; width:200px;">

<%@ include file="../includes/relatedLinks.jsp" %>

</div>

</div>

<div class="col-md-12 col-sm-12 col-xs-12" style="background:#E6E6E6;">

<div class="col-md-4 pad0">

<h5 style="color:#2F6C87; font-weight:bold; font-size:18px; padding-top:2%;">

Single Upload

</h5>

<br>

</div>

</div>

<br><br><br>

<form name="myForm"
method="post"
action="AuditsingleUploadSubmit.jsp"
onsubmit="return validateRows()">

<div id="rowsContainer">

<div class="form-row">

<!-- YEAR -->

<div class="form-group">

<label>Year</label>

<select class="form-control" name="year[]">

<option value="">Select</option>

<option>2025-26</option>

<option>2026-27</option>

</select>

</div>

<!-- ENTITY -->

<div class="form-group">

<label>Entity</label>

<select class="form-control" name="entity[]">

<option value="">Select</option>
<option>Bennett University</option> 
<option>BMIL</option> 
<option>Brand Estate</option> 
<option>Dharmayug</option> 
<option>ENIL</option> 
<option>Junglee Pictures</option> 
<option>Magic Bricks</option> 
<option>NMI</option> 
<option>Times Music</option> 
<option>Times Out of Home</option> 
<option>Times Pro</option> 
<option>Times Television</option> 
<option>TSSL</option> 
<option>Pickle Ball</option> 
<option>WWM</option> 
<option>Others</option>
</select>

</div>

<!-- SEVERITY -->

<div class="form-group">

<label>Severity</label>

<select class="form-control" name="severety[]">

<option value="">Select</option>

<option>High</option> <option>Medium</option> <option>Low</option>

</select>

</div>

<!-- AREA -->

<div class="form-group">

<label>Area</label>

<textarea class="form-control" name="area[]"></textarea>

</div>

<!-- OBSERVATION TITLE -->

<div class="form-group">

<label>Observation Title</label>

<textarea class="form-control" name="observationtitle[]"></textarea>

</div>

<!-- OBSERVATION -->

<div class="form-group">

<label>Observation</label>

<textarea class="form-control" name="observation[]"></textarea>

</div>

<!-- RECOMMENDATION -->

<div class="form-group">

<label>Recommendation</label>

<textarea class="form-control" name="recommendation[]"></textarea>

</div>

<!-- MANAGEMENT COMMENTS -->

<div class="form-group">

<label>Management Comments</label>

<textarea class="form-control" name="mangComments[]"></textarea>

</div>

<!-- TARGET DATE -->

<div class="form-group">

<label>Target Date</label>

 <input type="date" class="form-control" name="targetDate[]" min="">
</div>

<!-- USER EMAIL -->

<div class="form-group">

<label>User Email</label>

<select class="form-control searchDropdown" name="userResp[]">

<option value="">Select User</option>

<%

Connection con = null; PreparedStatement ps = null; ResultSet rs = null;

try{

String url = "jdbc:oracle:thin:@192.168.81.97:1521:pkn";

String dbUser = "gtimescapeweb";

String dbPass = "apitimescape";

Class.forName("oracle.jdbc.driver.OracleDriver");

con = DriverManager.getConnection( url, dbUser, dbPass );

String sql = "SELECT Emailid FROM TIMESGROUPEMPLOYEE WHERE status='A' ORDER BY Emailid";

ps = con.prepareStatement(sql);

rs = ps.executeQuery();

while(rs.next()){

String email = rs.getString("Emailid");

%>

<option value="<%=email%>"> <%=email%> </option>

<%

}

}catch(Exception e){

out.println(e);

}finally{

try{

if(rs != null) rs.close();

if(ps != null) ps.close();

if(con != null) con.close();

}catch(Exception ex){

out.println(ex);

}

}

%>

</select>

</div>

<!-- SUPERVISOR EMAIL -->

<div class="form-group">

<label>Supervisor Email</label>

<select class="form-control searchDropdown" name="superResp[]">

<option value="">Select Supervisor</option>

<%

Connection con2 = null; PreparedStatement ps2 = null; ResultSet rs2 = null;

try{

String url = "jdbc:oracle:thin:@192.168.81.97:1521:pkn";

String dbUser = "gtimescapeweb";

String dbPass = "apitimescape";

Class.forName("oracle.jdbc.driver.OracleDriver");

con2 = DriverManager.getConnection( url, dbUser, dbPass );

String sql2 = "SELECT Emailid FROM TIMESGROUPEMPLOYEE WHERE status='A' ORDER BY Emailid";

ps2 = con2.prepareStatement(sql2);

rs2 = ps2.executeQuery();

while(rs2.next()){

String email2 = rs2.getString("Emailid");

%>

<option value="<%=email2%>"> <%=email2%> </option>

<%

}

}catch(Exception e){

out.println(e);

}finally{

try{

if(rs2 != null) rs2.close();

if(ps2 != null) ps2.close();

if(con2 != null) con2.close();

}catch(Exception ex){

out.println(ex);

}

}

%>

</select>

</div>

<!-- REMOVE BUTTON -->

<div class="form-group" style="min-width:80px; margin-top:22px;">

<label>&nbsp;</label>

<button type="button"
class="btn btn-danger icon-btn"
onclick="removeRow(this)">
X
</button>

</div>

</div>

</div>

<div style="margin:10px;">

<button type="button" class="btn btn-primary icon-btn" onclick="addRow()">

+

</button>

<input type="submit" class="btn btn-danger" value="Submit" style="height:40px; margin-left:10px;">

</div>

</form>

</body>

</html>