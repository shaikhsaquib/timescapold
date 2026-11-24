<%
System.out.println("here"); 
String optArr[]={"Not Rated","Yes","No"};
String optValArr[]={"Not Rated","Yes","No"};
String disabled ="";
String selected ="";

%>
<select name="<%=feedBackOptions%>" class="normal" >
<%

 // for user option array will start from 1 as "No action Required" is "NA for user


	//out.println(optArr); 
	for(int kk=0;kk<optArr.length;kk++){ 
		
		if(feedbackopt.equalsIgnoreCase(optArr[kk]))
					
			selected	 = "selected";
		else
			selected	 = "";

%>
	<option value="<%=optArr[kk]%>" <%=selected%>><%=optValArr[kk]%></option>

<%

	}//end of for

%>
