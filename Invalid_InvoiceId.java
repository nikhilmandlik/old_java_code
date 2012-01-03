/**
 * 
 */
package package_Exception;

/**
 * @author NikhilKanhoji_M
 *
 */
public class Invalid_InvoiceId extends Exception{

	public static final long serialVersionUID=1L;
	public Invalid_InvoiceId(){
		super("Invalid Invoice ID:Invoice does not exist");
		
	}
}
