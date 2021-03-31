package Lab3

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

class Ex_test2 extends FreeSpec with ChiselScalatestTester{
    "Test3" in {
        test(new Exercise2_Lab3){c =>
            c.io.A.poke(8.S)
            c.io.B.poke(2.S)
            c.io.Aluop.poke("b10101".U)
            c.clock.step(500)
            c.io.x.expect(1.S)
            
            //c.io.result.expect(1.B)
    }
    }
	
	
}