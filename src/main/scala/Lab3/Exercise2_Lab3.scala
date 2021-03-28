package Lab3
import chisel3._
import chisel3.util._

class Exercise2_Lab3 extends Module{
	val io=IO(new Bundle{
		val A=Input(SInt(32.W))
		val B=Input(SInt(32.W))
		val x=Output(SInt(32.W))
		val AluBranch = Output(Bool())
		val Aluop=Input(UInt(5.W))
		
			
	})
		io.x := 0.S
		switch ( io.Aluop ) {
        is ( "b00000".U ) {
            io.x:=io.A+io.B
        }
        is ("b01001".U){
  			 io.x:=io.A * io.B          
        }
        is ("b00001".U) {
            val sbt = io.A
			val sbt3 = io.B(4,0)
			val sbt4 = sbt << sbt3
			val sbt5 = sbt4
			io.x := sbt5
        }
        is ("b11111".U) {
            io.x:=io.A
        }
        is ("b00010".U) {
            when(io.A < io.B){
			io.x := 1.S
			}.otherwise{
			io.x := 0.S
			}
        }
        is ("b00011".U) {
            val a1 = io.A
			val b1 = io.B
			when(a1 < b1){
				io.x := 1.S
			}.otherwise{
				io.x := 0.S
			}
        }
        is ("b10110".U) {
            val a1 = io.A
			val b1 = io.B
			when(a1 < b1){
				io.x := 1.S
			}.otherwise{
				io.x := 0.S
			}
        }
        is ("b00100".U) {
            io.x := io.A ^ io.B
        }
        is ("b00101".U) {
            val shift = io.A >> io.B(4,0)
		    io.x := shift
        }
        is ("b01101".U) {
            val shift = io.A >> io.B(4,0)
		    io.x := shift
        }
        is ("b00110".U){
            io.x := io.A | io.B
        }
		is ("b00111".U) {
            io.x := io.A & io.B
        }
        is ("b01000".U){
            io.x := io.A - io.B
        }
		is ("b10000".U){
           when(io.A === io.B){
				io.x := 1.S
			}.otherwise{
				io.x := 0.S
			} 
        }
        is ("b10001".U){
            when(io.A === io.B){
				io.x := 1.S
			}.otherwise{
				io.x := 0.S
			}
        }
        is ("b10100".U) {
            when(io.A < io.B){
				io.x := 1.S
			}.otherwise{
				io.x := 0.S
			}
        }
        is ("b10101".U) {
            when(io.A >= io.B){
				io.x := 1.S
			}.otherwise{
				io.x := 0.S
			}
        }
		is ("b10111".U) {
            val a3 = io.A.asUInt
			val b3 = io.B.asUInt
			when(a3 >= b3){
				io.x := 1.S
			}.otherwise{
				io.x := 0.S
			}
        }
	}
		when(io.Aluop(4,3) === "b10".U && io.x === 1.S){
		io.AluBranch := 1.B
		}.otherwise{
		io.AluBranch := 0.B
		}	

		
}		
