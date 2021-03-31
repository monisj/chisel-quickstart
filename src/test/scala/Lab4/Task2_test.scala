package Lab4

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._
//import chisel3.iotesters.{Driver , PeekPokeTester}
import scala.util.Random
import PC_Codes._
import Instruction._
    


class Task2_test extends FreeSpec with ChiselScalatestTester{
        val PC_array = Array(PC_0,PC_4,PC_8,PC_12,PC_16,PC_20)
        val Instruction_array = Array(In1,In2,In3,In4,In5,In6)
        val opr = Random.nextInt(6)
        val PC = PC_array ( opr )
        val Instruction = Instruction_array (opr)

    "Test4" in {
        test(new Task2_Lab4){c =>
            c.io.Instruction.poke(Instruction)
            c.io.PC.poke(PC)
            c.clock.step(500)
            
            //c.io.result.expect(1.B)
    }
    }
	
	
}