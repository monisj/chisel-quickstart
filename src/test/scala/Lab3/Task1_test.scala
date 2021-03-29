package Lab3

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

class Task1_test extends FreeSpec with ChiselScalatestTester{
    "Test3" in {
        test(new Task1_Lab3){c =>
            c.io.arg_x.poke(2.U)
            c.io.arg_y.poke(8.U)
            c.io.branch.poke(1.B)
            c.io.fnct3.poke("b110".U)
            c.clock.step(500)
            
            //c.io.result.expect(1.B)
    }
    }
	
	
}