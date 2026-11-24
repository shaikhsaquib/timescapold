<jsp:useBean id="coreWebController" class="com.bccl.core.web.controller.CoreWebController" />

<%@page import="java.util.ArrayList" %>
 <%
String dropDownStyle ="small"; 
%>



    <%
    ArrayList instituteArr = new ArrayList( );

    String selectedOption = request.getParameter("selectedOption");
    String othersOption = request.getParameter("othersOption");

    String isSelected = "";
    boolean optionSelected = false;

    if (selectedOption == null) {

        selectedOption = "";
    }

    if (othersOption == null) {

        othersOption = "";
    }

    instituteArr = coreWebController.getInstitute( );
            

    %>
        <select name="institute" class="<%=dropDownStyle%>">
            <option value="0">Institute</option>

    <%
    for(int ii=0 ; ii< instituteArr.size( ); ii++)
    {
        String institute[ ] = (String[ ]) instituteArr.get(ii);
        if ( (institute[0].equalsIgnoreCase(selectedOption)) || (institute[2].equalsIgnoreCase(selectedOption))  || (institute[1].equalsIgnoreCase(selectedOption))) {

            isSelected = "SELECTED";
            optionSelected = true;
        }else{
            isSelected = "";
        }

    %>
            <option value="<%=institute[2]%>"  <%=isSelected%>><%=institute[2]%></option>
    <%
    }

    if ("y".equalsIgnoreCase(othersOption)) {

        if (!"".equals(selectedOption) && !optionSelected) {
            isSelected = "SELECTED";
        }
        %>

        <option value="OTHERS" <%=isSelected%>>Others</option>
    <%
    }
    %>
	</select>
    <%
    if ("y".equalsIgnoreCase(othersOption)) {
    %>
    	<input type="text "class="small" maxlength=30 size=15 name = "otherInstitute" value = "<%=(optionSelected?"":selectedOption)%>">
    <%
    }
    %>
