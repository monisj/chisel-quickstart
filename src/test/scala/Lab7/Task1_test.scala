package Lab7

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

class Task1_test extends FreeSpec with ChiselScalatestTester{
    "Test7" in {
        test(new Task1_Lab7){c =>
            c.io.f1.poke(true.B)
            c.io.f2.poke(true.B)
            c.io.r1.poke(false.B)
            c.io.r2.poke(true.B)
            c.clock.step(10)
            c.io.out.expect(3.U)
            
    }
    }
	
}