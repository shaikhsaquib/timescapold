<%

//aopReceiptForEx
if(aopReceiptForEx == null){
aopReceiptForEx="0";
}
    int len, lenCount, counter =0;
    String temp = "";
    if(aopReceiptForEx.contains("."))
        {
            String[] parts  = aopReceiptForEx.split("\\.");
            String part1    = parts[0];
            //String part2    = parts[1];
            aopReceiptForEx = part1;
		 len = aopReceiptForEx.length();

			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + aopReceiptForEx.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			aopReceiptForEx = temp;
		}
       aopReceiptForEx +="."+parts[1];
       }else{
		 len = aopReceiptForEx.length();
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + aopReceiptForEx.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			aopReceiptForEx = temp;
		}
}
if(aopDealValue == null){
aopDealValue="0";
}
//aopDealValue
    if(aopDealValue.contains("."))
        {
            String[] parts  = aopDealValue.split("\\.");
            String part1    = parts[0];
            //String part2    = parts[1];
            aopDealValue = part1;

	    len = aopDealValue.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + aopDealValue.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				aopDealValue = temp;
		}
       aopDealValue +="."+parts[1];
       }else{
	    len = aopDealValue.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + aopDealValue.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				aopDealValue = temp;
		}
}


//aopReceiptPrice
if(aopReceiptPrice == null){
aopReceiptPrice="0";
}
	    len = aopReceiptPrice.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + aopReceiptPrice.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				aopReceiptPrice = temp;
		}

//totalPrice_unitRate
if(totalPrice_unitRate == null){
totalPrice_unitRate="0";
}
    if(totalPrice_unitRate.contains("."))
        {
            String[] parts  = totalPrice_unitRate.split("\\.");
            String part1    = parts[0];
            //String part2    = parts[1];
            totalPrice_unitRate = part1;


	    len = totalPrice_unitRate.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + totalPrice_unitRate.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				totalPrice_unitRate = temp;
		}
        totalPrice_unitRate +="."+parts[1];
       }else{
	    len = totalPrice_unitRate.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + totalPrice_unitRate.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				totalPrice_unitRate = temp;
		}
}
//totalPrice_rsperTon
if(totalPrice_rsperTon == null){
totalPrice_rsperTon="0";
}
	    len = totalPrice_rsperTon.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + totalPrice_rsperTon.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				totalPrice_rsperTon = temp;
		}


//totalPrice_spend
if(totalPrice_spend == null){
totalPrice_spend="0";
}
    if(totalPrice_spend.contains("."))
        {
            String[] parts  = totalPrice_spend.split("\\.");
            String part1    = parts[0];
            //String part2    = parts[1];
            totalPrice_spend = part1;


	    len = totalPrice_spend.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + totalPrice_spend.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				totalPrice_spend = temp;
		}
        totalPrice_spend +="."+parts[1];
       }else{
	    len = totalPrice_spend.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + totalPrice_spend.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				totalPrice_spend = temp;
		}
}


//customsDuty_unitRate
if(customsDuty_unitRate == null){
customsDuty_unitRate="0";
}
	    len = customsDuty_unitRate.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						//temp = temp + ",";
						temp = temp ;
					}
				
				temp = temp + customsDuty_unitRate.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				customsDuty_unitRate = temp;
		}


//customsDuty_rsperTon
if(customsDuty_rsperTon == null){
customsDuty_rsperTon="0";
}
	    len = customsDuty_rsperTon.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + customsDuty_rsperTon.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				customsDuty_rsperTon = temp;
		}


//customsDuty_spend
if(customsDuty_spend == null){
customsDuty_spend="0";
}
    if(customsDuty_spend.contains("."))
        {
            String[] parts  = customsDuty_spend.split("\\.");
            String part1    = parts[0];
            //String part2    = parts[1];
            customsDuty_spend = part1;


	    len = customsDuty_spend.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + customsDuty_spend.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				customsDuty_spend = temp;
		}
        customsDuty_spend +="."+parts[1];
       }else{
	    len = customsDuty_spend.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + customsDuty_spend.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				customsDuty_spend = temp;
		}
}


//freight_unitRate
if(freight_unitRate == null){
freight_unitRate="0";
}
	    len = freight_unitRate.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + freight_unitRate.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				freight_unitRate = temp;
		}


//freight_rsperTon
if(freight_rsperTon == null){
freight_rsperTon="0";
}
	    len = freight_rsperTon.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + freight_rsperTon.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				freight_rsperTon = temp;
		}

//freight_spend
if(freight_spend == null){
freight_spend="0";
}
    if(freight_spend.contains("."))
        {
            String[] parts  = freight_spend.split("\\.");
            String part1    = parts[0];
            //String part2    = parts[1];
            freight_spend = part1;


	    len = freight_spend.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + freight_spend.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				freight_spend = temp;
		}
        freight_spend +="."+parts[1];
       }else{
	    len = freight_spend.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + freight_spend.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				freight_spend = temp;
		}
}

//insurance_unitRate
if(insurance_unitRate == null){
insurance_unitRate="0";
}
    if(insurance_unitRate.contains("."))
        {
            String[] parts  = insurance_unitRate.split("\\.");
            String part1    = parts[0];
            //String part2    = parts[1];
            insurance_unitRate = part1;


	    len = insurance_unitRate.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + insurance_unitRate.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				insurance_unitRate = temp;
		}
       insurance_unitRate +="."+parts[1];
       }
//insurance_rsperTon
if(insurance_rsperTon == null){
insurance_rsperTon="0";
}
	    len = insurance_rsperTon.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + insurance_rsperTon.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				insurance_rsperTon = temp;
		}


//insurance_spend
if(insurance_spend == null){
insurance_spend="0";
}
    if(insurance_spend.contains("."))
        {
            String[] parts  = insurance_spend.split("\\.");
            String part1    = parts[0];
            //String part2    = parts[1];
            insurance_spend = part1;


	    len = insurance_spend.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + insurance_spend.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				insurance_spend = temp;
		}
        insurance_spend +="."+parts[1];
       }else{
	    len = insurance_spend.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + insurance_spend.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				insurance_spend = temp;
		}
}


//totalActualCost_rsperTon
if(totalActualCost_rsperTon == null){
totalActualCost_rsperTon="0";
}
    if(totalActualCost_rsperTon.contains("."))
        {
            String[] parts  = totalActualCost_rsperTon.split("\\.");
            String part1    = parts[0];
            //String part2    = parts[1];
            totalActualCost_rsperTon = part1;


	    len = totalActualCost_rsperTon.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + totalActualCost_rsperTon.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				totalActualCost_rsperTon = temp;
		}
       //totalActualCost_rsperTon +="."+parts[1];
       }else{
	    len = totalActualCost_rsperTon.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + totalActualCost_rsperTon.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				totalActualCost_rsperTon = temp;
		}

}


//totalActualCost_spend
if(totalActualCost_spend == null){
totalActualCost_spend="0";
}
    if(totalActualCost_spend.contains("."))
        {
            String[] parts  = totalActualCost_spend.split("\\.");
            String part1    = parts[0];
            //String part2    = parts[1];
            totalActualCost_spend = part1;

	    len = totalActualCost_spend.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + totalActualCost_spend.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   			totalActualCost_spend = temp;
		}

       totalActualCost_spend +="."+parts[1];
       }else{
	    len = totalActualCost_spend.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + totalActualCost_spend.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   			totalActualCost_spend = temp;
		}
}
//budgetvsActual_unitRate
String part1WithSign = "";
if(budgetvsActual_unitRate == null){
budgetvsActual_unitRate="0";
}
//out.println(budgetvsActual_unitRate.contains("-") + budgetvsActual_unitRate);
if(budgetvsActual_unitRate.contains("-")){
	String parts  = budgetvsActual_unitRate;
	part1WithSign    = parts.substring(0,1);
	//out.println("part1WithSign...."+part1WithSign);
	String part2    = parts.substring(1,parts.length());
	budgetvsActual_unitRate = part2;
	//out.println("budgetvsActual_unitRate...."+budgetvsActual_unitRate);
}
    if(budgetvsActual_unitRate.contains("."))
	{
		String[] parts  = budgetvsActual_unitRate.split("\\.");
		String part1    = parts[0];
		//String part2    = parts[1];
		budgetvsActual_unitRate = part1;

		//out.println("budgetvsActual_unitRate>>>>>"+budgetvsActual_unitRate);
	    len = budgetvsActual_unitRate.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + budgetvsActual_unitRate.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

			temp =  new StringBuffer(temp).reverse().toString();
			budgetvsActual_unitRate = temp;
		}
        budgetvsActual_unitRate = part1WithSign+budgetvsActual_unitRate+"."+parts[1];
		//out.println("budgetvsActual_unitRate-----"+budgetvsActual_unitRate);
	}else{
	    len = budgetvsActual_unitRate.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + budgetvsActual_unitRate.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				budgetvsActual_unitRate = temp;
		}
		budgetvsActual_unitRate = part1WithSign+budgetvsActual_unitRate;
		//out.println("budgetvsActual_unitRate-----"+budgetvsActual_unitRate);
	}

//quantity
if(quantity == null){
quantity="0";
}
	    len = quantity.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + quantity.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				quantity = temp;
		}
//thisLotcfr
if(thisLotcfr == null){
thisLotcfr="0";
}
	    len = thisLotcfr.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + thisLotcfr.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				thisLotcfr = temp;
		}
//invoicePrice
if(invoicePrice == null){
invoicePrice="0";
}
	    len = invoicePrice.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + invoicePrice.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				invoicePrice = temp;
		}
//risi
if(risi == null){
risi="0";
}
	    len = risi.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + risi.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				risi = temp;
		}
//annualBudget
if(annualBudget == null){
annualBudget="0";
}
	    len = annualBudget.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + annualBudget.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				annualBudget = temp;
		}
//contractedTonsytd
if(contractedTonsytd == null){
contractedTonsytd="0";
}
	    len = contractedTonsytd.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + contractedTonsytd.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				contractedTonsytd = temp;
		}

//currentQuarter
if(currentQuarter == null){
currentQuarter="0";
}
	    len = currentQuarter.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + currentQuarter.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				currentQuarter = temp;
		}

//balanceToBought
/*part1WithSign = "";
if(balanceToBought == null){
	balanceToBought="0";
}
String parts  = balanceToBought;
part1WithSign    = parts.substring(0,1);
String part2    = parts.substring(1,parts.length());
balanceToBought = part2;
len = balanceToBought.length();

temp = "";

lenCount = len-1;

counter = 1;

if(len>3)
{
	while(lenCount>=0)
	{
		if((counter>3) && (counter%2==0))
		{
			temp = temp + ",";
		}

		temp = temp + balanceToBought.charAt(lenCount);

		lenCount--;
		counter++;
	}

	temp =  new StringBuffer(temp).reverse().toString();
	balanceToBought = temp;
}
balanceToBought = part1WithSign+balanceToBought;*/

//balanceToBought
if(balanceToBought == null){
balanceToBought = "0";
}
len = balanceToBought.length();

temp = "";

lenCount = len-1;

counter = 1;

if(len>3)
{
while(lenCount>=0)
{
if((counter>3) && (counter%2==0))
{
temp = temp + ",";
}

temp = temp + balanceToBought.charAt(lenCount);

lenCount--;
counter++;
}

temp =  new StringBuffer(temp).reverse().toString();
balanceToBought = temp;
}

//quarterOpeningQuantity
if(quarterOpeningQuantity == null){
quarterOpeningQuantity="0";
}
	    len = quarterOpeningQuantity.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + quarterOpeningQuantity.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				quarterOpeningQuantity = temp;
		}
//quarterOpeningDays
if(quarterOpeningDays == null){
quarterOpeningDays="0";
}
	    len = quarterOpeningDays.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + quarterOpeningDays.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				quarterOpeningDays = temp;
		}
//expectedReceiptsQuantity
if(expectedReceiptsQuantity == null){
expectedReceiptsQuantity="0";
}
	    len = expectedReceiptsQuantity.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + expectedReceiptsQuantity.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				expectedReceiptsQuantity = temp;
		}
//expectedReceiptsDays
if(expectedReceiptsDays == null){
expectedReceiptsDays="0";
}
	    len = expectedReceiptsDays.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + expectedReceiptsDays.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				expectedReceiptsDays = temp;
		}
//estimatedCons1
if(estimatedCons1 == null){
estimatedCons1="0";
}
	    len = estimatedCons1.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + estimatedCons1.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				estimatedCons1 = temp;
		}
//estimatedCons2
if(estimatedCons2 == null){
estimatedCons2="0";
}
	    len = estimatedCons2.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + estimatedCons2.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				estimatedCons2 = temp;
		}
//quarterEnd1
if(quarterEnd1 == null){
quarterEnd1="0";
}
	    len = quarterEnd1.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + quarterEnd1.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				quarterEnd1 = temp;
		}
//quarterEnd2
if(quarterEnd2 == null){
quarterEnd2="0";
}
	    len = quarterEnd2.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + quarterEnd2.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				quarterEnd2 = temp;
		}
%>