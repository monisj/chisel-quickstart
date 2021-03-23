package Lab2

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

class Ex_test3 extends FreeSpec with ChiselScalatestTester{
    "Test2" in {
        test(new Exercise3_Lab2){c =>
            c.io.in0.poke(0.B)
            c.io.in1.poke(1.B)
            c.io.in2.poke(0.B)
            c.io.in3.poke(0.B)
            c.clock.step(500)
            
            //c.io.result.expect(1.B)
    }
    }
	
	
}