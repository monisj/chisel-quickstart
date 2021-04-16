package Lab8
import chisel3._
import chisel3.util._

class Mem_IO (width : Int = 8) extends Bundle {
    val enable = Input ( Bool () )
    val write = Input ( Bool () )
    val addr = Input ( UInt (10.W))
    val mask = Input ( Vec (4 , Bool()))
    val dataIn = Input ( Vec (4 , UInt (width.W)))
    val dataOut = Output ( Vec (4 , UInt ( width.W)))
}

class Exercise1_Lab8(width : Int = 8) extends Module {
    val io = IO ( new Mem_IO (width))
    val mem = SyncReadMem (1024,Vec (4 ,UInt (width.W)))
    val mask_mem = Reg(Vec(4,UInt()))

    val bits = Cat(io.mask(3),io.mask(2),io.mask(1),io.mask(0))        //Here a concatination was made of 4bits of mask to simulate
    when(io.write){                                                    //The Behavior of tradition mask of SyncRead mem
        switch(bits){
            is(1.U){
                mask_mem(0):=io.dataIn(0)
                mask_mem(1):=0.U
                mask_mem(2):=0.U
                mask_mem(3):=0.U
                mem.write(io.addr,mask_mem)
            }
            is(2.U){
                mask_mem(0):=0.U
                mask_mem(1):=io.dataIn(1)
                mask_mem(2):=0.U
                mask_mem(3):=0.U
                mem.write(io.addr,mask_mem)
            }
            is(3.U){
                mask_mem(0):=io.dataIn(0)
                mask_mem(1):=io.dataIn(1)
                mask_mem(2):=0.U
                mask_mem(3):=0.U
                mem.write(io.addr,mask_mem)
            }
            is(4.U){
                mask_mem(0):=0.U
                mask_mem(1):=0.U
                mask_mem(2):=io.dataIn(2)
                mask_mem(3):=0.U
                mem.write(io.addr,mask_mem)
            }
            is(5.U){
                mask_mem(0):=io.dataIn(0)
                mask_mem(1):=0.U
                mask_mem(2):=io.dataIn(2)
                mask_mem(3):=0.U
                mem.write(io.addr,mask_mem)
            }
            is(6.U){
                mask_mem(0):=0.U
                mask_mem(1):=io.dataIn(1)
                mask_mem(2):=io.dataIn(2)
                mask_mem(3):=0.U
                mem.write(io.addr,mask_mem)
            }
            is(7.U){
                mask_mem(0):=io.dataIn(0)
                mask_mem(1):=io.dataIn(1)
                mask_mem(2):=io.dataIn(2)
                mask_mem(3):=0.U
                mem.write(io.addr,mask_mem)
            }
            is(8.U){
                mask_mem(0):=0.U
                mask_mem(1):=0.U
                mask_mem(2):=0.U
                mask_mem(3):=io.dataIn(3)
                mem.write(io.addr,mask_mem)
            }
            is(9.U){
                mask_mem(0):=io.dataIn(0)
                mask_mem(1):=0.U
                mask_mem(2):=0.U
                mask_mem(3):=io.dataIn(3)
                mem.write(io.addr,mask_mem)
            }
            is(10.U){
                mask_mem(0):=0.U
                mask_mem(1):=io.dataIn(1)
                mask_mem(2):=0.U
                mask_mem(3):=io.dataIn(3)
                mem.write(io.addr,mask_mem)
            }
            is(11.U){
                mask_mem(0):=io.dataIn(0)
                mask_mem(1):=io.dataIn(1)
                mask_mem(2):=0.U
                mask_mem(3):=io.dataIn(3)
                mem.write(io.addr,mask_mem)
            }
            is(12.U){
                mask_mem(0):=0.U
                mask_mem(1):=0.U
                mask_mem(2):=io.dataIn(2)
                mask_mem(3):=io.dataIn(3)
                mem.write(io.addr,mask_mem)
            }
            is(13.U){
                mask_mem(0):=io.dataIn(0)
                mask_mem(1):=0.U
                mask_mem(2):=io.dataIn(2)
                mask_mem(3):=io.dataIn(3)
                mem.write(io.addr,mask_mem)
            }
            is(14.U){
                mask_mem(0):=0.U
                mask_mem(1):=io.dataIn(1)
                mask_mem(2):=io.dataIn(2)
                mask_mem(3):=io.dataIn(3)
                mem.write(io.addr,mask_mem)
            }
            is(15.U){
                mask_mem(0):=io.dataIn(0)
                mask_mem(1):=io.dataIn(1)
                mask_mem(2):=io.dataIn(2)
                mask_mem(3):=io.dataIn(3)
                mem.write(io.addr,mask_mem)
            }
            
        }
    }
    io.dataOut:=mem.read(io.addr,io.enable)
}