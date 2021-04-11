package Lab8

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

class Ex_test2 extends FreeSpec with ChiselScalatestTester{
    "Test8" in {
        test(new Exercise2_Lab8){c =>
            c.io.enable.poke(true.B)
            c.io.write.poke(true.B)
            c.io.wrAddr.poke(0.U)
            c.io.rdAddr.poke(0.U)
            c.io.addr.poke(0.U)
            c.io.mask(0).poke(true.B)
            c.io.dataIn(0).poke(2.U)
            //c.io.dataOut(0).expect(2.U)
            c.clock.step(3)
            
            
    }
    }
	
}