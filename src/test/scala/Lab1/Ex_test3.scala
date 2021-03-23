package Lab1

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

class Ex_test3 extends FreeSpec with ChiselScalatestTester{
    "Test1" in {
        test(new Exercise3(3,6)){c =>
            c.clock.step(500)
            //c.io.in.poke(1.U)
            //c.io.result.expect(1.B)
    }
    }
	
	
}