<!-- 
* Class Name                     : Add Customer.html
* Description                    : this is an error page
* Author 						 : Nikhil Mandlik
*/
 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<!-- Including external style sheet -->
<script language="JavaScript" src="sterling_courier_validation.js"> </script>
<link rel="stylesheet" type="text/css" href="commonstyle.css">
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
<!-- Links for home and login page -->
<DIV class="heading3" align="right">
<a href="HomePage.jsp">Home</a>
<a href="Logout.jsp">Logout</a><br>
</DIV>

<table class="layout" border="0" width="90%" align="center">
	<tr>
		<td align="center" colspan="2">
		<H1 class="heading1">Sterling Courier</H1>
		<br>
		<br>
		</td>
	</tr>

	<tr>
		<td colspan="2"><!-- Starting form for add customer menu -->

		<form name="f1" action="CustomerRegistration.jsp">

		<table border="0" width="60%" align="center">
			<tr>
				<td colspan="2" align="center">
				<p class="heading3">Customer Registration form</p>
				</td>
			</tr>

			<!-- entering the name of the customer-->
			<tr>
				<td>Customer Name<span class="mandatory">*</span></td>
				<td><input type="text" name="txtuser" maxlength="25" value=""></td>

			</tr>

			<!--entering the registration date of the customer-->
			<tr>
				<td>Date of Registration<span class="mandatory">*</span></td>
				<td><!--entering the day of the regsitration date--> <select
					name="txtdate">
					<script>
						
							for(iCount=1;iCount<=31;iCount++)
							{
								document.write("<option value="+iCount+">"+iCount+"</option>");
							}
							</script> <!--entering the month of the registration date-->
				</select> <select name="txtmonth">
					<option value="1">Jan</option>
					<option value="2">Feb</option>
					<option value="3">Mar</option>
					<option value="4">Apr</option>
					<option value="5">May</option>
					<option value="6">Jun</option>
					<option value="7">Jul</option>
					<option value="8">Aug</option>
					<option value="9">Sep</option>
					<option value="10">Oct</option>
					<option value="11">Nov</option>
					<option value="12">Dec</option>
				</select> <!--entering the month of the registration date--> <select
					name="txtyear">
					<script>
							for(iCount1=1990;iCount1<=2007;iCount1++)
							{
								document.write("<option value="+iCount1+">"+iCount1+"</option>");
							}
							</script>
				</select></td>

			</tr>

			<!--entering the address of the customer-->
			<tr>
				<td>Address<span class="mandatory">*</span></td>
				<td><input type="text" name="txtaddr" maxlength="50"></td>
			</tr>

			<!--entering the city of the customer-->
			<tr>
				<td>City<span class="mandatory">*</span></td>
				<td><input type="text" name="txtcity" maxlength="15"></td>
			</tr>

			<!--entering the pin code of the city-->
			<tr>
				<td>Pin<span class="mandatory">*</span></td>
				<td><input type="text" name="txtpin" maxlength="6"></td>
			</tr>

			<!--entering th telephone number of the customer-->
			<tr>
				<td>Telephone Number<span class="mandatory">*</span></td>
				<td><input type="text" name="txttelnum" maxlength="12">
				</td>
			</tr>

			<!--entering the email id of the customer-->
			<tr>
				<td>Email<span></span></td>
				<td><input Type="text" name="txtmail" maxlength="20"></td>
			</tr>

			<tr>
				<td></td>
				<td><font size="1">eg.abcde@xyz.com</font></td>
			</tr>

			<tr>
				<td colspan="2" align="center">
				<H6>Fields marked with asterisk <span class="mandatory">(*)</span>are
				compulsory. <br>
				This information is a must for successful Customer Registration.</H6>
				</td>
			</tr>

			<tr>
				<!--declaring the submit button-->
				<td align="center" colspan="2"><input name="Submit"
					value="Submit" type="submit" onClick="return validation()">
				<!--declaring the reset button--> <input name="Reset" type="Reset"
					value="Reset"></td>
			</tr>

		</table>
		</form>
		</td>
	</tr>
</table>
</body>
</html>
<!-- End of file -->
