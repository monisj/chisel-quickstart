package Lab7
import chisel3._
import chisel3.util._
import chisel3.experimental.ChiselEnum

class Detect_Seq extends Bundle {
    val in = Input ( Bool () )
    val out = Output ( Bool () )
    
}

class Task1_Lab7 extends Module {
    val io = IO (new Detect_Seq)
    val s0 :: s1 :: s2 :: Nil = Enum (3)
    val state = RegInit ( s0 )

    io.out:=(state===s0)&(io.in)
    switch ( state ){
        is ( s0 ) {
            when ( io . in ) {
                state := s1
            }
        }
        is ( s1 ) {
            when ( !io . in ) {
                state := s2
            } .otherwise {
                state := s0
            }
        }
        is ( s2 ) {
            when (! io . in ) {
                state := s0
            }
        }
    }
}