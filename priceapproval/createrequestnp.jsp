<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Purchase Approval for News Print</title>
<link href="bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet">
<link href="style/popup.css" rel="stylesheet" type="text/css" />
<link href="css/template.css" rel="stylesheet">
<link href="style/calendarControl.css" rel="stylesheet">
<link href="style/global.css" rel="stylesheet" type="text/css" />

<script src="js/jquery-1.11.2.min.js"></script>
<script src="js/bootstrap-maxlength.js"></script>
<script src="bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    $(".tip-right").tooltip({
        placement : 'right',
        container: 'body'
    });
    $('input#defaultconfig').maxlength();
});

</script>

<div class="portlet-body form">										
	<div class="form-body">
	<h5>Vendor Details</h5><hr>
	<div class="row">
	<div class="col-md-6">
	<div class="form-group">	
		<label class="control-label col-md-3">Vendor Name</label>	
	<div class="col-md-6">													
		<input type="text" class="form-control" placeholder="vendor name" maxlength="35" id="defaultconfig" name="ven_name">
		<span class="glyphicon glyphicon-pencil tip-right" data-toggle="tooltip"  data-original-title="max 35 char"></span>
		
	</div>
	</div>
	</div>													
	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">Mill</label>
	<div class="col-md-6">
		<input type="text" class="form-control" placeholder="mill" maxlength="30" id="defaultconfig" name="mill">
		<span class="glyphicon glyphicon-pencil tip-right" data-toggle="tooltip"  data-original-title="max 30 char"></span>	
	</div>
	</div>
	</div>													
	</div>												
	<div class="row">
	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">Payment Terms</label>
	<div class="col-md-6">
		<input type="text" class="form-control" placeholder="payment terms" maxlength="20" id="defaultconfig" name="pay_t">
		<span class="glyphicon glyphicon-pencil tip-right" data-toggle="tooltip"  data-original-title="max 20 char"></span>																
	</div>
	</div>
	</div>													
	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">Sourcing</label>
	<div class="col-md-6">
		<input type="text" class="form-control" placeholder="sourcing" maxlength="20" id="defaultconfig" name="source">
		<span class="glyphicon glyphicon-pencil tip-right" data-toggle="tooltip"  data-original-title="max 20 char"></span>		
	</div>
	</div>
	</div>													
	</div>	
	
	<h5>Item Details</h5><hr>
	<div class="row">
	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">Quantity</label>
	<div class="col-md-6">
		<input type="text" class="form-control" placeholder="quantity" id="" name="quantity">
		<span class="glyphicon glyphicon-pencil tip-right" data-toggle="tooltip"  data-original-title="integer only"></span>														
	</div>
	</div>
	</div>													
	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">Delivery In</label>
	<div class="col-md-6">
		<input type="text" class="form-control" placeholder="delivery in" maxlength="20" id="defaultconfig" name="del_in">
		<span class="glyphicon glyphicon-pencil tip-right" data-toggle="tooltip"  data-original-title="max 20 char"></span>															
	</div>
	</div>
	</div>													
	</div>												
	<div class="row">
	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">Quality</label>
	<div class="col-md-6">
		<input type="text" class="form-control" placeholder="quality" maxlength="20" id="defaultconfig" name="quality">
		<span class="glyphicon glyphicon-pencil tip-right" data-toggle="tooltip"  data-original-title="max 20 char"></span>															
	</div>
	</div>
	</div>													
	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">GSM</label>
	<div class="col-md-6">
		<input type="text" class="form-control" placeholder="gsm" maxlength="20" id="defaultconfig" name="gsm">
		<span class="glyphicon glyphicon-pencil tip-right" data-toggle="tooltip"  data-original-title="max 20 char"></span>															
	</div>
	</div>
	</div>													
	</div>													
	
	<h5>Purchase Benchmark</h5><hr>
	<div class="row">
	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">This lot (CFR,India)</label>
	<div class="col-md-6">
		<input type="text" class="form-control" placeholder="this lot" maxlength="20" id="defaultconfig" name="this_lot">
		<span class="glyphicon glyphicon-pencil tip-right" data-toggle="tooltip"  data-original-title="max 20 char"></span>															
	</div>
	</div>
	</div>													
	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">Invoice Print</label>
	<div class="col-md-6">
		<input type="text" class="form-control" placeholder="invoice print" maxlength="20" id="defaultconfig" name="inv_print">
		<span class="glyphicon glyphicon-pencil tip-right" data-toggle="tooltip"  data-original-title="max 20 char"></span>																
	</div>
	</div>
	</div>													
	</div>												
	<div class="row">
	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">RISI (CFR,India)</label>
	<div class="col-md-6">
		<input type="text" class="form-control" placeholder="RISI (CFR India)" maxlength="20" id="defaultconfig" name="risi">
		<span class="glyphicon glyphicon-pencil tip-right" data-toggle="tooltip"  data-original-title="max 20 char"></span>																
	</div>
	</div>
	</div>													
	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">Budget price</label>
	<div class="col-md-6">
		<input type="text" class="form-control" placeholder="budget price(2014-2015)" maxlength="20" id="defaultconfig" name="bud_source">
		<span class="glyphicon glyphicon-pencil tip-right" data-toggle="tooltip"  data-original-title="max 20 char"></span>
	</div>
	</div>
	</div>													
	</div>
	<div class="row">
	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">Total Budget Value</label>
	<div class="col-md-6">
		<input type="text" class="form-control" placeholder="total budget value(RS Lakh)" maxlength="20" id="defaultconfig" name="total_bud">
		<span class="glyphicon glyphicon-pencil tip-right" data-toggle="tooltip"  data-original-title="max 20 char"></span>																
	</div>
	</div>
	</div>
	</div>
	
	<h5>Price Built-Up</h5><hr>
	<div class="row">
	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">Total Price</label>
	<div class="col-md-6">
		<input type="text" class="form-control" placeholder="total price(@RS/$)" id="" name="total_price">
		<span class="glyphicon glyphicon-pencil tip-right" data-toggle="tooltip"  data-original-title="integer only"></span>																
	</div>
	</div>
	</div>													
	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">Custom Duty/Taxes</label>
	<div class="col-md-6">
		<input type="text" class="form-control" placeholder="custom duty/taxes" id="" name="cus_duty">	
		<span class="glyphicon glyphicon-pencil tip-right" data-toggle="tooltip"  data-original-title="integer only"></span>															
	</div>
	</div>
	</div>													
	</div>												
	<div class="row">
	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">Freight</label>
	<div class="col-md-6">
		<input type="text" class="form-control" placeholder="freight" id="" name="fre">	
		<span class="glyphicon glyphicon-pencil tip-right" data-toggle="tooltip"  data-original-title="integer only"></span>															
	</div>
	</div>
	</div>													
	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">Insurance</label>
	<div class="col-md-6">
		<input type="text" class="form-control" placeholder="insurance" id="" name="insurance">	
		<span class="glyphicon glyphicon-pencil tip-right" data-toggle="tooltip"  data-original-title="integer only"></span>
	</div>
	</div>
	</div>													
	</div>
	<div class="row">
	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">Total Actual Cost</label>
	<div class="col-md-6">
		<input type="text" class="form-control" placeholder="total budget valu(RS Lakh)" id="" name="total_cost">
		<span class="glyphicon glyphicon-pencil tip-right" data-toggle="tooltip"  data-original-title="integer only"></span>																
	</div>
	</div>
	</div>
	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">Budget VS. Actual</label>
	<div class="col-md-6">
		<input type="text" class="form-control" placeholder="budget vs. actual" id="" name="bud_act">
		<span class="glyphicon glyphicon-pencil tip-right" data-toggle="tooltip"  data-original-title="integer only"></span>															
	</div>
	</div>
	</div>
	</div>
	
	<h5>Inventory Details (TONS)</h5><hr>
	<div class="row">
	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">Quarter Opening Invetory</label>
	<div class="col-md-6">
		<input type="text" class="form-control" placeholder="quarter opening inventory" id="" name="qua_inv">	
		<span class="glyphicon glyphicon-pencil tip-right" data-toggle="tooltip"  data-original-title="integer only"></span>															
	</div>
	</div>
	</div>													
	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">Expected Receipts For Quarter</label>
	<div class="col-md-6">
		<input type="text" class="form-control" placeholder="exp. receipts for quarter" id="" name="exp_recp">
		<span class="glyphicon glyphicon-pencil tip-right" data-toggle="tooltip"  data-original-title="integer only"></span>																
	</div>
	</div>
	</div>													
	</div>												
	<div class="row">
	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">Expected Consumption For Quarter</label>
	<div class="col-md-6">
		<input type="text" class="form-control" placeholder="exp. consumption for quarter" id="" name="exp_consump">
		<span class="glyphicon glyphicon-pencil tip-right" data-toggle="tooltip"  data-original-title="integer only"></span>
	</div>
	</div>
	</div>													
	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">Expected Inventory At The End Of Quarter</label>
	<div class="col-md-6">
		<input type="text" class="form-control" placeholder="expected inventory at the end of quarter" id="" name="exp_inv">
		<span class="glyphicon glyphicon-pencil tip-right" data-toggle="tooltip"  data-original-title="integer only"></span>																
	</div>
	</div>
	</div>													
	</div>
	<div class="row">
	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">Earlier Contracted Qty For Quarter</label>
	<div class="col-md-6">
		<input type="text" class="form-control" placeholder="earlier contracted qty for quarter" id="" name="ear_contract">
		<span class="glyphicon glyphicon-pencil tip-right" data-toggle="tooltip"  data-original-title="integer only"></span>																
	</div>
	</div>
	</div>
	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">Expected Total Cover</label>
	<div class="col-md-6">
		<input type="text" class="form-control" placeholder="exp. total cover" id="" name="exp_cover">
		<span class="glyphicon glyphicon-pencil tip-right" data-toggle="tooltip"  data-original-title="integer only"></span>															
	</div>
	</div>
	</div>
	</div>
	<div class="row">
	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">Current contarct</label>
	<div class="col-md-6">
		<input type="text" class="form-control" placeholder="current contract" id="" name="current">
		<span class="glyphicon glyphicon-pencil tip-right" data-toggle="tooltip"  data-original-title="integer only"></span>																
	</div>
	</div>
	</div>																											
	</div>
	
	<h5>Budget Buy(TONS)</h5><hr>
	<div class="row">
	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">Annual Budget</label>
	<div class="col-md-6">
		<input type="text" class="form-control" placeholder="annual budget" id="" name="ann_bud">
	<span class="glyphicon glyphicon-pencil tip-right" data-toggle="tooltip"  data-original-title="integer only"></span>															
	</div>
	</div>
	</div>													
	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">Contracted Tons YTD</label>
	<div class="col-md-6">
		<input type="text" class="form-control" placeholder="contracted tons" id="" name="cont_tons">
		<span class="glyphicon glyphicon-pencil tip-right" data-toggle="tooltip"  data-original-title="integer only"></span>																
	</div>
	</div>
	</div>													
	</div>												
	<div class="row">
	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">Balance To Be Bought</label>
	<div class="col-md-6">
		<input type="text" class="form-control" placeholder="balance to be bought YTD" id="" name="bal">
		<span class="glyphicon glyphicon-pencil tip-right" data-toggle="tooltip"  data-original-title="integer only"></span>																
	</div>
	</div>
	</div>																										
	</div>
	<h5>Remarks & Events</h5><hr>
	<div class="row">
	
	<div class="form-group">
		<label class="col-md-2 control-label">4 Other Remarks</label>
	<div class="col-md-9">
		<textarea class="form-control" rows="4" placeholder="events" id="" name="events"></textarea>
		<span class="glyphicon glyphicon-pencil"></span>
	
	</div>
	</div>
	</div>
	<div class="row">
	
	<div class="form-group">
		<label class="col-md-2 control-label">5 Market Events</label>
	<div class="col-md-9">
		<textarea class="form-control" rows="4" placeholder="events" id="" name="events"></textarea>
		<span class="glyphicon glyphicon-pencil"></span>
	
	</div>
	</div>													
	</div>												
		
	<h5>Budget Buy(TONS)</h5><hr>
	<div class="row">
	<div class="col-md-6">
	<div class="form-group">
		<label class="col-md-3 control-label">B&C</label>
	<div class="col-md-6">
		<select class="form-control">
			<option>Option 1</option>
			<option>Option 2</option>
			<option>Option 3</option>
			<option>Option 4</option>
			<option>Option 5</option>
		</select>		
	</div>
	</div>
	</div>													
	<div class="col-md-6">
	<div class="form-group">
		<label class="col-md-3 control-label">CEO (Publishing)</label>
	<div class="col-md-6">
		<select class="form-control">
			<option>Option 1</option>
			<option>Option 2</option>
			<option>Option 3</option>
			<option>Option 4</option>
			<option>Option 5</option>
		</select>
	</div>
	</div>
	</div>													
	</div>												
	<div class="row">
	<div class="col-md-6">
	<div class="form-group">
		<label class="col-md-3 control-label">Director-B&C</label>
	<div class="col-md-6">
		<select class="form-control">
			<option>Option 1</option>
			<option>Option 2</option>
			<option>Option 3</option>
			<option>Option 4</option>
			<option>Option 5</option>
		</select>
	</div>
	</div>
	</div>
	<div class="col-md-6">
	<div class="form-group">
		<label class="col-md-3 control-label">COO</label>
	<div class="col-md-6">
		<select class="form-control">
			<option>Option 1</option>
			<option>Option 2</option>
			<option>Option 3</option>
			<option>Option 4</option>
			<option>Option 5</option>
		</select>
	</div>
	</div>
	</div>																											
	</div>
	<div class="row">
	<div class="col-md-6">
	<div class="form-group">
		<label class="col-md-3 control-label">C0O (Publishing)</label>
	<div class="col-md-6">
		<select class="form-control">
			<option>Option 1</option>
			<option>Option 2</option>
			<option>Option 3</option>
			<option>Option 4</option>
			<option>Option 5</option>
		</select>
	</div>
	</div>
	</div>
	<div class="col-md-6">
	<div class="form-group">
		<label class="col-md-3 control-label">MD</label>
	<div class="col-md-6">
		<select class="form-control">
			<option>Option 1</option>
			<option>Option 2</option>
			<option>Option 3</option>
			<option>Option 4</option>
			<option>Option 5</option>
		</select>
	</div>
	</div>
	</div>																											
	</div>	
	<div class="form-actions">
	<div class="col-md-offset-9 ">
		<button type="button" class="btn btn-success">Submit</button>
		<button type="reset" class="btn btn-primary">Reset</button>
	</div>
	</div>
</div>
</div>
</div>