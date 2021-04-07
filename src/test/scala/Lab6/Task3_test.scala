package Lab6

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

class Task3_test extends FreeSpec with ChiselScalatestTester{
    "Test6" in {
        test(new Task3_Lab6(4)){c =>
            c.io.in.poke(13.U)
            //c.io.load.poke(0.B) Uncomment for parallel
            c.io.load.poke(1.B)  //Comment for Serial
            c.clock.step(5)
            //c.io.out_Parallel.expect(13.U)  //Uncomment for Parallel
            c.io.out_Serial.expect(0.B) //Comment for serial
            
    }
    }
	
}