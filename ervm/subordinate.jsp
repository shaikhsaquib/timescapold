<!DOCTYPE html>
<html>
<head>
	<meta content="width=device-width, initial-scale=1" name="viewport">
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<link href="../css/ervm.css" rel="stylesheet"/>
	<script src="../js/jquery.min.js">
	</script>
	<script src="../js/bootstrap.min.js">
	</script>
	<title>Audit Recommendations | Subordinate</title>

	<style>
		label, input{
		color: #2F6C87;
		font-size: 12px;
	}

	body{
		color: #000;
		font-size: 12px;
	}
	p{
		font-size: 12px;
	}

	.font12{
		font-size: 12px;
	}

	.pad0{
		padding: 0 !important;
	}

	@media only screen and (max-width: 600px){
		.mob_pad{
			padding: 0 !important;
		}
	}	
	@media only screen and (min-width: 601px){
		.mob_pad{
			padding-left: 0 !important;
		}
	}	
	</style>
	<script>
	$(document).ready(function() {
	$('.RelatedLinks ul li.RelLinks').hover(function() {
			$(this).find('.dropdownmenu').show();
		}, function(){
			$(this).find('.dropdownmenu').hide();
	});
	});
	</script>
</head>
<body>
	<div class="col-md-12 col-sm-12" style="padding: 0;">
		<img src="images/header.png" style="width: 100%;">
	</div>
	<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10" style="">
				<%@ include file="../includes/relatedLinks.jsp" %>
	</div>
	<div class="col-md-12 col-sm-12 col-xs-12" style="background: #ffffff; border-bottom: 1px solid #E6E6E6;">
		<div class="col-md-12 col-sm-12 col-xs-12" style="margin-top: 2%;">
			<p><span style="font-weight: bold; font-size: 12px;">Recommendation 1.</span><br>
			We have a lot of people ask us about starting a non-profit, most of the time they ask about �how they can start an orphanage� so much of the information in this page is specific for orphanages. We can�t give the best idea in regards to how much it costs to run a non-profit as our organization is not really comparable given that we grow most of our own food, run our own school,do all our own maintenance/vehicle repairs and also make much of our furniture/buildings/clothing� etc. ?</p>
		</div>
		
		<div class="col-md-2 col-sm-2 col-xs-12">
			<div class="form-group">
				<label for="Area">Severity</label> 
				<input class="form-control" id="Area" readonly type="text" value="High" style="font-size: 12px !important;"">
			</div>
		</div>
		<div class="col-md-2 col-sm-2 col-xs-12">
			<div class="form-group font12">
				<label for="Severety">Status</label> <select class="form-control" id="Severety">
					<option>
						<span class="font12">Implemented</span>
					</option>
					<option>
						Not Implemented
					</option>
					<option>
						In Progress
					</option>
				</select>
			</div>
		</div>
		<div class="col-md-2">
		</div>
		<div class="col-md-2 col-sm-3 col-xs-12">
			<div class="form-group">
				<label for="Action_Taken">Attachment</label> <input id="myFile" required="" style="width: 100%;" type="file">
			</div>
		</div>
		<div class="col-md-4">
		</div>
		
		<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="col-md-6 col-sm-6 col-xs-12 mob_pad">
				<div class="form-group">
					<label for="Action_Taken">Remarks</label> 
					<textarea class="form-control" id="Action_Taken" maxlength="1000" rows="2" style="resize: none; font-size: 12px;">We have a lot of people ask us about starting a non-profit, most of the time they ask about �how they can start an orphanage� so much of the information in this page is specific for orphanages.</textarea>
				</div>
			</div>
			<div class="col-md-6 col-sm-6 col-xs-12 mob_pad">
				<div class="form-group">
					<label for="Action_Taken">Supervisor's Remarks</label> 
					<textarea class="form-control" id="Action_Taken" maxlength="1000" rows="2" style="resize: none; font-size: 12px;" readonly ></textarea>
				</div>
			</div>
		</div>
		<div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 2%;">
			<button class="btn btn-info" data-target="#demo" data-toggle="collapse" type="button" style="font-size: 12px;">More Details</button>
			<div class="collapse" id="demo">
				<div class="col-md-12 col-sm-12 col-xs-12 pad0">
					<div class="col-md-4 col-sm-4 col-xs-12 mob_pad">
						<div class="form-group">
							<label for="Area">Area</label> <input class="form-control" id="Area" readonly type="text" value="TGIT" style="font-size: 12px !important;">
						</div>
					</div>
					<div class="col-md-3 col-sm-4 col-xs-12 mob_pad">
						<div class="form-group">
							<label for="person_responsible">Person Responsible</label> 
							<input class="form-control" id="person_responsible" type="text" value="Mr. Rishiraj Shukla" readonly style="font-size: 12px !important;">
						</div>
					</div>
					<div class="col-md-5 col-sm-4 col-xs-12 mob_pad">
						<div class="form-group">
							<label for="Mgmt_Comments">Management Comments (as per released report)</label> 
							<textarea class="form-control" id="Mgmt_Comments" maxlength="500" rows="2" style="resize: none; font-size: 12px !important;" readonly>This is manedtary for checker mechanism for accurate parking and posting of entries in SAP</textarea>
						</div>
					</div>
				</div>
				<div class="col-md-12 col-sm-12 col-xs-12 pad0">	
					<div class="col-md-4 col-sm-4 col-xs-12 mob_pad">
						<div class="form-group">
							<label for="person_responsible">Target Implementation Date (as per released report)</label> <input name="target_date" required="" style="width: 100%; border-radius: 5px;" type="date">
						</div>
					</div>
					<div class="col-md-4 col-sm-4 col-xs-12 mob_pad">
						<div class="form-group">
							<label for="revised_target_date">Revised Target Implementation Date</label>
							<input type="date" name="revised_target_date" style="width: 100%; border-radius: 5px;" required>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="col-md-12 col-sm-12 col-xs-12" style="border-bottom: 1px solid #E6E6E6;">
		<div class="col-md-12 col-sm-12 col-xs-12" style="margin-top: 2%;">
			<p><span style="font-weight: bold;">Recommendation 2.</span><br>
			Is the many poor countries orphans are often seen wondering about begging for money and food; many may not be going to school. Not much organised help exists for them in poor countries  ? </hp>
		</div>
		
		<div class="col-md-2 col-sm-2 col-xs-12">
			<div class="form-group">
				<label for="Area">Severity</label> 
				<input class="form-control" id="Area" readonly type="text" value="High" style="font-size: 12px !important;"">
			</div>
		</div>
		<div class="col-md-2 col-sm-2 col-xs-12">
			<div class="form-group font12">
				<label for="Severety">Status</label> <select class="form-control" id="Severety">
					<option>
						<span class="font12">Implemented</span>
					</option>
					<option>
						Not Implemented
					</option>
					<option>
						In Progress
					</option>
				</select>
			</div>
		</div>
		<div class="col-md-2">
		</div>
		<div class="col-md-2 col-sm-3 col-xs-12">
			<div class="form-group">
				<label for="Action_Taken">Attachment</label> <input id="myFile" required="" style="width: 100%;" type="file">
			</div>
		</div>
		<div class="col-md-4">
		</div>
		
		<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="col-md-6 col-sm-6 col-xs-12 mob_pad">
				<div class="form-group">
					<label for="Action_Taken">Remarks</label> 
					<textarea class="form-control" id="Action_Taken" maxlength="1000" rows="2" style="resize: none; font-size: 12px;">We have a lot of people ask us about starting a non-profit, most of the time they ask about �how they can start an orphanage� so much of the information in this page is specific for orphanages.</textarea>
				</div>
			</div>
			<div class="col-md-6 col-sm-6 col-xs-12 mob_pad">
				<div class="form-group">
					<label for="Action_Taken">Supervisor's Remarks</label> 
					<textarea class="form-control" id="Action_Taken" maxlength="1000" rows="2" style="resize: none; font-size: 12px;" readonly ></textarea>
				</div>
			</div>
		</div>
		<div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 2%;">
			<button class="btn btn-info" data-target="#demo1" data-toggle="collapse" type="button" style="font-size: 12px;">More Details</button>
			<div class="collapse" id="demo1">
				<div class="col-md-12 col-sm-12 col-xs-12 pad0">
					<div class="col-md-4 col-sm-4 col-xs-12 mob_pad">
						<div class="form-group">
							<label for="Area">Area</label> <input class="form-control" id="Area" readonly type="text" value="TGIT" style="font-size: 12px !important;">
						</div>
					</div>
					<div class="col-md-3 col-sm-4 col-xs-12 mob_pad">
						<div class="form-group">
							<label for="person_responsible">Person Responsible</label> 
							<input class="form-control" id="person_responsible" type="text" value="Mr. Rishiraj Shukla" readonly style="font-size: 12px !important;">
						</div>
					</div>
					<div class="col-md-5 col-sm-4 col-xs-12 mob_pad">
						<div class="form-group">
							<label for="Mgmt_Comments">Management Comments (as per released report)</label> 
							<textarea class="form-control" id="Mgmt_Comments" maxlength="500" rows="2" style="resize: none; font-size: 12px !important;" readonly>This is manedtary for checker mechanism for accurate parking and posting of entries in SAP</textarea>
						</div>
					</div>
				</div>
				<div class="col-md-12 col-sm-12 col-xs-12 pad0">	
					<div class="col-md-4 col-sm-4 col-xs-12 mob_pad">
						<div class="form-group">
							<label for="person_responsible">Target Implementation Date (as per released report)</label> <input name="target_date" required="" style="width: 100%; border-radius: 5px;" type="date">
						</div>
					</div>
					<div class="col-md-4 col-sm-4 col-xs-12 mob_pad">
						<div class="form-group">
							<label for="revised_target_date">Revised Target Implementation Date</label>
							<input type="date" name="revised_target_date" style="width: 100%; border-radius: 5px;" required>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-12 col-sm-12 col-xs-12 pad0">
				<center>
					<input class="btn-danger" required="" style="font-size: 14px;  margin-top: 2%; padding: 0.5% 1.5%; border-radius: 6px;" type="submit" value="SUBMIT">
				<center>
			</div>
		</div>
	</div>
</body>
</html>