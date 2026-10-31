<%
// Pagenation variables
	String style = "normal";
	String currPage = "";
	String pageString = "";
    
	int resultsPerPage = 15;
	int diff = 5;
	long startIndex = 0;
	long endIndex = resultsPerPage;

	long pageId = 1;
	long pageCount = 0;

	long pageBegin = 1;
	long pageEnd = 0;

	boolean isPrev = false;
	boolean isNext = false;

	Hashtable upBound = new Hashtable( );
	Hashtable lowBound = new Hashtable( );
// End of Pagenation variables

     //Pagenation Code begins here

        upBound = paging.getUpBound(arrSize,resultsPerPage);

        lowBound = paging.getLowBound(arrSize ,resultsPerPage);

        // Step 1 : Get the Page Count
        pageCount = paging.getPageCount(arrSize, resultsPerPage);

          //Step 2 : Get the Current Page
        currPage = (String) request.getParameter("param");

         
        if(currPage == null){
            currPage = "1";
            session.setAttribute("pageId",currPage);
            session.setAttribute("pageBegin",currPage);
        }else if(currPage.equals("next")){

              pageBegin = Long.parseLong((String) session.getAttribute("pageBegin"));
                //out.println("\n pgBegin: "+ pageBegin + " PgCnt: " +pageCount);
              if((pageBegin+diff) >= pageCount){
                // Do Nothing
              }else{
                pageBegin = pageBegin + 1;
                pageBegin = pageBegin +diff;

              }
              currPage=pageBegin+"";
              pageId = Long.parseLong((String) session.getAttribute("pageId"));

              session.setAttribute("pageBegin",currPage);
              session.setAttribute("pageId",currPage);

        }else if(currPage.equals("prev")){

             pageBegin = Long.parseLong((String) session.getAttribute("pageBegin"));

              if(pageBegin <= 1){
                // Do Nothing
              }else{
                pageBegin = pageBegin - 1;
                pageBegin = pageBegin - diff;
              }
              currPage=pageBegin+"";
              pageId = Long.parseLong((String) session.getAttribute("pageId"));
              session.setAttribute("pageBegin",currPage);
              session.setAttribute("pageId",currPage);
        }else{
            pageBegin = Long.parseLong((String) session.getAttribute("pageBegin"));
            pageId = Long.parseLong(currPage);
            session.setAttribute("pageId",currPage);
        }

        //Step 3 : Get the Lowerbound for that page
        Long sIndex = (Long) lowBound.get(new Long(currPage));
        startIndex = (long) sIndex.longValue( );


        //Step 4 : Get the Higherbound for that page
        Long eIndex = (Long) upBound.get(new Long(currPage));
        endIndex = (long) eIndex.longValue( );


        //Step  5 : Get the Page String
        pageEnd = pageBegin + diff;

        if(pageEnd >= pageCount){
            pageEnd = pageCount;
            isNext=true;
        }


        //pageString = paging.getPageString(arrSize,resultsPerPage);
        pageString = paging.getPageString(pageBegin, pageEnd);

        // Step 6 : Check if the page is the first or the last page


        if(startIndex == 1){
            isPrev=true;
            startIndex = 0;
        }

        if(pageBegin <= diff){
            isPrev = true;
        }

%>

        <tr> 
            <td colspan="11" bgcolor="#E6E2DA" align="right" class="normal" height="20" valign="middle">
						Results: <%=startIndex%> - <%=endIndex%> of  <%=arrSize%> &nbsp;
                <%
                    if(isPrev)
                    {
                %>	
                        <span class="<%=style%>"><< prev |</span>
                <%
                    }
                    else
                    {
                        pageId = pageId - 1;
                %>
                <a href="<%=pagenationUrl%>?param=prev" class=<%=style%>> << prev</a> |
                <%
                    }
                    StringTokenizer str =new StringTokenizer(pageString, "|");
                    while(str.hasMoreTokens( ))
                    {
                        String nextPage = str.nextToken( ).trim( );
                        if(currPage.equals(nextPage))
                        {
                %>
                        <a href="<%=pagenationUrl%>?param=<%=nextPage%>" class="bold"> <%=nextPage%> </A> |
                <%
                        }
                        else
                        {
                %>
                        <a href="<%=pagenationUrl%>?param=<%=nextPage%>" class="<%=style%>"> <%=nextPage%></a> |
                <%
                        }
                    }
                    
                    if(isNext)
                    {
                %>
                        <span class=<%=style%>> next >> </span>&nbsp;&nbsp;
                <%
                    }
                    else
                    {
                %>
                    <a href="<%=pagenationUrl%>?param=next" class=<%=style%>>next >></a>
                <%
                    }
                %>			
			
			</td>
        </tr>

