<!-- 
* Class Name                     : PaymentsReport.jsp
* Description                    : It is used to generates payment Reports
* Author 						 : Nikhil Mandlik
*/
 -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%-- All import statements... --%>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.CallableStatement" %>

<%@ page import = "java.sql.ResultSet" %>

<%@ page import = "javax.sql.rowset.CachedRowSet" %>
<%@ page import = "com.sun.rowset.CachedRowSetImpl" %>

<%@ page import = "java.sql.Types" %>

<%@ page import = "java.text.SimpleDateFormat"%>
<%@ page import = "java.util.Calendar"%>
<%@ page import = "java.util.GregorianCalendar"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Payment Report</title>
	    <link rel="stylesheet" type="text/css" href="commonstyle.css">
</head>
<body>

	<%	/*	Declaration of variables */
		String customerId= request.getParameter("customerid");
		String check=(String)session.getAttribute("sessionDesignation");
		
		CachedRowSet cachedRowSet=null;
		
		String fromDay = request.getParameter("fromday");
		String fromMonth = request.getParameter("frommonth");
		String fromYear = request.getParameter("fromyear");	
		String fromDate =fromDay+"-"+fromMonth+"-"+fromYear;
		
		String toDay = request.getParameter("today");
		String toMonth = request.getParameter("tomonth");
		String toYear = request.getParameter("toyear");	
		String toDate =toDay+"-"+toMonth+"-"+toYear;
		
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
				<h1 class="heading1" align="center">Sterling Courier</h1>
		
				<table align="center" width="80%" ><br><br>
					<tr>
						<th align="center" colspan="7" class="heading3">Payment Report for Customer ID <%=customerId%>
						</th>
					</tr>
				
					<tr>
						<th>Invoice ID</th>					
						<th >Customer ID</th>					
						<th >Invoice For Month</th>					
						<th >Invoice For Year</th>					
						<th >Invoice Date</th>					
						<th >Date of Payment</th>
						<th >Amount</th>				
					</tr>
					
					<jsp:useBean id="sterlingDAO" class="package_SterlingDAO.SterlingDAO">
								<%
 								  int customerIdInt=Integer.parseInt(customerId);
								  cachedRowSet=sterlingDAO.paymentReportMC(customerIdInt,fromDate,toDate);
								%>
					</jsp:useBean>	
		<%		
						while (cachedRowSet.next()){	
		%>
						<tr>	
							<td><%=cachedRowSet.getInt(1)%></td>
							<td><%=cachedRowSet.getInt(2)%></td>
							<td><%=cachedRowSet.getInt(3)%></td>
							<td><%=cachedRowSet.getInt(4)%></td>
							<td><%=cachedRowSet.getDate(5)%></td>
							<td><%=cachedRowSet.getDate(6)%></td>							
							<td><%=cachedRowSet.getInt(7)%></td>
						<tr>
		<%  			}			
				}				
			catch(Exception e){	
				
				if (check.equals("X")){					
			%>		
				<jsp:forward page="PaymentReportCustomerError.jsp" >
				<jsp:param name="mes" value="<%=e.getMessage()%>"></jsp:param>
				</jsp:forward>		
			<%
				}
				else{					
					%>	
					<jsp:forward page="PaymentReportMCError.jsp" >
					<jsp:param name="mes" value="<%=e.getMessage()%>"></jsp:param>
					</jsp:forward>					
				<%
				}
			}			
		}	
		%>
	

</body>
</html>

<!-- End of file -->