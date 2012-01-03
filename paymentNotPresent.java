/**
 * 
 */
package package_Exception;

/**
 * @author NikhilKanhoji_M
 *
 */
public class paymentNotPresent extends Exception {
	public static final long serialVersionUID=1L;
	public paymentNotPresent(){
		super("No Payment Report for the given duration");	
	}
}
