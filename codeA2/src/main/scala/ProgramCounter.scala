import chisel3._
import chisel3.util._

class ProgramCounter extends Module {
  val io = IO(new Bundle {
    val stop = Input(Bool())
    val jump = Input(Bool())
    val run = Input(Bool())
    val programCounterJump = Input(UInt(16.W))
    val programCounter = Output(UInt(16.W))
  })

  //Implement this module here (respect the provided interface, since it used by the tester)
  val notRun = !io.run
  val notRunOrStop = notRun || io.stop

  val programCounter1 = io.programCounter + 1.U

  val result1 = Mux(io.jump, io.programCounterJump, programCounter1)

  val result2 = Mux(notRunOrStop ,io.programCounter, result1)
  val reg1 = RegInit(0.U(16.W))
  reg1 := result2
  io.programCounter := reg1
}