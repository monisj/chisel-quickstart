package Lab5

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

class Task1_test extends FreeSpec with ChiselScalatestTester{
    "Test5" in {
        test(new Task1_Lab5(32)){c =>
            c.io.in_0.poke(8.U)
            c.io.in_1.poke(2.U)
            c.clock.step(500)
            c.io.sum_out.expect(10.U)
            
    }
    }
	
	
}