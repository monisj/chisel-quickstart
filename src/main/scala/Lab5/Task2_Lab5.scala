package Lab5
import chisel3._
import chisel3.util._

class Transaction_In [T <: Data ](gen1: T) extends Bundle

class Transaction_Out [T <:Data ](gen2:T) extends Bundle

class Router [ T <: Data ]( gen : T ) extends Module {

}