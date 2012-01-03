<!-- 
* Class Name                     : MakePayment2.jsp
* Description                    : It is used to make payments
* Author 						 : Nikhil Mandlik
*/
 -->
 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import = "javax.sql.rowset.CachedRowSet" %>
<%@ page import = "com.sun.rowset.CachedRowSetImpl" %>
<%@ page import = "package_SterlingDAO.*" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Make Payments</title>

	<link rel="stylesheet" type="text/css" href="commonstyle.css">    
     <script language="Javascript" src="ReportDate.js" ></script>
     
</head>
<body>
<% 

	String sessionDesignation = (String)session.getAttribute("sessionDesignation");

	if (sessionDesignation==null){
		%>
			<jsp:include page="InvoiceReportCustomer.jsp"></jsp:include>
		<%
	}
	else {
		try{
			Integer	count1=null;	
			count1=(Integer)session.getAttribute("noOfRows");
			int countInt=count1.intValue();
			int amount=0;
			
			for(int i=0;i<countInt;i++){			
					
				String invoiceId= request.getParameter(""+i);
					
				if(invoiceId!=null){			
					int invoiceIdInt=Integer.parseInt(invoiceId);
				%>
				<%
					SterlingDAO s= new SterlingDAO();			
					amount=amount+s.makePayments(invoiceIdInt);						
				}				
			}
				%>
		
				<body>
					<div class="heading3" align="right">
					<A Href="HomePage.jsp">Home</A>
					<A Href="Logout.jsp">Logout</A>
					</div>
					
				<table class="layout" border="0" width="90%" align="center">
					<tr>
						<td align="center" colspan="2">
							<H1 class="heading1">Sterling Courier</H1>
							<br><br>
						</td>
						
						<table border="0" width="60%" align="center">
							<tr>
								<td colspan="2" align="center"><p class="heading3">Payment Sucessfully Done!!!</p></td>
							</tr>			
							<tr>
								<td align="center"><h2>Total Amount paid &nbsp<p class="heading3">Rs.<%=amount%>/-</p></h2></td>
							</tr>
						</table>
						
						
					</tr>
				</table>
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