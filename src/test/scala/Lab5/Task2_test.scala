package Lab5

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

class Task2_test extends FreeSpec with ChiselScalatestTester{
    "Test5" in {
        test(new Task2_Lab5(UInt(32.W),UInt(32.W))){c =>
            c.io.in.data_packet.poke(32.U)
            c.io.in.address.poke(2.U)
            c.clock.step(500)
            c.io.out.address.expect(2.U)
            c.io.out.data_packet.expect(32.U)
            
    }
    }
	
	
}