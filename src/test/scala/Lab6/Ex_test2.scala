package Lab6

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

class Ex_test2 extends FreeSpec with ChiselScalatestTester{
    "Test6" in {
        test(new Exercise2_Lab6(16)){c =>
            c.clock.step(500)
            c.io.out.expect(4.U)
            
    }
    }
	
}