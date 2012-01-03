<!-- 
* Class Name                     : Add Customer Report.jsp
* Description                    : this is a report page
* Author 						 : Nikhil Mandlik
*/
 -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Link for Style sheet -->
<link rel="stylesheet" type="text/css" href="commonstyle.css">
</head>
<body>
<DIV class="heading3" align="right">
<a href="HomePage.jsp">Home</a>
<a href="Logout.jsp">Logout</a><br>
</DIV>
<!-- Retrieving the parameters from the previous page -->
<%
	String sCustId = request.getParameter("custId");
	String sUserId = request.getParameter("userId");
	/*Performing null field validation */
	if(sCustId==null ||sUserId==null )
	{%>
		<h2 align="center" style="background-color:red">Please enter the
	customerID!!!</h2>
	<jsp:include page="AddCustomer.jsp" />
<% }
%>

<H1 class="heading1" align="center">Sterling Courier</H1>
<br>
<br>
<table class="layout" border="0" width="60%" align="center">
	<tr>
		<td colspan="2">
		<form>
		<table border="0" width="100%" align="center">
			<!-- Display the success message -->
			<tr>
				<td colspan="2">
				<p class="heading3" align="center">Customer Added successfully</p>
				</td>
			</tr>
			<tr></tr>
			<tr>
				<td>Customer ID</td>
				<td><%=sCustId%></td>
			</tr>
			<tr>
				<td>User ID</td>
				<td><%=sUserId%></td>
			</tr>
		</table>
		</form>
</body>
</html>
<!-- End of file -->
