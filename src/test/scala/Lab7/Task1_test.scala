package Lab7

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

class Task1_test extends FreeSpec with ChiselScalatestTester{
    "Test7" in {
        test(new Task1_Lab7){c =>
            c.io.in.poke(true.B)
            c.clock.step(20)
            c.io.out.expect(true.B)
            
    }
    }
	
}