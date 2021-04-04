package Lab5

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

class Ex_test3 extends FreeSpec with ChiselScalatestTester{
    "Test5" in {
        test(new Exercise3_Lab5(2,UInt(4.W))(_+_)){c =>
            c.io.in(0).poke(8.U)
            c.io.in(1).poke(2.U)
            c.clock.step(500)
            c.io.out.expect(10.U)
            
    }
    }
	
	
}