//Name of the Package
package package_Invoice;

//Import necessary files and packages
import package_Exception.*;
import package_MainMenu.MainMenu;
import package_ReadData.*;
import package_SterlingDAO.*;

/**
* Class Name			:	InvoiceTester
* Description			:	This module is used to generate the invoice for
* 							a given month of the particular customer.
* Author 				:	NIKHIL MANDLIK, INFOSYS TECHNOLOGIES LTD.
* DATE					:	1-Jan-2008.
**/
public class InvoiceTester {
	Invoice invoice = new Invoice();
	
	/**
	 * It reads the invoice parameters
	 * @return void
	 * @throws Exception 
	 * @throws Exception
	 */	

	public void readInvoiceInfo() throws Exception {

		// Display the invoice Menu
		System.out.println("\t\t\t\t\t==========================");
		System.out.println("\t\t\t\t\t Sterling Courier Company" );
		System.out.println("\t\t\t\t\t==========================");
		System.out.println("\n\n\t\t\t\t\t   Invoice Generation");
		System.out.println("\t\t\t\t\t   ---------------------------------");

		// Read and Set the parameters
		System.out.print("\t\t\t\t\t  Customer ID\t\t:");
		int iCusomerId=Integer.parseInt(ReadData.acceptString());
		invoice.setcustomerId(iCusomerId);

		System.out.print("\t\t\t\t\t  Invoice Month\t\t:");
		invoice.setInvoiceMonth(Integer.parseInt(ReadData.acceptString()));

		System.out.print("\t\t\t\t\t  Invoice Year\t\t:");
		invoice.setInvoiceYear(Integer.parseInt(ReadData.acceptString()));

		System.out.print("\t\t\t\t\t  Description	\t:");
		invoice.setDescription((ReadData.acceptString()));
	
		//Exception Handling
		try{
			SterlingDAO sterlingDao = new SterlingDAO();
			invoice=sterlingDao.saveInvoice(invoice);
		}
		catch (E_employeeNotFound e){
			System.out.println("\n\n\t\t\t "+e.getMessage());
		}
		catch (E_invalid_month_year e){
			System.out.println("\n\n\t\t\t "+e.getMessage());
		}
		catch (E_invalid_order e){
			System.out.println("\n\n\t\t\t "+e.getMessage());
		}
		catch (E_invoice_already_generated e){
			System.out.println("\n\n\t\t\t "+e.getMessage());
		}
		catch (Exception e) {
			System.out.println("\n\n\t\t\t Please Enter valid Data!!!");
		}
		MainMenu mainMenu = new MainMenu();
		mainMenu.menu();
	}
}
/**
*END OF CLASS
**/
