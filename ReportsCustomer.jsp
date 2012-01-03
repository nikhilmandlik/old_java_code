<!-- 
* Class Name                     : ReportsCustomer.jsp
* Description                    : It is used to Generates Reports
* Author 						 : Nikhil Mandlik
*/
 -->
 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Generate Reports</title>

<!-- include Style Sheet -->
<link rel="stylesheet" type="text/css" href="commonstyle.css">

</head>
<body>
<%
	/* Declare Variables */
	String designation = (String)session.getAttribute("sessionDesignation");
	if (designation==null){
	%>		
		<%-- Forward the request --%>
		<h2 align="center" style="background-color:red">
		Your Session has expired, Please Relogin!!!</h2>
		<jsp:include page="Login.html" />
	<%
	}
	else{
%>
	<%-- links to home and logout pages --%>
	<div class="heading3" align="right">
	<A Href="HomePage.jsp">Home</A>
	<A Href="Logout.jsp">Logout</A>
	</div>

	<h1 class="heading1" align="center">Sterling Courier</h1>

	<table align="center" width="60%">
	<tr>
		<th align="center" class="heading3">Generate Reports</th>
		
	<%-- links to Report pages --%>	
	</tr>
	<tr><td align="center"><a href="OrderReportForm.jsp">Generate Order Report</td></tr>
	<tr><td align="center"><a href="OrderStatusReportSDForm.jsp">Generate Order Status Report</td></tr>	
	<tr><td align="center"><a href="InvoiceReportCustomer.jsp">Invoice Report</td></tr>
	<tr><td align="center"><a href="PaymentReportCustomerForm.jsp">Payment Report</td></tr>	
	</table>
<%	}
%>
</body>
</html>
<!-- End of file -->