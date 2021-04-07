package Lab6

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

class Ex_test3 extends FreeSpec with ChiselScalatestTester{
    "Test6" in {
        test(new Exercise3_Lab6(8)){c =>
            c.io.in.poke(12.U)
            c.clock.step(9)
            c.io.clock_High.expect(0.B)
            
            
    }
    }
	
}