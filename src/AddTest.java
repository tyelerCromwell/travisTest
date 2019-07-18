import static org.junit.Assert.*;
import org.junit.Test;

public class AddTest {
  
    @Test
    public void test1() {
        int sum = Add.add(1,2);
        if (sum != 3)
            fail("Wrong, the correct output should be 3 but it was " + sum);
       // assertEquals(3, sum);
    }

    @Test
        public void test2() {
            int sum = Add.add(4,5);
            // assertEquals(9, sum);
            fail("Wrong, the correct output should be 3 but it was " + sum);

        }

}
