<!-- 
* Class Name                     : PaymentReportCustomerForm.jsp
* Description                    : It is used to generates payment Reports
* Author 						 : Nikhil Mandlik
*/
 -->
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment Report</title>
<!-- Comments : Inserting links to the commonstyle.css -->
<link rel="stylesheet" type="text/css" href="commonstyle.css">
</head>
<body>
<%

	String sessionDesignation = (String)session.getAttribute("sessionDesignation");

	if (sessionDesignation==null){
	%>		
			<%-- Forward the request --%>
			<h2 align="center" style="background-color:red">
			Your Session has expired, Please Relogin!!!</h2>
			<jsp:include page="Login.html" />
	<%
	}
	else {
%>

	<!-- Comments : Displaying Links to Login Page -->
	<div class="heading3" align="right">
	<A Href="HomePage.jsp">Home</A>
	<A Href="Logout.jsp">Logout</A>
	</div>
	
	<H1 class="heading1" align="center">Sterling Courier</H1>
	<br><br><br>
	
	<!-- Comments : Display the menu using table  -->
	<table align="center" width="50%">		
		<tr align="center"><td><A href="PaymentReportCustomer.jsp">Paid Payment Reports</A></td></tr>
		<tr align="center"><td><A href="PendingPaymentsReportCustomer.jsp">Pending Payment Reports</A></td></tr>		
	</table>
</body>
</html>
<%	}
%>

<!-- End of file -->