package Lab5

import chisel3._
import chisel3.util._
import org.scalatest._
import chiseltest._

class Ex_test2 extends FreeSpec with ChiselScalatestTester{
    "Test5" in {
        test(new Exercise2_Lab5(UInt(32.W))){c =>
            c.io.in_1.poke(8.U)
            c.io.in_2.poke(2.U)
            c.io.sel_in.poke(1.B)
            c.clock.step(500)
            c.io.out.expect(2.U)
            
    }
    }
	
}
