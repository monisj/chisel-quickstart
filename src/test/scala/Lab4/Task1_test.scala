package Lab4

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._
import scala.util.Random



class Task1_test extends FreeSpec with ChiselScalatestTester{
    val x = Random.nextInt(10)
    val y = Random.nextInt(10)
    val funct3= Random.nextInt(8)
    "Test4" in {
        test(new Task1_Lab4){c =>
            c.io.arg_x.poke(x.U)
            c.io.arg_y.poke(y.U)
            c.io.branch.poke(1.B)
            c.io.fnct3.poke(funct3.U)
            c.clock.step(500)
            
            //c.io.result.expect(1.B)
    }
    }
	
	
}