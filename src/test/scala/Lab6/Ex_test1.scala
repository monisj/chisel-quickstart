package Lab6

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

class Ex_test1 extends FreeSpec with ChiselScalatestTester{
    "Test6" in {
        test(new Exercise1_Lab6(4)){c =>
            c.io.in(0).poke(1.U)
            c.io.in(1).poke(2.U)
            c.io.in(2).poke(3.U)
            c.io.in(3).poke(4.U)
            c.clock.step(500)
            c.io.out.expect(4.U)
            
    }
    }
	
}