package Lab2

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

class Ex_test1 extends FreeSpec with ChiselScalatestTester{
    "Test2" in {
        test(new Exercise1_Lab2){c =>
            c.io.in_A.poke(32.U)
            c.io.in_B.poke(16.U)
            c.io.select.poke(1.B)
            c.clock.step(500)
            
            //c.io.result.expect(1.B)
    }
    }
	
	
}