package Lab3

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

class Task1_test extends FreeSpec with ChiselScalatestTester{
    "Test3" in {
        test(new Task1_Lab3){c =>
            c.io.arg_x.poke(2.S)
            c.io.arg_y.poke(8.S)
            c.io.branch.poke(1.B)
            c.io.fnct3.poke("b110".U)
            c.io.fnct7.poke(0.U)
            c.io.Aluop.poke("b010".U)
            c.clock.step(500)
            
            //c.io.result.expect(1.B)
    }
    }
	
	
}