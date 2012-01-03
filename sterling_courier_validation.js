/************************************************************************
* Function Name			: validation
* Input Parameteres		: none
* Description			: perform validations
* Author 				: NIKHIL MANDLIK, INFOSYS TECHNOLOGIES LTD.
* DATE					: 11-FEB-2008.
*************************************************************************/

function validation()
{	
	/*validating the name*/
	name=document.f1.txtuser.value;
	
	if(name==false)
	{
		alert("Name field can not be blank");
		return false;
	}
	
	for(iCount=0;iCount<=name.length;iCount++)
	{
		tmp=name.charCodeAt(iCount);
		if( (tmp<65)&&(tmp!=32)  ||(tmp>122)  ||  (tmp>90)&&(tmp<97))
			{
		             alert("Name can not have numbers,special characters");
		
		             return false;
		        }
	}
	
	
	for(iCount=0;iCount<=name.length;iCount++)
	{
		tmp=name.charCodeAt(iCount);
		tmp1=name.charCodeAt(iCount+1);
		if((tmp==32)&&(tmp1==32))
		{
		        alert("Name can not have two consecutive spaces");
		        return false;
		}
	}
	
	/*validating the date*/
	month=document.f1.txtmonth.value
	year=document.f1.txtyear.value
	day=document.f1.txtdate.value
	 
	 
	if(month==2)
	{
	  	if(year%4==0)
	   	{
	   		 if(day>29)
	    		{
	     			alert("Only 29 days in this month");
	     			return false;
	    		}
	  	 }
	   	else if(day>28)
	   	{
	   		 alert("Only 28 days in this month");
	    		return false;
	   	}
	}
	  
	if((month==4) || (month==6) || (month==9) || (month==11))
	{
	 	if(day>30)
	   	{
	   		 alert("Only 30 days in this month");
	    		 return false;
	   	}
	}

	/*validating the address*/
	
	address=document.f1.txtaddr.value
	if(address==false)
	{
		alert("Address field can not be blank");
		return false;
	}
		
	if(address.length>51)
	{
		alert("Address can not be more than 50 characters");
		return false;
	}
	
	/*validating the city*/
	
	city=document.f1.txtcity.value
	if(city==false)
	{
			alert("City field can not be blank");
			return false;
	}
	
	
	/*validating the pincode*/
	
	pin=document.f1.txtpin.value
	if(pin==false)
			{
				alert("Pin field can not be blank");
				return false;
			}

	for(iCount=0;iCount<=pin.length;iCount++)
		{
			tmp=pin.charCodeAt(iCount);
			if( (tmp<48) ||(tmp>57))
			{
			
			            alert("Pin code can have numeric values only");
			            return false;
			         
			}
	}
	
	
	/*validating the tele phone number*/
	
	telphone=document.f1.txttelnum.value
	if(telphone==false)
	{
		alert("Telephone number field can not be blank");
		return false;
	}
	
	for(iCount=0;iCount<=telphone.length;iCount++)
	{
		tmp=telphone.charCodeAt(iCount);
		if( (tmp<48) ||(tmp>57))
		{
			if(tmp!=32)
			{
			
		            alert("Telephone number can have numeric values only");
		            return false;
		         }
		}
	}
		
	for(iCount=0;iCount<=telphone.length;iCount++)
	{
		tmp=telphone.charCodeAt(iCount);
		tmp1=telphone.charCodeAt(iCount+1);
		if((tmp==32)&&(tmp1==32))
		{
		       alert("Telephone number can not have two consecutive spaces");
		       return false;
		}
	}
	

	/*validating the email id*/
	
	email=document.f1.txtmail.value
	if(email.length>0)
	{
	for(iCount=0;iCount<=4;iCount++)
	{
		tmp=email.charCodeAt(iCount);
		if(tmp==46||tmp==64)
		{
			alert("Email id should have atleast five characters");
			return false;
		}
	}
	
	var iCount1=0;
	
	/*validating that @ can not come more than once*/
	for(iCount=5;iCount<=email.length;iCount++)
	{
		tmp=email.charCodeAt(iCount);
		if(tmp==64)
		{
			iCount1++;
		}
	}
	
	if(iCount1>1)
	{
		alert("@ can not appear more than once");
		return false;
	}
	
	/* validating that '.' can not come before @*/
	iCount3=0;
	iCount2=0;
	for(iCount=5;iCount<=email.length;iCount++)
	{
		tmp=email.charCodeAt(iCount);
		if(tmp==64)
		{
			iCount3=tmp;
		}
		if(tmp==46)
		{
			iCount2=tmp;
		}
		if(iCount2>iCount3)
		{
			alert("'.' can not appear before @");
			return false;
		}
	}	

	/*validating if email must contain @ atleast once*/
 		for(iCount=5;iCount<=email.length;iCount++)
  		{
   			tmp=email.charCodeAt(iCount);
			if(tmp==64)
   		{
    		iCount1++;
   		}
  		}
  
  		if(iCount1==0)
		{
   			alert("Email id must contain @ atleast once");
			return false;
 		}
 
	/*email must contain '.' atleast once*/
		 for(iCount=5;iCount<=email.length;iCount++)
		   {
		    tmp=email.charCodeAt(iCount);
   	 		 if(tmp==46)
		         {
   	  			iCount2++;
   	 		 }
   		}
   
   		if(iCount2==0)
		   {
    			alert("Email id must contain '.' atleast once");
			    return false;
  		   }
  	}
	
}	
/*************************************************************************
* End of file
**************************************************************************/
	