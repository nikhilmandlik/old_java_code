<!-- 
* Class Name                     : InvoiceReportMCError.jsp
* Description                    : generates Invoice Report
* Author 						 : Nikhil Mandlik
*/
 -->
 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Invoice Report Error</title>
</head>
<body>

<%
	/*Retrieving the parameter from the previous page*/
    String message=request.getParameter("mes");
%>
	<h2 align="center" style="background-color:red">
	<%=message%></h2>
   <jsp:include page="InvoiceReportM&C.jsp"></jsp:include>   
</body>
</html>

<!-- End of file -->