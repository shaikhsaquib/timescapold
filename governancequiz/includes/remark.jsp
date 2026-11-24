<%
	String remarkVal="";
	String rmkReadOnly="";
		//System.out.println(tmpArr[3]);
		if(remarkopt!=null && !remarkopt.equals(" ")&& !remarkopt.equals("-"))
		remarkVal=remarkopt;
%>

<textarea name="<%=remarks%>"rows="2" cols="25" class="normal" <%=rmkReadOnly%>><%=remarkVal%></textarea>
