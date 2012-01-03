//Name of the Package
package package_Delivery;

//Import necessary files and packages
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.text.SimpleDateFormat;

import package_Exception.*;
import package_MainMenu.MainMenu;
import package_ReadData.ReadData;
import package_SterlingDAO.SterlingDAO;
import package_OrderDB.*;

/**
* Class Name			:	DeliveryTester
* Description			:	This module is used to generate the invoice for
* 							a given month of the particular customer.
* Author 				:	NIKHIL MANDLIK, INFOSYS TECHNOLOGIES LTD.
* DATE					:	1-Jan-2008.
**/
public class DeliveryTester
{
	/**
	 * It reads the Delivery parameters
	 * @return void
	 * @throws Exception 
	 * @throws 
	 */	
	public void readDeliveryInfo() throws Exception{
		
		// Display the invoice Menu
		System.out.println("\t\t\t\t\t   ==========================");
		System.out.println("\t\t\t\t\t    Sterling Courier Company" );
		System.out.println("\t\t\t\t\t   ==========================");
		System.out.println("\n\n\t\t\t\t\t       Courier Delivery");
		System.out.println("\t\t\t\t        -----------------------------");
		
		try
		{
			// Read the parameters
			System.out.print("\t\t\t\t\tEmployee Id\t\t:");
			int employeeId=Integer.parseInt(ReadData.acceptString());
			
			
			OrderDB orderDb = new OrderDB();
			List list = orderDb.retrieveOrdersNotClose(employeeId);
			Iterator iterator=list.iterator();
			
			System.out.print("\n\t\t\t\tAssigned Order ID: ");
						
			while(iterator.hasNext())
	          {
				Object element=iterator.next();
		 		System.out.print(element + "  ");
	          }
			System.out.print("\n");

			System.out.print("\n\t\t\t\t\tOrder Id\t\t:");
			int orderId=Integer.parseInt(ReadData.acceptString());

			System.out.print("\t\t\t\t\tDate Of Delivery \n\t\t\t\t\t(DD-MMM-YYYY)\t\t:");
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MMM-yyyy");
			Calendar deliveryDate = new GregorianCalendar();
			deliveryDate.setTime(simpleDateFormat.parse(ReadData.acceptString()));
			
			System.out.print("\t\t\t\t\tStatus (P,R,D)\t\t:");
			char courierStatus=(ReadData.acceptString().charAt(0));

			System.out.print("\t\t\t\t\tRemarks\t\t\t:");
			String remarks=ReadData.acceptString();

			// Set the parameters
			Delivery delivery=new Delivery();
			delivery.setOrderId(orderId);
			delivery.setDeliveryDate(deliveryDate);
			delivery.setRemarks(remarks);
			delivery.setCourierStatus(courierStatus);
		
			SterlingDAO sterlingDAO=new SterlingDAO();
			sterlingDAO.saveDelivery(delivery,courierStatus);
		}
		
		catch (E_already_accepted e){
			System.out.println("\n\n\t\t\t "+e.getMessage());
		}
		catch (E_courier_rejected e){
			System.out.println("\n\n\t\t\t "+e.getMessage());
		}
		catch (E_invalid_delivery_date e){
			System.out.println("\n\n\t\t\t "+e.getMessage());
		}
		catch (E_invalid_orderID e){
			System.out.println("\n\n\t\t\t "+e.getMessage());
		}		
		catch (Exception e)
		{
			System.out.println("Exception Occurred..!!\n"+e);
			readDeliveryInfo();
		}
		MainMenu mainMenu = new MainMenu();
		mainMenu.menu();
	}
}
/**
 * END OF CLASS
**/