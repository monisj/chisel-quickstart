package Lab6

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

class Ex_test4 extends FreeSpec with ChiselScalatestTester{
    "Test6" in {
        test(new Exercise4_Lab6){c =>
            c.io.in.valid.poke(true.B)
            c.io.in.bits.poke(2.U)  
            c.io.out.ready.poke(true.B)
            c.clock.step(10)
            //c.io.out.bits.expect(1.U)
            //c.io.out.valid.expect(true.B)
            
    }
    }
	
}