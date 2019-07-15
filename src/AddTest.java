import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.*;

public class AddTest {
    
    Add a;
   
    @BeforeEach
    public void init() {
        a = new Add();
    }

    @Test
    public void test1() {
        int sum = a.add(1,2);
        assertEquals(3, sum);
    }

    @Test
    public void test2() {
        int sum = a.add(4,5);
        assertEquals(9, sum);
    }

}
