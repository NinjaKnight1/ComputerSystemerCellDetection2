import chisel3._
import chisel3.util._

class ALU extends Module {
  val io = IO(new Bundle {
    //Define the module interface here (inputs/outputs)
    val op1 = Input(UInt(32.W))
    val op2 = Input(UInt(32.W))
    val sel = Input(UInt(2.W))
    val result = Output(UInt(32.W))
    val IsZero = Output(UInt(1.W))
  })

  io.result := 0.U

  switch(io.sel) {
    is(0.U) {io.result := io.op1 + io.op2}
    is(1.U) {io.result := io.op1 - io.op2}
  }

  io.IsZero := 0.U

  switch(io.result) {
    is(0.U) {io.IsZero := 1.U}
  }
  //Implement this module here

}