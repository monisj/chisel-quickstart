package Lab2

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

class Ex_test2 extends FreeSpec with ChiselScalatestTester{
    "Test2" in {
        test(new Exercise2_Lab2){c =>
            c.io.in0.poke(2.U)
            c.io.in1.poke(4.U)
            c.io.in2.poke(8.U)
            c.io.in3.poke(10.U)
            c.io.in4.poke(12.U)
            c.io.in5.poke(14.U)
            c.io.in6.poke(1.U)
            c.io.in7.poke(3.U)
            c.io.sel.poke(2.U)
            c.io.sel_mux.poke(1.U)
            c.clock.step(500)
            
            //c.io.result.expect(1.B)
    }
    }
	
	
}