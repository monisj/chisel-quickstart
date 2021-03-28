package Lab3

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

class Task2_test extends FreeSpec with ChiselScalatestTester{
    "Test3" in {
        test(new Task2_Lab3){c =>
            c.io.Instruction.poke("b100000000000100010011".U)
            c.io.PC.poke(4.U)
            c.clock.step(500)
            
            //c.io.result.expect(1.B)
    }
    }
	
	
}