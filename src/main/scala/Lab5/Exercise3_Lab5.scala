package Lab5
import chisel3._
import chisel3.util._

class Exercise3_Lab5 [ T <: Data ]( n : Int , generic : T ) ( op : (T , T ) => T ) extends Module {
    require ( n > 0) // " reduce only works on non - empty Vecs "
        val io = IO ( new Bundle {
            val in = Input ( Vec (n , generic ))
            val out = Output (generic)
        })
        io.out := io.in.reduce(op)
}