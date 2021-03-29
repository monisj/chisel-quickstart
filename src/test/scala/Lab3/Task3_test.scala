package Lab3

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

class Task3_test extends FreeSpec with ChiselScalatestTester{
    "Test3" in {
        test(new Task3_Lab3){c =>
            c.io.in.poke("b11".U)
            c.clock.step(500)
            
            //c.io.result.expect(1.B)
    }
    }
	
	
}