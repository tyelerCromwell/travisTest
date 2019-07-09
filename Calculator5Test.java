/* 
 * JUnit5 test class
 */

import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.*;

public class Calculator5Test {
    Calculator calculator;

    @BeforeEach
        public void init() {
            calculator = new Calculator();
        }

    @Test
        public void testEvaluate() {
            int sum = calculator.evaluate("1+2+3");
            assertEquals(6, sum);
        }
    @Test
        public void testEvaluate2() {
            int sum = calculator.evaluate("3 + 4 + 5");
            assertEquals(12, sum);
        }

}
