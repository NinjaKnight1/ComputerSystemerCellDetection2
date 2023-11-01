import chisel3._
import chisel3.util._

class ALU extends Module {
  val io = IO(new Bundle {
    //Define the module interface here (inputs/outputs)
    val op1 = Input(UInt(32.W))
    val op2 = Input(UInt(32.W))
    val sel = Input(UInt(1.W))
    val result = Output(UInt(32.W))
    val isZero = Output(Bool ())
  })

  //Implement this module here
  io.result := 0.U

  switch(io.sel) {
    is(0.U) {io.result := io.op1 + io.op2}
    is(1.U) {io.result := io.op1 - io.op2}
  }

  io.isZero := 0.U
  
  when(io.result === 0.U){
    io.isZero := 1.U
  }

}