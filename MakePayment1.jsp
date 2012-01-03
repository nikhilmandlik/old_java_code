<!-- 
* Class Name                     : MakePayment1.jsp
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
     <script language="Javascript" src="ReportDate.js" ></script>
</head>
<body>

<%	
	/*	Declaration of variables */
	String customerId= request.getParameter("customerid");
	CachedRowSet cachedRowSet=null;
	 int customerIdInt=0;
%>
<%
	/* Null field validation*/
	if (customerId==null){
	%>		
		<%-- Forward the request --%>
		<h2 align="center" style="background-color:red">
		Your Session has expired, Please Relogin!!!</h2>
		<jsp:include page="Login.html" />
	<%
	}
	else if(customerId.length()==0){
		%>	
			<%-- Forward the request --%>
			<h2 align="center" style="background-color:red">
			Mandatory fields can not be left blank!!!</h2>
			<jsp:include page="PaymentReportM&C.jsp" />
		<%		
	}
	else{
		try{
		%>
	<div class="heading3" align="right">
	<A Href="HomePage.jsp">Home</A>
	<A Href="Logout.jsp">Logout</A>
	</div>

		<!--Form used to make GUI-->
		<form name="ReportForm" action="MakePayment2.jsp">
			<h1 class="heading1" align="center">Sterling Courier</h1>
		
			<table align="center" width="500">
				<tr>
					<th align="center" colspan="3" class="heading3">Payment List
					</th>
				</tr>		
				
				<tr>
								<td><h3>Invoice ID</h3></td>					
								<td ><h3>Amount</h3></td>					
								<td ><h3>Pay</h3></td>				
							</tr>
							
							<jsp:useBean id="sterlingDAO" class="package_SterlingDAO.SterlingDAO">
										<%
		 								   customerIdInt=Integer.parseInt(customerId);
										   cachedRowSet=sterlingDAO.paymentReportCustomer(customerIdInt);
										%>
							</jsp:useBean>	
				<%				int count=0;
								int amount=0;
								while (cachedRowSet.next()){								
				%>
									<tr>	
										<td><%=cachedRowSet.getInt(1)%></td>
										<td><%=cachedRowSet.getInt(6)%></td>
										<td><input name="<%=count%>" value="<%=cachedRowSet.getInt(1)%>"type="checkbox"></td>										
									</tr>									
			<%  					count++;
									amount++;
								}								
								Integer noOfRows=new Integer(count);
							    session.setAttribute("noOfRows",noOfRows);						
			%>			
				<tr>
					<td colspan="3" align="center">
						<!--Submit and Reset controls and validating the Delivery Date and Status-->
						<input name="InvoiceReportSubmit" type="submit" value="Pay">
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