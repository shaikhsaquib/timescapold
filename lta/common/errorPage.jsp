<%@ page isErrorPage="true"%>
<%@page import="com.bccl.birthday.web.util.*"%>
<%@page import="com.bccl.birthday.util.Log"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
	<head>
		<title>B2E</title>
		<meta http-equiv=content-type content="text/html; charset=iso-8859-1">
		<link href="<%=Constants.STYLE_PATH%>global.css" rel="stylesheet" type="text/css">
		<meta content="mshtml 6.00.2800.1400" name=generator>
	</head>

	<body bgcolor=#ffffff leftmargin=0 topmargin=0 marginheight="0" marginwidth="0">
		<form name = "frm_errorPage" action="" method = "post">

			<table cellspacing=0 cellpadding=0 width="100%" border=0>
				<tbody>
					<tr>
						<td width="47%" align=left>&nbsp;</td>
						<td width="53%" align=right class=normal>
						<!--
						 Please include header.jsp over here
						-->
						</td>
					</tr>

					<tr>
						<td align=left>
						<!--
						Please include breadcrumbs.jsp over here
						-->
						</td>
						<td align=right>&nbsp;</td>
					</tr>

					<tr>
						<td align=left colspan=2><img height=5 src="<%=Constants.IMAGE_PATH%>spacer.gif"width=1></td>
					</tr>
				</tbody>
			</table>

			<table cellspacing=0 cellpadding=0 width="99%" align=center border=0>
				<tbody>
					<tr>
						<td valign=top align=right width="1%" background="<%=Constants.IMAGE_PATH%>rt_midimg.gif" rowspan=2><img height=15 src="<%=Constants.IMAGE_PATH%>left_top_curve.gif" width=14></td>
						<td bgcolor=#000000 colspan=2><img height=3 src="<%=Constants.IMAGE_PATH%>spacer.gif" width=1></td>
						<td valign=top align=right width="1%" background=<%=Constants.IMAGE_PATH%>lt_midimg.gif rowspan=2><img height=14 src="<%=Constants.IMAGE_PATH%>rt_top_curve.gif" width=14></td>
					</tr>

					<tr>
						<td class=whitecopy align=middle bgcolor=#ffffff colspan=2 height=34>
							<table cellspacing=0 cellpadding=0 width="100%" border=0>
								<tbody>
									<tr>
										<td valign=bottom width="73%" bgcolor=#ffffff>
											<table cellspacing=0 cellpadding=0 width="100%" border=0>
												<tbody>
													<tr valign=top align=right bgcolor=#ffffff>
														<td colspan=3 bgcolor="#ffffff" class=normal><img height=10 src="<%=Constants.IMAGE_PATH%>spacer.gif" width=9></td>
													</tr>

													<tr valign=top bgcolor=#ffffff>
														<td height=15 colspan=3 bgcolor="#ffffff" class=normal>
														<!--
														Please include here employee details to display
														-->
														</td>
													</tr>
												</tbody>
											</table>
										</td>

										<td align=right width="27%" bgcolor=#ffffff>
										<!--
										<IMG height=37 src="<%=Constants.IMAGE_PATH%>or.gif" width=138>
										-->
										</td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>

					<tr>
						<td width="1%" background=<%=Constants.IMAGE_PATH%>rt_midimg.gif height=2>
							<img height=1 src="<%=Constants.IMAGE_PATH%>spacer.gif" width=1>
						</td>
						<td width="54%" height=4><IMG height=1 src="<%=Constants.IMAGE_PATH%>spacer.gif"width=1></td>
						<td width="44%" height=4><img height=1 src="<%=Constants.IMAGE_PATH%>spacer.gif" width=1></td>
						<td valign=top align=right width="1%" background=<%=Constants.IMAGE_PATH%>lt_midimg.gif height=4><img height=1 src="<%=Constants.IMAGE_PATH%>spacer.gif" width=1></td>
					</tr>
				</tbody>
			</table>

			<table cellspacing=0 cellpadding=0 width="99%" align=center border=0>
				<tbody>
					<tr>
						<td width=225><IMG src="<%=Constants.IMAGE_PATH%>logo.gif"></td>
						<td valign=top width=754>
							<table cellspacing=0 cellpadding=0 width="100%" border=0>
								<tbody>
									<tr>
										<td height=24>
											<table cellspacing=0 cellpadding=0 width="100%" border=0>
												<tbody>
													<tr>
														<td colspan="100%" align="center"></td>
														<!--
															Please include here sub-header
														-->
													</tr>
												</tbody>
											</table>
										</td>
									</tr>

									<tr bgcolor=#ffffff>
										<td class=normal><img height=1 src="<%=Constants.IMAGE_PATH%>spacer.gif" width=1></td>
									</tr>
								</tbody>
							</table>
						</td>

						<td valign=bottom align=right width=14 background=<%=Constants.IMAGE_PATH%>lt_midimg.gif>
						<img height=1 src="<%=Constants.IMAGE_PATH%>spacer.gif" width=1></td>
					</tr>
				</tbody>
			</table>

			<table cellspacing=0 cellpadding=0 width="99%" align=center border=0>
			<tbody>
				<tr>
					<td valign=bottom width="1%" background=<%=Constants.IMAGE_PATH%>rt_midimg.gif rowspan=3><img height=14 src="<%=Constants.IMAGE_PATH%>left_bott_curve.gif" width=14></td>
					<td valign=top width="98%">
						<table cellspacing=0 cellpadding=0 width="100%" border=0>
							<tbody>
								<tr>
									<td valign=top width="78%">
										<table cellspacing=0 cellpadding=0 width="100%" border=0>
											<tbody>
												<tr>
													<td colspan=2 align="left" valign="top">
														<table cellspacing=0 cellpadding=0 width="100%" border=0>
															<tbody>
																<tr>
																	<td width="98%" align="left" valign="top">
																		<table cellspacing=0 cellpadding=0 width="100%" border=0>
																			<tbody>
																				<tr bgcolor=#ffffff>
																					<td class=normal colspan=3>
																						<table width="75%" border="0" align="center">
																							<tr>
																								<td colspan = "100%" align= "center">
																									<img height= "15" src="<%=Constants.IMAGE_PATH%>error.gif">
																								</td>
																							</tr>

																							<tr>
																								<td width="12%">&nbsp;</td>
																								<td width="77%" class="normal">
																									<p align="center">
																										<div align="center">
																										<%
																											if (exception != null) {
																												Log.printLog(exception, "JSP Error"+request.getRequestURI(), 2);
																											}
																										%>
																											<center>
																												There was an error accessing the information required by you.<br><br>
																											</center>
																										</div>
																									</p>
																								</td>
																								<td width="11%">&nbsp;</td>
																							</tr>

																							<tr>
																								<td colspan = "100%" align= "center" >
																									<a href = "javascript:history.back();" class="underline"><strong>home</strong></a>
																								</td>
																							</tr>
																						</table>
																					</td>
																				</tr>
																			</tbody>
																		</table>
																	</td>
																</tr>
															</tbody>
														</table>
													</td>
												</tr>

												<tr align=middle>
													<td colspan=2 align="center"></td>
												</tr>

												<tr>
													<td colspan=2>&nbsp;</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
					<td valign=bottom align=right width="1%" background=<%=Constants.IMAGE_PATH%>lt_midimg.gif rowSpan=3><IMG height=14 src="<%=Constants.IMAGE_PATH%>rt_bot_curve.gif" width=14></td>
				</tr>
				<tr>
					<td width="98%"><IMG height=10 src="<%=Constants.IMAGE_PATH%>spacer.gif" width=1></td>
				</tr>

				<tr>
					<td width="98%" bgcolor=#000000><IMG height=3 src="<%=Constants.IMAGE_PATH%>spacer.gif" width=1></td>
				</tr>
			</tbody>
		</table>
	</body>
</html>
