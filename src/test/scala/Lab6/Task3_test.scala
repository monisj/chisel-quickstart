package Lab6

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

class Task3_test extends FreeSpec with ChiselScalatestTester{
    "Test6" in {
        test(new Task3_Lab6(4)){c =>
            c.io.load_in(0).poke(1.B)
            c.io.load.poke(0.B)  
            c.clock.step(5)
            c.io.out(0).expect(1.B)
            //c.io.out(1).expect(1.U)
            
    }
    }
	
}