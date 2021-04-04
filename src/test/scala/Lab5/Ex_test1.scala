package Lab5

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

class Ex_test1 extends FreeSpec with ChiselScalatestTester{
    "Test5" in {
        test(new Exercise1_Lab5){c =>
            c.io.A.poke(8.S)
            c.io.B.poke(2.S)
            c.io.Aluop.poke("b01001".U)
            c.clock.step(500)
            c.io.x.expect(16.S)
            
    }
    }
	
	
}