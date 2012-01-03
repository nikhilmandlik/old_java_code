<!-- 
* Class Name                     : InvoiceReport.jsp
* Description                    : generates Invoice Report
* Author 						 : Nikhil Mandlik
*/
 -->
 
<html>
<head>
<title>Invoice Report</title>
<!-- Inserting links to the commonstyle.css -->
<link rel="stylesheet" type="text/css" href="commonstyle.css">
</head>

<body>
<!-- Displaying Links to the Home and Login Page -->
<DIV class="heading3" align="right">
<A href="HomePage.jsp">Home</A>
<A href="Logout.jsp">Logout</A>
</DIV>

<%
//parsing the string values into integer values
 String custId = request.getParameter("customerId");
 String date = request.getParameter("date");
 String amount = request.getParameter("amount");
 if((custId==null) ||(date==null)||(amount==null)||(custId.length()==0) ||(date.length()==0)||(amount.length()==0) )
	{%>
<h2 align="center" style="background-color:red">Please enter the
	Details!!!</h2>
	<jsp:include page="InvoiceForm.jsp" />
<% }
		%>

<H1 class="heading1" align="center">Sterling Courier</H1>
<br>

<!-- Display the Invoice Report using table  -->
<table align="center" width="50%">

	<!--Display heading Invoice Report -->
	<tr><th colspan="2" class="heading3" align="center">Invoice Report</th></tr>

	<!-- Customer ID -->
	<tr>
		<td class="left">Customer ID</td>
		<td class="left" width="40%"><%=custId %></td>
	</tr>

	<!--Invoice Date -->
	<tr>
		<td class="left">Invoice Date</td>
		<td class="left" width="40%"><%=date %></td>
	</tr>

	<!--Amount to be Paid -->
	<tr>
		<td class="left">Amount to be Paid</td>
		<td class="left" width="40%"><%=amount %></td>
	</tr>

</table>

</body>
</html>
<!-- End of file -->