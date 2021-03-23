package Lab2

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

class Task1_test extends FreeSpec with ChiselScalatestTester{
    "Test2" in {
        test(new Task1_Lab2){c =>
            c.io.s0.poke(1.B)
            c.io.s1.poke(0.B)
            c.io.s2.poke(1.B)
            c.clock.step(500)
            
            //c.io.result.expect(1.B)
    }
    }
	
	
}