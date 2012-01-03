/* File Name                     : InvoiceReport.js
* Description                    : generates Invoice Report
* Author 						 : Nikhil Mandlik
*/

 
 function Validation()
    {
    	customerid=document.InvoiceReportForm.customerid.value;
    	fromdate=document.InvoiceReportForm.fromdate.value;
    	todate=document.InvoiceReportForm.todate.value;
    	    	    	
	if(customerid==false)
	{
	alert("Customer field cannot be left blank");
	return false;
	}
	
	if(fromdate==false)
	{
	alert("From Date field cannot be left blank");
	return false;
	}
	
	if(todate==false)
	{
	alert("To Date field cannot be left blank");
	return false;
	}
	
	return true;
    }
    
 <!-- End of file -->