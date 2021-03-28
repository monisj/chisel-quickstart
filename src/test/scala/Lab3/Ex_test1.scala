package Lab3

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

class Ex_test1 extends FreeSpec with ChiselScalatestTester{
    "Test3" in {
        test(new Exercise1_Lab3){c =>
            c.io.in.poke(2.U)
            c.io.out.expect(1.U)
            c.clock.step(500)
            
            //c.io.result.expect(1.B)
    }
    }
	
	
}