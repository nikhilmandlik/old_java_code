//Name of the Package
package package_Invoice;

//Import necessary files and packages
import java.util.Calendar;

/**
* Class Name			:	Invoice
* Description			:	This module is used to save and retrieve the 
* 							invoice characteristics.
* Author 				:	NIKHIL MANDLIK, INFOSYS TECHNOLOGIES LTD.
* DATE					:	1-Jan-2008.
**/
public class Invoice {
	
	/* Declaration of data members 
	*/
	private int invoiceId;
	private int customerId;
	private Calendar invoiceDate;
	private int invoiceMonth;
	private int invoiceYear;
	private double amount;
	private String description;
	
	/**
	* @return Returns the invoiceId.
	*/
	public int getInvoiceId(){
		return invoiceId;
	}

	/**
	* @param invoiceID The invoiceID to set.
	*/
	public void setInvoiceId(int invoiceID){
		invoiceId=invoiceID;
	}

	/**
	* @return Returns the customerID.
	*/
	public int getcustomerId(){
		return customerId;
	}

	/**
	* @param customerID The customerId to set.
	*/
	public void setcustomerId(int customerID){
		customerId=customerID;
	}

	/**
	* @return Returns the invoiceDate.
	*/
	public Calendar getIncvoiceDate(){
			return invoiceDate;
	}

	/**
	* @param dateOfInvoice The invoiceDate to set.
	*/
	public void setInvoiceDate(Calendar dateOfInvoice){
			invoiceDate=dateOfInvoice;
	}

	/**
	* @return Returns the invoiceMonth.
	*/
	public int getInvoiceMonth(){
			return invoiceMonth;
	}

	/**
	* @param invoiceMonth The invoiceMonth to set.
	*/
	public void setInvoiceMonth(int invoiceMonth){
			this.invoiceMonth=invoiceMonth;
	}


	/**
	* @return Returns the invoiceYear.
	*/
	public int getInvoiceYear(){
			return invoiceYear;
	}

	/**
	* @param invoiceYear The invoiceYear to set.
	*/
	public void setInvoiceYear(int invoiceYear){
			this.invoiceYear=invoiceYear;
	}

	/**
	* @return Returns the amount.
	*/
	public double getAmount(){
			return amount;
	}

	/**
	* @param amount The amount to set.
	*/
	public void setAmount(double amount){
			this.amount=amount;
	}

	/**
	* @return Returns the description.
	*/
	public String getDescription(){
				return description;
	}

	/**
	* @param description The description to set.
	*/
	public void setDescription(String description){
				this.description=description;
	}
}
/**
 * END OF CLASS
**/
