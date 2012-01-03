/**
 * 
 */
package package_Exception;

/**
 * @author NikhilKanhoji_M
 *
 */
public class invoiceNotPresent extends Exception {
		public static final long serialVersionUID=1L;
		public invoiceNotPresent(){
			super("No Invoice present for Given Duration");	
		}
	}
