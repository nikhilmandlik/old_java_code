<!-- 
* Class Name                     : MakePayment.jsp
* Description                    : It is used to make payments
* Author 						 : Nikhil Mandlik
*/
 -->
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import = "javax.sql.rowset.CachedRowSet" %>
<%@ page import = "com.sun.rowset.CachedRowSetImpl" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Make Payments</title>
 <link rel="stylesheet" type="text/css" href="commonstyle.css">  
</head>
<body>

<%	
	String sessionDesignation = (String)session.getAttribute("sessionDesignation");
	CachedRowSet cachedRowSet=null;
	
	if (sessionDesignation==null){
	%>
		<jsp:include page="InvoiceReportCustomer.jsp"></jsp:include>
	<%
	}
	else {
		try{
	%>
		<div class="heading3" align="right">
		<A Href="HomePage.jsp">Home</A>
		<A Href="Logout.jsp">Logout</A>
		</div>
	
		<!--Form used to make GUI-->
		<form name="ReportForm" action="MakePayment1.jsp">
			<h1 class="heading1" align="center">Sterling Courier</h1>
		
			<table align="center" width="500">
				<tr>
					<th align="center" colspan="2" class="heading3">Make Payments
					</th>
				</tr>		
				<tr>
					<td width="50%">
						<!--Defining Remarks field-->
						Customer ID
						<span class="mandatory">*</span>
					</td>
					<td >
						<jsp:useBean id="sterlingDAO" class="package_SterlingDAO.SterlingDAO">
									<%
									cachedRowSet=sterlingDAO.pendingPaymentReportCustomerID();
									%>
						</jsp:useBean>	
						<select name="customerid">
			<%		
							while(cachedRowSet.next()){
			%>						
								<option  value="<%=cachedRowSet.getInt(1)%>"><%=cachedRowSet.getInt(1)%></option>						
			<%  			}			
			%>
						</select>
					</td>
				</tr>
				
				<tr align="center">
					<td colspan="2">
						<H6><br>Fields marked with asterisk
						<span class="mandatory">(*)</span> are compulsory.
						<br>This information is a must for successful Invoice Report Generation</H6>
					</td>
				</tr>
			
				<tr>
					<td colspan="2" align="center">
						<!--Submit and Reset controls and validating the Delivery Date and Status-->
						<input name="InvoiceReportSubmit" type="submit" value="Display Payment List" onClick="return validation()">
						<input type="reset" value="Reset">
					</td>
				</tr>
			</table>	
		</form>
		<%			
			}				
		catch(Exception e){	
			
		%>					
			<jsp:forward page="MakePaymentError.jsp" >
			<jsp:param name="mes" value="<%=e.getMessage()%>"></jsp:param>
			</jsp:forward>
		<%
		}
	}
%>
</body>
</html>

<!-- End of file -->