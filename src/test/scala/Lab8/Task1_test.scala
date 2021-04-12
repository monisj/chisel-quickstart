package Lab8

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

class Task1_test extends FreeSpec with ChiselScalatestTester{
    "Test8" in {
        test(new Task1_Lab8){c =>
            c.io.Writeaddr.poke(0.U)
            c.io.Readaddr.poke(0.U)
            c.io.requestor(0).bits.poke(0.U)
            c.io.requestor(1).bits.poke(1.U)
            c.io.requestor(2).bits.poke(2.U)
            c.io.requestor(3).bits.poke(3.U)
            c.io.requestor(0).valid.poke(true.B)
            c.io.requestor(1).valid.poke(true.B)
            c.io.requestor(2).valid.poke(true.B)
            c.io.requestor(3).valid.poke(true.B)
            //c.io.memory_out(0).expect(2.U)
            c.clock.step(3)
            
            
    }
    }
	
}