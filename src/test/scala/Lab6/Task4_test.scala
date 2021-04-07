package Lab6

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

class Task4_test extends FreeSpec with ChiselScalatestTester{
    "Test6" in {
        test(new Task4_Lab6(5)){c =>
            c.io.up_down.poke(0.B)  
            c.clock.step(5)
            c.io.out.expect(0.U)
            
    }
    }

	
}