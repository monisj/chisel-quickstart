package Lab6

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

class Ex_test4 extends FreeSpec with ChiselScalatestTester{
    "Test6" in {
        test(new Exercise4_Lab6){c =>
            c.io.in.valid.poke(1.B)
            c.io.in.bits.poke(1.U)  
            c.clock.step(5)
            c.io.out.bits.expect(1.U)
            c.io.out.valid.expect(1.B)
            
    }
    }
	
}