<!-- 
* Class Name                     : Invoice.html
* Description                    : displays invoice form
* Author 						 : Nikhil Mandlik
*/
 -->
 <html>
<head>
<title>Invoice</title>

	<!-- Using external casacaded style sheets -->
	<link rel="stylesheet" type="text/css" href="commonstyle.css">

	<!-- Using external javascript file -->
	<script language="javascript" src="sterling_order_invoice_validation.js"></script>

</head>
<body>
<% 

if(((String)session.getAttribute("user")==null) || 
((String)session.getAttribute("sessionDesignation")==null))
{%>
<%-- Sending the control on error page if --%>

<jsp:forward page="errorPage.jsp">
<jsp:param name="error" value="Your Session has expired, Please Relogin!!!"/>
</jsp:forward>		
<% 

}
%>

	<!-- Displaying Home and Logout links -->
	<div class="heading3" align="right">
	<a href="HomePage.jsp">Home</a>
	<a href="Logout.jsp">Logout</a>
	</div>

	<!-- Displaying Heading -->
	<H1 class="heading1" align="center">Sterling Courier</H1>
	<br><br><br>

	<!-- Invoice Form -->
	<form name="invoice_form" action="Invoice.jsp">
	<table align="center" width="50%">

		<!-- Invoice Form Heading -->
		<tr><th colspan="2" class="heading3" align="center">Invoice</th></tr>

		<!-- : Customer Id -->
		<tr>
			<td>Customer ID<span class="mandatory">*</span></td>
			<td align="left"><input type="text"
						name="custId" maxlength=4></td>
		</tr>

		<!--Invoice Month -->
		<tr>
			<td>
				Invoice Month<span class="mandatory">*</span>
			</td>
			<td align="left">
			<select name="month">
				<option value="1">Jan
				<option value="2">Feb
				<option value="3">Mar
				<option value="4">Apr
				<option value="5">May
				<option value="6">Jun
				<option value="7">Jul
				<option value="8">Aug
				<option value="9">Sep
				<option value="10">Oct
				<option value="11">Nov
				<option value="12">Dec
			</select>
			</td>
		</tr>

		<!--Invoice Year -->
		<tr>
			<td>
				Invoice Year<span class="mandatory">*</span>
			</td>
			<td align="left">
			<select name="year">
				<script language="JavaScript" >
				for(iNum=2006;iNum<=2008;iNum++)
				{
					document.write("<option value="+iNum+">"+iNum);
				}
				</script>
			</select>
			</td>
		</tr>

		<!--Mandatory field notification -->
		<tr align="center">
			<td colspan="2">
				<H6><br>Fields marked with asterisk
				<span class="mandatory">(*)</span> are compulsory.
				<br>This information is a must for successful Invoice Report</H6>
			</td>
		</tr>

		<!--Submit and Reset buttons -->
		<tr>
		
			<td colspan="2" align="center">
				<input type="submit" name="invoice_report"
				value="Submit"
				onClick="return validation(document.invoice_form.custId.value)">
				<input type="reset" value="Reset">
			</td>
		</tr>

	</table>
	</form>

</body>
</html>
<!-- End of file -->