package Lab8

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

class Ex_test3 extends FreeSpec with ChiselScalatestTester{
    "Test8" in {
        test(new Exercise3_Lab8){c =>
            c.io.addr.poke(4.U)
            //c.io.dataOut(0).expect(2.U)
            c.clock.step(3)
            
            
    }
    }
	
}