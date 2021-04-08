package Lab7

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

class Ex_test1 extends FreeSpec with ChiselScalatestTester{
    "Test7" in {
        test(new Exercise1_Lab7(3)){c =>
            c.io.in(0).bits.poke(1.U)
            c.io.in(1).bits.poke(2.U)
            c.io.in(2).bits.poke(3.U)
            c.io.in(0).valid.poke(true.B)
            c.io.in(1).valid.poke(true.B)
            c.io.in(2).valid.poke(true.B)
            c.clock.step(20)
            //c.io.out.expect(0.B)
            
    }
    }
	
}