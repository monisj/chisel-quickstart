package Lab4

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._
import scala.util.Random



class Task1_test extends FreeSpec with ChiselScalatestTester{
    "Test4" in {
        test(new Task1_Lab4) { c =>
    val array_funct3 = Array(0,1,4,6,5,7)
      for ( i <- 0 until 100) {
            val a = Random.nextLong () & 0xFFFFFFFFL
            val b = Random.nextLong () & 0xFFFFFFFFL
            val branch = Random.nextBoolean()
            val ff = Random.nextInt (5)
            val funct3 = array_funct3(ff)
            val result = funct3 match {
              case 0 => if (a == b) 1 else 0
              case 1 => if (a != b) 1 else 0
              case 4 => if (a < b) 1 else 0
              case 6 => if (a < b) 1 else 0
              case 5 => if (a >= b) 1 else 0
              case 7 => if (a >= b) 1 else 0
              case _ => 0
            }
        

        c.io.arg_x.poke(a.U)
        c.io.arg_y.poke(b.U)
        c.io.fnct3.poke(funct3.U)
        c.io.branch.poke(branch.B)
        c.clock.step(500)
        if (branch) c.io.br_taken.expect(result.B)
        else c.io.br_taken.expect(0.B)
	
	
}}}}