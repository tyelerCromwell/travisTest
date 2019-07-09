/* 
 * JUnit4 test class
 */

import static org.junit.Assert.assertEquals;
import org.junit.Test;

public class Calculator4Test {
      @Test
      public void testEvaluate() {
	  Calculator calculator = new Calculator();
	  int sum = calculator.evaluate("1+2+3");
	  assertEquals(6, sum);
      }
}
