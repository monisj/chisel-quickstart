package Lab2

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

class Task2_test extends FreeSpec with ChiselScalatestTester{
    "Test2" in {
        test(new Task2_Lab2){c =>
            c.io.in(0).poke(1.B)
            c.io.in(1).poke(0.B)
            c.io.in(2).poke(0.B)
            c.io.in(3).poke(1.B)
            c.io.sel(0).poke(1.B)
            c.io.sel(1).poke(0.B)
            c.io.shift_type.poke(1.B)
            c.clock.step(500)

            //c.io.result.expect(1.B)
    }
    }
	
	
}