<!-- 
* Class Name                     : CustomerRegistration.jsp
* Description                    : this is an error page
* Author 						 : Nikhil Mandlik
*/
 -->
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%-- Importing the external files... --%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "javax.sql.rowset.CachedRowSet" %>
<%@ page import = "com.sun.rowset.CachedRowSetImpl" %>
<%@ page import = "java.util.*"%>
<%@ page import = "package_SterlingDAO.*"%>
<%@ page import = "package_Customer.Customer" %>
<%@ page import = "package_Exception.*" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Registration</title>
</head>
<body>	
	    <!-- retrieving the parameters from the previous page -->
<%		String sCustomerName = request.getParameter("txtuser");
		String sRegestrationDate = request.getParameter("txtdate");
		String sRegestrationMonth = request.getParameter("txtmonth");
		String sRegestrationYear = request.getParameter("txtyear");
		String sAddress = request.getParameter("txtaddr");
		String sCity = request.getParameter("txtcity");
		String sPin = request.getParameter("txtpin");
		String sTelephoneNumber = request.getParameter("txttelnum");
		String sEmail= request.getParameter("txtmail");
			//null field validations
			if (sCustomerName==null
				||sAddress==null 
				||sCity==null 
				||sPin==null 
				||sTelephoneNumber==null ){
		%>		
				<%-- Forward the request if username is not specific --%>
				<h2 align="center" style="background-color:red">Please enter the
	Required Details!!!</h2>
	<jsp:include page="AddCustomer.jsp" />
		<% }
			else if (sCustomerName.length()==0 
					||sAddress.length()==0
					||sCity.length()==0
					||sPin.length()==0
					||sTelephoneNumber.length()==0
					||sRegestrationDate.equals("null")
					||sRegestrationMonth.equals("null")
					||sRegestrationYear.equals("null")){
		%>	
				<%-- Forward the request if username is not specific --%>
				<h2 align="center" style="background-color:red">Please enter the
	Required Details!!!</h2>
	<jsp:include page="AddCustomer.jsp" />
		<% }
			else {
				try{
					//parsing the string values to integer
					int id=Integer.parseInt(sRegestrationDate);
					int im=Integer.parseInt(sRegestrationMonth);
					int iy=Integer.parseInt(sRegestrationYear);
					
					Calendar  RegestrationDate = Calendar.getInstance();
					
					RegestrationDate.set(iy,im,id);
							
					 /* Saving the values to the customer bean */
					 
			%>		<div class="heading3" align="right">
					<A Href="HomePage.jsp">Home</A>
					<A Href="Logout.jsp">Logout</A>
					</div>
					<jsp:useBean id="customerbean" class="package_Customer.Customer">
						<jsp:setProperty name="customerbean" property="address" value="<%=sAddress%>"></jsp:setProperty>
						<jsp:setProperty name="customerbean" property="city" value="<%=sCity%>"></jsp:setProperty>
						<jsp:setProperty name="customerbean" property="pin" value="<%=sPin%>"></jsp:setProperty>
						<jsp:setProperty name="customerbean" property="custName" value="<%=sCustomerName%>"></jsp:setProperty>
						<jsp:setProperty name="customerbean" property="telNo" value="<%=sTelephoneNumber%>"></jsp:setProperty>
						<jsp:setProperty name="customerbean" property="email" value="<%=sEmail%>"></jsp:setProperty>
						<jsp:setProperty name="customerbean" property="dateOfReg" value="<%=RegestrationDate%>"></jsp:setProperty>
					</jsp:useBean>
					<%
						int custId=0;
						String userId=null;
					%>
					<!-- Saving the parameters in bean class -->
					<jsp:useBean id="sterlingDAO" class="package_SterlingDAO.SterlingDAO">
								<%
		  						  custId=sterlingDAO.saveCustomer(customerbean);								
								  customerbean=sterlingDAO.retrieveCustomer(custId);
								  userId=customerbean.getUserId();
								%>								
								<jsp:forward page="Add Customer Report.jsp" >
								<jsp:param name="custId" value="<%=custId %>" ></jsp:param>
								<jsp:param name="userId" value="<%=userId%>"></jsp:param>
								</jsp:forward>
					</jsp:useBean>					
			<%
				}
				catch(Exception e)
				{%>
					<jsp:forward page="Add Customer Error.jsp" >
					<jsp:param name="mes" value="<%=e.getMessage()%>"></jsp:param>
					</jsp:forward>	
					<%
				}
			}
		
%>
</body>
</html>
<!-- End of file -->