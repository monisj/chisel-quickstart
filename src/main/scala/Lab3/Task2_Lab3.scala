package Lab3
import chisel3 . _
import chisel3 . util . _


class LM_IO_Interface_ImmdValGen extends Bundle {
    val Instruction = Input (UInt(32.W))
	val PC=Input(UInt(32.W))
    val immd_se = Output (SInt(32.W))
}

class Task2_Lab3 extends Module {
    val io = IO ( new LM_IO_Interface_ImmdValGen )

	val opcode =io.Instruction(6,0)

	val sbt1 = io.Instruction(31,20)
	val output = Cat(Fill(19,sbt1(11)),sbt1)
	val output1 = output.asSInt 
	val I_Immediate = output1

	val sbt2 = io.Instruction(11,7)
	val sbt3 = io.Instruction(31,25)
	val sbt4 = Cat(sbt3,sbt2)
	val output2 = Cat(Fill(19,sbt4(11)),sbt4)
	val output3 = output2.asSInt
	val S_Immediate = output3

	val sbt5 = io.Instruction(31,12)
	val sbt6 = Cat(Fill(11,sbt5(19)),sbt5)
	val sbt7 = sbt6 << "hc".U
	val output4 = sbt7.asSInt
	val U_Immediate = output4 

	val sbt8 = io.Instruction(7)
	val sbt9 = io.Instruction(11,8)
	val sbt10 = io.Instruction(30,25)
	val sbt11 = io.Instruction(31)
	val sbt12 = Cat(sbt11,sbt8,sbt10,sbt9,"b0".U)
	val sbt13 = Cat(Fill(19,sbt12(12)),sbt12)
	val output5 = sbt13 + io.PC
	val output6 = output5.asSInt
	val SB_Immediate = output6

	val sbt14 = io.Instruction(19,12)
	val sbt15 = io.Instruction(20)
	val sbt16 = io.Instruction(30,21)
	val sbt17 = io.Instruction(31)
	val sbt18 = Cat(sbt17,sbt14,sbt15,sbt16,0.U)
	val sbt19 = Cat(Fill(11,sbt18(20)),sbt18)
	val output8 = sbt19 +io.PC
	val output9 = output8.asSInt
	val UJ_Immediate = output9
io.immd_se:=0.S
when(opcode === 35.U){
	io.immd_se := S_Immediate
}.elsewhen(opcode === 99.U){
	io.immd_se := SB_Immediate
}.elsewhen(opcode === 111.U){
	io.immd_se := UJ_Immediate
}.elsewhen(opcode === 23.U){
	io.immd_se:= UJ_Immediate
}.elsewhen(( opcode === 19.U) || (opcode === 27.U) || (opcode === 115.U)){ 
	io.immd_se:= I_Immediate
}
    
}