<!-- 
* Class Name                     : PaymentReportCustomer.jsp
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
     <script language="Javascript" src="ReportDate.js" ></script>
</head>
<body>
<%	
	String sessionCustomerId=(String)session.getAttribute("sessionCustId");
%>

<%
	if (sessionCustomerId==null ){
		%>		
			<%-- Forward the request --%>
			<h2 align="center" style="background-color:red">
			Your Session has expired, Please Relogin!!!</h2>
			<jsp:include page="Login.html" />
		<%
		}
		else {
			int customerIdInt=Integer.parseInt(sessionCustomerId);
	
			CachedRowSet cachedRowSet=null;
%>
	<div class="heading3" align="right">
	<A Href="HomePage.jsp">Home</A>
	<A Href="Logout.jsp">Logout</A>
	</div>
			<!--Form used to make GUI-->
			<form name="ReportForm" action="PaymentsReport.jsp">
				<h1 class="heading1" align="center">Sterling Courier</h1>
			
				<table align="center" width="500">
					<tr>
						<th align="center" colspan="3" class="heading3">Payment Report
						</th>
					</tr>		
					<tr>
						<td Width="30%">
							<!--Defining Remarks field-->
							Customer ID
						</td>
						<td>
						</td>
						<td >
							<%=customerIdInt%>
							<input name="customerid" type="hidden" maxlength="4" size="27" value="<%=customerIdInt%>" >
						</td>
					</tr>
					
					<tr>
						<td Width="10%">
							<!--Defining Remarks field-->
							Duration
							<span class="mandatory">*</span>
						</td>		
						
						<td Width="10%">
							From
						</td>		
								
						<td>	
							<select name="fromday" >
								<% 	int i=0;
									for (i=1;i<32;i++){
								%>
									<option value="<%=i%>"><%=i%></option>
								<%	}		
								%>
							</select>
						
								<select name="frommonth">
									<option value="Jan" selected>Jan</option>
									<option value="Feb">Feb</option>
									<option value="Mar">Mar</option>
									<option value="Apr">Apr</option>
									<option value="May">May</option>
									<option value="Jun">Jun</option>
									<option value="Jul">Jul</option>
									<option value="Aug">Aug</option>
									<option value="Sep">Sep</option>
									<option value="Oct">Oct</option>
									<option value="Nov">Nov</option>
									<option value="Dec">Dec</option>
								</select>
						
								<select name="fromyear" >
									<% 	for (i=1985;i<2060;i++){
									%>
										<option value="<%=i%>"><%=i%></option>
									<%	}		
									%>
								</select>
						</td>
								
					</tr>
					
						<tr>	
							<td>
							</td>
							<td>
								To
							</td>
								<td>	
							<select name="today" >
								<% 	 i=0;
									for (i=1;i<32;i++){
								%>
									<option value="<%=i%>"><%=i%></option>
								<%	}		
								%>
							</select>
						
								<select name="tomonth">
									<option value="Jan" selected>Jan</option>
									<option value="Feb">Feb</option>
									<option value="Mar">Mar</option>
									<option value="Apr">Apr</option>
									<option value="May">May</option>
									<option value="Jun">Jun</option>
									<option value="Jul">Jul</option>
									<option value="Aug">Aug</option>
									<option value="Sep">Sep</option>
									<option value="Oct">Oct</option>
									<option value="Nov">Nov</option>
									<option value="Dec">Dec</option>
								</select>
						
								<select name="toyear" >
									<% 	for (i=1985;i<2060;i++){
									%>
										<option value="<%=i%>"><%=i%></option>
									<%	}		
									%>
								</select>
						</td>
					</tr>		
				
					<tr align="center">
						<td colspan="3">
							<H6><br>Fields marked with asterisk
							<span class="mandatory">(*)</span> are compulsory.
							<br>This information is a must for successful Invoice Report Generation</H6>
						</td>
					</tr>
				
					<tr>
						<td colspan="3" align="center">
							<!--Submit and Reset controls and validating the Delivery Date and Status-->
							<input name="InvoiceReportSubmit" type="submit" value="Submit" onClick="return validation()">
							<input type="reset" value="Reset">
						</td>
					</tr>
				</table>
			
			</form>
<%
		}
%>

</body>
</html>

<!-- End of file -->