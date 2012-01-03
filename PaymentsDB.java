/**
 * This class is used to calculate Payment.
 * Date: 04-Feb-2008
 * @author NikhilKanhoji_M, Infosys Technologies Limited
 * @version 1.0
 */
package package_Payments;

//Import necessary files and packages
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.CallableStatement;
import java.sql.Types;

import package_Exception.Invalid_InvoiceId;
import package_Exception.Payment_Already_Done;

/**
 * @author NikhilKanhoji_M
 *
 */
public class PaymentsDB {

	public int makePayments(int invoiceIdInt)throws Exception{
		
		int amount=0;		
		Connection connection=null;
		
		try
		{
			//Loading Drivers of Oracle
			Class.forName("oracle.jdbc.driver.OracleDriver");

			//Making connection to oracle server
			connection = DriverManager.getConnection ("jdbc:oracle:thin:@10.122.130.36:1521:coorg","coct07lc2j2ee55","infy");
			
			//Calling the procedure from oracle server
			CallableStatement callableStatement =
			    connection.prepareCall("{call make_Payments(?,?)}");

			/* set the procedure parameter values*/
			callableStatement.setInt(1,invoiceIdInt);
			
			/*Get the values from procedure*/
			callableStatement.registerOutParameter(2,Types.INTEGER);
			
			/*Execute the procedure*/
			callableStatement.execute();

			//Get the return values into variables
			amount=callableStatement.getInt(2);
			System.out.println(amount);
			
			if(amount==-1){
				throw new Invalid_InvoiceId();
			}
			else if (amount==-2){
				throw new Payment_Already_Done();
			}
		}
		finally{			
			try {
				connection.close();
			} catch (RuntimeException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 			
		}
		return amount;
	}
}
/**
 *	End of File PaymentDB.java
 */
