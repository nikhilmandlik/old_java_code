//Name of the Package
package package_Delivery;

//Import necessary files and packages
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Types;
import java.util.Calendar;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.ArrayList;
import package_Exception.*;

/**
* Class Name			:	DeliveryDB
* Description			:	This module is used to Save the customer
* Author 				:	NIKHIL MANDLIK, INFOSYS TECHNOLOGIES LTD.
* DATE					:	1-Jan-2008.
**/
public class DeliveryDB
{
	
	/**
	 * It saves the Delivery after validating 
	 * @param delivery
	 * @param status
	 * @return int
	 * @throws Exception
	 */
	
 	 public int saveDelivery(Delivery delivery,char status)throws Exception
 	 {
 		 
 		 
 		 Connection connection = null;
 		 try {
 			 int iStatus=0;
		 
 		 // Loading Drivers of Oracle
 		 Class.forName("oracle.jdbc.driver.OracleDriver");
 		 
 		 // Making connection to oracle server
		 connection = DriverManager.getConnection ("jdbc:oracle:thin:@10.122.130.36:1521:coorg","coct07lc2j2ee55","infy");
			
		 // Calling the procedure from oracle server	
		 CallableStatement callableStatement = 
			    connection.prepareCall("{call Delivery(?,?,?,?,?)}");
			
		// Convert Date into SQL format
		Calendar date= delivery.getDeliveryDate();
		long value = date.getTimeInMillis();
		java.sql.Date iDeliveryDate = new java.sql.Date(value);
		
		// Call the methods
		String sStatus = String.valueOf(status);
		String sRemarks =delivery.getRemarks();
		int iOrderId = delivery.getOrderId();
		
		// Pass the values into the procedure
		callableStatement.setInt(1,iOrderId);
		callableStatement.setDate(2,iDeliveryDate);
		callableStatement.setString(3,sRemarks);
		callableStatement.setString(4,sStatus);
		
		//Get the values from procedure
		callableStatement.registerOutParameter(5,Types.INTEGER);
		
		//Execute the procedure
		callableStatement.execute();
		
		//Get the return values into variables
		iStatus = callableStatement.getInt(5); 

		// Close the connection
		connection.close();
		System.out.println(iStatus);
		
		//Exception handling
		switch(iStatus){
		 
			 case 1:	throw new E_invalid_orderID();
			 				
			 case 2:	throw new E_courier_rejected();
			 
			 case 3:	throw new E_already_accepted();
			 
			 case 4:	throw new E_invalid_delivery_date();
			 			
			 case 5:	break;
		}
		return iStatus;
 	 }
		finally{
			try{
				//closing the connection
				connection.close(); 
			}
			catch(Exception e)
			{
				System.out.println("");
			}
		}
	}
 	 
 	 

 	
 	}

       
  



          




/**
* END OF CLASS
**/
