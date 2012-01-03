//Name of the Package
package package_Delivery;

//Import necessary files and packages
import java.util.Calendar;

/**
* Class Name			:	Delivery
* Description			:	This module is used to save and retrieve the
* 							Delivery characteristics.
* Author 				:	NIKHIL MANDLIK, INFOSYS TECHNOLOGIES LTD.
* DATE					:	1-Jan-2008.
**/
public class Delivery
{
	private int orderId;
	private Calendar deliveryDate;
	private String remarks;
	char courierStatus;

	/**
	 * @return Returns the orderId.
	 */

	public int getOrderId()
	{
		return orderId;
	}

	/**
	 * @param orderId the orderId to set.
	 */

	public void setOrderId(int orderId)
	{
		this.orderId=orderId;
	}

	/**
	 * @return Returns the remarks.
	 */

	public String getRemarks()
	{
		return remarks;
	}

	/**
	 * @param remarks the remarks to set.
	 */

	public void setRemarks (String remarks)
	{
		this.remarks=remarks;
	}

	/**
	 * @return Returns the deliveryDate.
	 */

 	public Calendar getDeliveryDate()
 	{
		return deliveryDate;
 	}

	/**
	 * @param deliveryDate to set.
	 */

  	public void setDeliveryDate(Calendar deliveryDate)
  	{
		this.deliveryDate=deliveryDate;
  	}

  	/**
	 * @return Returns the courierStatus
	 */

	public char getCourierStatus()
	{
		return courierStatus;
	}

	/**
	 * @param courierStatus to set.
	 */

	public void setCourierStatus (char courierStatus)
	{
		this.courierStatus=courierStatus;
	}
}
/**
* END OF CLASS
**/



