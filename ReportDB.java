
/**
 * This class is used to genearet reports.
 * Date: 04-Feb-2008
 * @author NikhilKanhoji_M, Infosys Technologies Limited
 * @version 1.0
 */
package package_Report;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.sun.rowset.CachedRowSetImpl;
import javax.sql.rowset.CachedRowSet;
import package_OrderDB.Order;
import package_Exception.*;


/**
 * @author NikhilKanhoji_M
 *
 */
/**
 * @author NikhilKanhoji_M
 *
 */
public class ReportDB 
{
	
	public CachedRowSet retrieveDeliveryHistoryReport(int orderId)throws Exception
 	{
 		//List<Order> orderList = new ArrayList<Order>();
 		Connection connection=null;
 		CachedRowSet crset = new CachedRowSetImpl();
 		
 		try
 		{
 			//Establishing connection with database
 			Class.forName("oracle.jdbc.driver.OracleDriver");
 			connection = DriverManager.getConnection("jdbc:oracle:thin:@10.122.130.36:1521:coorg","coct07lc2j2ee55","infy");
 			Statement statement = connection.createStatement();
 			PreparedStatement preparedStatement =
 			connection.prepareStatement("Select CustomerId, CourierStatus,deliverydate from sterling_deliveryhistory where orderid=?");
 			preparedStatement.setInt(1, orderId);
 			ResultSet resultset;
 			resultset = preparedStatement.executeQuery();
 			
 	        crset.populate(resultset);
 	        //Closing statement and connection
 	        statement.close();
 		}
 	    catch(Exception e)
 	    {
 			throw e;
 		}
 		finally
 		{
 			try
 			{
 				//closing the connection
 				connection.close(); 
 			}
 			catch(Exception e)
 			{
 				System.out.println("");
 			}
 		}
 			return crset;
	
 	}
	/**
	 * retrieveCustomerReport
	 * 
	 */
	public int retrieveCustomerReport(int CustId,Calendar FromDate,Calendar ToDate)throws Exception
	{
		int ret;
		Connection connection=null;
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");

			//Establishing connection with database
			connection = DriverManager.getConnection("jdbc:oracle:thin:@10.122.130.36:1521:coorg","coct07lc2j2ee55","infy");
			String query="Select count(OrderID) from Sterling_Order where customerid=? and orderdate between ? and?";
			Date fromDate=new Date(FromDate.getTimeInMillis());
			Date toDate=new Date(ToDate.getTimeInMillis());
			PreparedStatement preparedstatement=connection.prepareStatement(query);
			preparedstatement.setInt(1,CustId);
			preparedstatement.setDate(2,fromDate);
			preparedstatement.setDate(3,toDate);

		ResultSet resultset=preparedstatement.executeQuery();
		resultset.next();
		ret=resultset.getInt(1);
		}
		catch (Exception e)
		{
			throw e;  
		}
		finally
		{
			try
			{
				//closing the connection*
				connection.close(); 
			}
			catch(Exception e)
			{
				System.out.println("");
			}
		}
		return ret;
	}

	/**
	 * retrieveCustomerReport
	 * 
	 */
	public List retrieveEmployeeReport(int EmpId,Calendar FromDate,Calendar ToDate)throws Exception
	{
		
		//Creating an arraylist object
		ArrayList list =new ArrayList();
		//Creating the connection object
		Connection connection=null;
		try
		{
			//loading the driver
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//establishing the connection
			connection=DriverManager.getConnection("jdbc:oracle:thin:@10.122.130.36:1521:coorg","coct07lc2j2ee55","infy");
			//creating the statement
			String query="Select OrderID from Sterling_Order where employeeid=? and orderdate between ? and?";
			Date fromDate=new Date(FromDate.getTimeInMillis());
			Date toDate=new Date(ToDate.getTimeInMillis());
			PreparedStatement preparedstatement=connection.prepareStatement(query);
			preparedstatement.setInt(1,EmpId);
			preparedstatement.setDate(2,fromDate);
			preparedstatement.setDate(3,toDate);

		ResultSet resultset=preparedstatement.executeQuery();
		
		boolean flag= resultset.next();
		while(flag)
		{
			int custID=resultset.getInt(1);
			list.add(new Integer(custID));
			flag = resultset.next();
		}
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		finally
		{
			try
			{
				connection.close();
			}
			catch(Exception e)
			{
				System.out.println(e.getMessage());
			}
		}
		return list; 
	}
	
	/**
	 * Retrieve list of order Id for status being supplied as parameter
	 * for status accepted or pending.
	 * @param status   :It is status of char type
	 *		  todate   :It is of Calendar type
	 *		  fromdate :It is of Calendar type
	 * @return orderIdList : It is List of order IDs for recieved parameter employee ID
	 */

	public CachedRowSet retrieveOrderStatusReport(char status,Calendar todate,Calendar fromDate)throws Exception

	{
		//List<Order> orderList = new ArrayList<Order>();
		java.util.Date date = fromDate.getTime();
		long milli = date.getTime();
		Date date1 = new Date(milli);
        date = todate.getTime();
		milli = date.getTime();
		Date date2 = new Date(milli);

		//Establishing connection with database
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection connection = DriverManager.getConnection(
				"jdbc:oracle:thin:@10.122.130.36:1521:coorg","coct07lc2j2ee55","infy");

		Statement statement = connection.createStatement();
		PreparedStatement preparedStatement =
		connection.prepareStatement("Select OrderId, CustomerId, CourierStatus from Sterling_Order where CourierStatus=?"+
		" and OrderDate between ? and ? ");

		preparedStatement.setString(1, String.valueOf(status));
		preparedStatement.setDate(2, date1);
		preparedStatement.setDate(3, date2);

		ResultSet rs;
		rs = preparedStatement.executeQuery();
		 CachedRowSet crset = new CachedRowSetImpl();
		 crset.populate(rs);
		//Closing statement and connection
		statement.close();
		//preparedStatement.close();
		connection.close();
		return crset;
	}
	/**
	 * Retrieve list of order Id for status being supplied as parameter.
	 * @param status   :It is status of char type
	 * @return orderIdList : It is List of order IDs for recieved parameter employee ID
	 */

	public CachedRowSet retrieveOrderStatusReportParam(char status) throws Exception
	{

		//Establishing connection with database
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection connection = DriverManager.getConnection(
				"jdbc:oracle:thin:@10.122.130.36:1521:coorg","coct07lc2j2ee55","infy");
		Statement statement = connection.createStatement();

		PreparedStatement preparedStatement =
		connection.prepareStatement("Select OrderId, CustomerId, CourierStatus from Sterling_Order where CourierStatus=?");

		preparedStatement.setString(1, String.valueOf(status));

		ResultSet rs;
		rs = preparedStatement.executeQuery();
		CachedRowSet crset = new CachedRowSetImpl();
		 crset.populate(rs);
		//Closing statement and connection
		statement.close();

		//preparedStatement.close();
		connection.close();
		return crset;
	}
	/**
	 * Retrieve list of order Id for duration being supplied as parameter.
	 * @param status   :It is status of char type
	 * @return orderIdList : It is List of order IDs for recieved parameter employee ID
	 */

	public CachedRowSet retrieveOrderStatusReportDuration(Calendar todate,Calendar fromDate) throws Exception
	{
		java.util.Date date = fromDate.getTime();
		long milli = date.getTime();
		Date date1 = new Date(milli);
        date = todate.getTime();
		milli = date.getTime();
		Date date2 = new Date(milli);

		//Establishing connection with database
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection connection = DriverManager.getConnection(
				"jdbc:oracle:thin:@10.122.130.36:1521:coorg","coct07lc2j2ee55","infy");
		Statement statement = connection.createStatement();

		PreparedStatement preparedStatement =
		connection.prepareStatement("Select OrderId, CustomerId, CourierStatus from Sterling_Order where + OrderDate between ? and ? ");
		preparedStatement.setDate(1, date1);
		preparedStatement.setDate(2, date2);
		ResultSet rs;
		rs = preparedStatement.executeQuery();
		CachedRowSet crset = new CachedRowSetImpl();
		 crset.populate(rs);
		//Closing statement and connection
		statement.close();

		//preparedStatement.close();
		connection.close();
		return crset;
	}
	
	/**
	 * @return CachedRowSet
	 * @throws Exception
	 */
	public CachedRowSet invoiceReportCustomerID() throws Exception       
	{
		
		CachedRowSet cachedRowSet=null;				
		Connection connection=null;
		
		try
		{
			//loading the driver
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//establishing the connection
			connection = DriverManager.getConnection ("jdbc:oracle:thin:@10.122.130.36:1521:coorg","coct07lc2j2ee55","infy");
			//creating the statement
			Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			
			cachedRowSet = new CachedRowSetImpl();
			ResultSet resultset=statement.executeQuery("SELECT DISTINCT CustomerID from Sterling_invoice");
			
			cachedRowSet.populate(resultset);
			
			if(cachedRowSet.size()==0)
			{
			
				throw new invoiceNotPresent();				
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
		return cachedRowSet; 
	}
	
	/**
	 * @param customerId
	 * @param fromDate
	 * @param toDate
	 * @return CachedRowSet
	 * @throws Exception
	 */
	public CachedRowSet invoiceReportMC(int customerId,String fromDate,String toDate) throws Exception       
	{
		
		CachedRowSet cachedRowSet=null;				
		Connection connection=null;
		
		try
		{
			//loading the driver
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//establishing the connection
			connection = DriverManager.getConnection ("jdbc:oracle:thin:@10.122.130.36:1521:coorg","coct07lc2j2ee55","infy");
			//creating the statement
			Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			
			cachedRowSet = new CachedRowSetImpl();
				
			ResultSet resultset=statement.executeQuery("SELECT INVOICEID,CUSTOMERID,Invoiceformonth,invoiceforyear,invoicedate,amount,description FROM Sterling_Invoice where CustomerId="+customerId+"AND InvoiceDate>='"+fromDate+"'AND InvoiceDate<='"+toDate+"'");
			
			cachedRowSet.populate(resultset);
			
			if(cachedRowSet.size()==0)
			{
				throw new invoiceNotPresent();
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
		return cachedRowSet; 
	}
	
	/**
	 * @return CachedRowSet
	 * @throws Exception
	 */
	public CachedRowSet paymentReportCustomerID() throws Exception       
	{
		
		CachedRowSet cachedRowSet=null;				
		Connection connection=null;
		
		try
		{
			//loading the driver
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//establishing the connection
			connection = DriverManager.getConnection ("jdbc:oracle:thin:@10.122.130.36:1521:coorg","coct07lc2j2ee55","infy");
			//creating the statement
			Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			
			cachedRowSet = new CachedRowSetImpl();
			ResultSet resultset=statement.executeQuery("SELECT DISTINCT CustomerID from Sterling_invoice WHERE INVOICEID IN (SELECT DISTINCT INVOICEID from Sterling_payment)");
			
			cachedRowSet.populate(resultset);
			
			if(cachedRowSet.size()==0)
			{
				System.out.println("HI");
				throw new paymentNotPresent();				
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
		return cachedRowSet; 
	}
	

	/**
	 * @param customerId
	 * @param fromDate
	 * @param toDate
	 * @return CachedRowSet
	 * @throws Exception
	 */
	public CachedRowSet paymentReportMC(int customerId,String fromDate,String toDate) throws Exception       
	{
		
		CachedRowSet cachedRowSet=null;				
		Connection connection=null;
		
		try
		{
			//loading the driver
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//establishing the connection
			connection = DriverManager.getConnection ("jdbc:oracle:thin:@10.122.130.36:1521:coorg","coct07lc2j2ee55","infy");
			//creating the statement
			Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			
			cachedRowSet = new CachedRowSetImpl();
			ResultSet resultset=statement.executeQuery("SELECT SP.INVOICEID,SI.CUSTOMERID,SI.INVOICEFORMONTH,SI.INVOICEFORYEAR,SI.INVOICEDATE,SP.DATEOFPAYMENT,SI.AMOUNT FROM Sterling_payment SP,Sterling_invoice SI WHERE SP.INVOICEID=SI.INVOICEID AND SI.CUSTOMERID="+customerId+"AND SI.InvoiceDate>='"+fromDate+"'AND SI.InvoiceDate<='"+toDate+"'");
			
			cachedRowSet.populate(resultset);
			
			if(cachedRowSet.size()==0)
			{
				throw new paymentNotPresent();
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
		return cachedRowSet; 
	}
	
	/**
	 * @return CachedRowSet
	 * @throws Exception
	 */
	public CachedRowSet pendingPaymentReportCustomerID() throws Exception       
	{
		
		CachedRowSet cachedRowSet=null;				
		Connection connection=null;
		
		try
		{
			//loading the driver
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//establishing the connection
			connection = DriverManager.getConnection ("jdbc:oracle:thin:@10.122.130.36:1521:coorg","coct07lc2j2ee55","infy");
			//creating the statement
			Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			
			cachedRowSet = new CachedRowSetImpl();
			ResultSet resultset=statement.executeQuery("SELECT DISTINCT CustomerID from Sterling_invoice WHERE INVOICEID NOT IN (SELECT DISTINCT INVOICEID from Sterling_payment)");
			
			cachedRowSet.populate(resultset);
			
			if(cachedRowSet.size()==0)
			{
				throw new invoiceNotPresent();
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
		return cachedRowSet; 
	}
	
	/**
	 * @param customerId
	 * @param fromDate
	 * @param toDate
	 * @return CachedRowSet
	 * @throws Exception
	 */
	public CachedRowSet pendingPaymentReportMC(int customerId,String fromDate,String toDate) throws Exception       
	{
		
		CachedRowSet cachedRowSet=null;				
		Connection connection=null;
		
		try
		{
			//loading the driver
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//establishing the connection
			connection = DriverManager.getConnection ("jdbc:oracle:thin:@10.122.130.36:1521:coorg","coct07lc2j2ee55","infy");
			//creating the statement
			Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			
			cachedRowSet = new CachedRowSetImpl();
			ResultSet resultset=statement.executeQuery("SELECT SI.INVOICEID,SI.CUSTOMERID,SI.INVOICEFORMONTH,SI.INVOICEFORYEAR,SI.INVOICEDATE,SI.AMOUNT,SI.Description FROM Sterling_invoice SI WHERE SI.CUSTOMERID="+customerId+"AND SI.InvoiceDate>='"+fromDate+"'AND SI.InvoiceDate<='"+toDate+"'");
			
			cachedRowSet.populate(resultset);
			
			if(cachedRowSet.size()==0)
			{
				throw new paymentNotPresent();
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
		return cachedRowSet; 
	}
	
	/**
	 * @param customerId
	 * @return CachedRowSet
	 * @throws Exception
	 */
	public CachedRowSet paymentReportCustomer(int customerId) throws Exception       
	{
		
		CachedRowSet cachedRowSet=null;				
		Connection connection=null;
		
		try
		{
			//loading the driver
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//establishing the connection
			connection = DriverManager.getConnection ("jdbc:oracle:thin:@10.122.130.36:1521:coorg","coct07lc2j2ee55","infy");
			//creating the statement
			Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			
			cachedRowSet = new CachedRowSetImpl();
			ResultSet resultset=statement.executeQuery("SELECT SI.INVOICEID,SI.CUSTOMERID,SI.INVOICEFORMONTH,SI.INVOICEFORYEAR,SI.INVOICEDATE,SI.AMOUNT,SI.Description FROM Sterling_invoice SI WHERE SI.CUSTOMERID="+customerId+"AND INVOICEID NOT IN (SELECT DISTINCT INVOICEID from Sterling_payment)");
			
			cachedRowSet.populate(resultset);
			
			if(cachedRowSet.size()==0)
			{
				throw new paymentNotPresent();
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
		return cachedRowSet; 
	}
}
/**
 *	End of File ReportDB.java
 */

