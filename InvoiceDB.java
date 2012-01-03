//Name of the Package
package package_Invoice;


//Import necessary files and packages
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.CallableStatement;
import java.sql.Types;
import package_Exception.*;

/**
* Class Name			:	InvoiceDB
* Description			:	This module is used to generate the invoice for
* 							a given month of the particular customer.
* Author 				:	NIKHIL MANDLIK, INFOSYS TECHNOLOGIES LTD.
* DATE					:	1-Jan-2008.
**/
public class InvoiceDB extends Exception{
	public static final long serialVersionUID=1L;
	
	/**
	 *It generates the invoice for perticular Customer 
	 * @param invoice
	 * @return invoice
	 * @throws Exception
	 */
	
	public Invoice saveInvoice(Invoice invoice)throws Exception{

			
		Connection connection=null;
		try{
			// Loading Drivers of Oracle
			Class.forName("oracle.jdbc.driver.OracleDriver");

			//Making connection to oracle server
			connection = DriverManager.getConnection ("jdbc:oracle:thin:@10.122.130.36:1521:coorg","coct07lc2j2ee55","infy");
			
			//Calling the procedure from oracle server
			CallableStatement callableStatement =
			    connection.prepareCall("{call generate_invoice(?,?,?,?,?)}");

			//Call the methods 
			int iCustomerID = invoice.getcustomerId();
			int iInvoiceYear = invoice.getInvoiceYear();
			int iInvoiceMonth = invoice.getInvoiceMonth();

			//Pass the values into the procedure
			callableStatement.setInt(1,iCustomerID);
			callableStatement.setInt(2,iInvoiceMonth);
			callableStatement.setInt(3,iInvoiceYear);
			
			//Get the values from procedure
			callableStatement.registerOutParameter(4,Types.INTEGER);
			callableStatement.registerOutParameter(5,Types.FLOAT);
			
			//Execute the procedure
			callableStatement.execute();

			//Get the return values into variables
			int iStatus = callableStatement.getInt(4);
			float fAmount=callableStatement.getFloat(5);
			
			invoice.setAmount(fAmount);

			//Exception handling 
			switch(iStatus){

			case -1:	throw new E_employeeNotFound();

			case -2:	throw new E_invalid_month_year();

			case -3:	throw new E_invalid_order();
				
			case -4:	throw new E_invoice_already_generated();	

			default: 	System.out.println("\n\n\t\t\t Total Amount To be Paid"+fAmount);
						break;
			}
			 
			}
			finally
			{
				try
				{
					//close the connection
					connection.close();
				}
				catch (Exception exception)
				{
					System.out.println("");
				}
			}
		return invoice;
	}
}
/**
* END OF CLASS
**/

