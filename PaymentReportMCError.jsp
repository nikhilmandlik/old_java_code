<!-- 
* Class Name                     : PaymentReportMCError.jsp
* Description                    : It is used to generates payment Reports
* Author 						 : Nikhil Mandlik
*/
 -->
 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment Report</title>
</head>
<body>
<%
	/*Retrieving the parameter from the previous page*/
    String message=request.getParameter("mes");

	if (message==null){
		%>
			<jsp:include page="InvoiceReportCustomer.jsp"></jsp:include>
		<%
	}
	else {
%>
	<h2 align="center" style="background-color:red">
	<%=message%></h2>
   <jsp:include page="PaymentsReportMC.jsp"></jsp:include> 
<%	}
%>
   
</body>
</html>

<!-- End of file -->