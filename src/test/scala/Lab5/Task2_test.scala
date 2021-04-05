package Lab5

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

class Task2_test extends FreeSpec with ChiselScalatestTester{
    "Test5" in {
        test(new Task2_Lab5(UInt(32.W))){c =>
            c.io.in.poke(32.U)
            c.io.address.poke(2.U)
            c.io.sel.poke(0.B)
            c.clock.step(500)
            c.io.out.expect(2.U)
            
    }
    }
	
	
}