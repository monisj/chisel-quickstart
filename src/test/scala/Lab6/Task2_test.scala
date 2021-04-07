package Lab6

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

class Task2_test extends FreeSpec with ChiselScalatestTester{
    "Test6" in {
        test(new Task2_Lab6(4)){c =>
            c.io.in.poke(8.U)
            c.clock.step(8)
            c.io.out.expect(1.B)
            
    }
    }
	
}