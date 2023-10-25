import chisel3._
import chisel3.util._

class RegisterFile extends Module {
  val io = IO(new Bundle {
    //Define the module interface here (inputs/outputs)
    val aSel = Input(UInt(3.W))
    val bSel = Input(UInt(3.W))
    val writeData = Input(UInt(32.W))
    val writeSel = Input(UInt(3.W))
    val writeEnable = Input(UInt(1.W))
    val a = Output(UInt(32.W))
    val b = Output(UInt(32.W))
  })

  //Implement this module here

  val R0 = UInt(32.W)
  val R1 = UInt(32.W)
  val R2 = UInt(32.W)
  val R3 = UInt(32.W)
  val R4 = UInt(32.W)
  val R5 = UInt(32.W)
  val R6 = UInt(32.W)
  val R7 = UInt(32.W)

  switch(io.aSel) {
    is(0.U) { io.a := R0 }
    is(1.U) { io.a := R1 }
    is(2.U) { io.a := R2 }
    is(3.U) { io.a := R3 }
    is(4.U) { io.a := R4 }
    is(5.U) { io.a := R5 }
    is(6.U) { io.a := R6 }
    is(7.U) { io.a := R7 }
  }

  switch(io.bSel) {
    is(0.U) { io.b := R0 }
    is(1.U) { io.b := R1 }
    is(2.U) { io.b := R2 }
    is(3.U) { io.b := R3 }
    is(4.U) { io.b := R4 }
    is(5.U) { io.b := R5 }
    is(6.U) { io.b := R6 }
    is(7.U) { io.b := R7 }
  }

  switch(io.writeEnable) {
    is(1.U) {
      switch(io.writeSel) {
        is(0.U) { R0 := io.writeData }
        is(1.U) { R1 := io.writeData }
        is(2.U) { R2 := io.writeData }
        is(3.U) { R3 := io.writeData }
        is(4.U) { R4 := io.writeData }
        is(5.U) { R5 := io.writeData }
        is(6.U) { R6 := io.writeData }
        is(7.U) { R7 := io.writeData }
      }
    }
  }
}