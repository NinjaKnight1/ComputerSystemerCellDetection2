import chisel3._
import chisel3.util._

class CPUTop extends Module {
  val io = IO(new Bundle {
    val done = Output(Bool ())
    val run = Input(Bool ())
    //This signals are used by the tester for loading and dumping the memory content, do not touch
    val testerDataMemEnable = Input(Bool ())
    val testerDataMemAddress = Input(UInt (16.W))
    val testerDataMemDataRead = Output(UInt (32.W))
    val testerDataMemWriteEnable = Input(Bool ())
    val testerDataMemDataWrite = Input(UInt (32.W))
    //This signals are used by the tester for loading and dumping the memory content, do not touch
    val testerProgMemEnable = Input(Bool ())
    val testerProgMemAddress = Input(UInt (16.W))
    val testerProgMemDataRead = Output(UInt (32.W))
    val testerProgMemWriteEnable = Input(Bool ())
    val testerProgMemDataWrite = Input(UInt (32.W))
  })

  //Creating components
  val programCounter = Module(new ProgramCounter())
  val dataMemory = Module(new DataMemory())
  val programMemory = Module(new ProgramMemory())
  val registerFile = Module(new RegisterFile())
  val controlUnit = Module(new ControlUnit())
  val alu = Module(new ALU())

  //Connecting the modules
  programCounter.io.run := io.run
  programMemory.io.address := programCounter.io.programCounter

  ////////////////////////////////////////////
  //Continue here with your connections
  ////////////////////////////////////////////
  controlUnit.io.opCode := programMemory.io.instructionRead(31,26)

  //Register file section
  registerFile.io.writeEnable := controlUnit.io.regWriteEnable
  registerFile.io.writeSel := programMemory.io.instructionRead(25,21)
  registerFile.io.aSel := programMemory.io.instructionRead(20,16)

  val bSelResult = Mux(controlUnit.io.regChange, programMemory.io.instructionRead(25,21), programMemory.io.instructionRead(19,15))
  registerFile.io.bSel := bSelResult

  val memOrALU = Mux(controlUnit.io.fromMem, dataMemory.io.dataRead, alu.io.result)

  val regIm = Mux(controlUnit.io.isIm, programMemory.io.instructionRead(15,0), memOrALU)
  registerFile.io.writeData := regIm

  //ALU section
  alu.io.sel := controlUnit.io.ALUopr

  alu.io.op1 := registerFile.io.a

  val bALU = Mux(controlUnit.io.isImALU, programMemory.io.instructionRead(15,0), registerFile.io.b)
  alu.io.op2 := bALU

  //Data Memory section
  dataMemory.io.writeEnable := controlUnit.io.memWriteEnable

  dataMemory.io.address := registerFile.io.a
  dataMemory.io.dataWrite := registerFile.io.b

  //PC section
  val eqJump = controlUnit.io.branchCond & alu.io.isZero

  val finalJump = eqJump | controlUnit.io.branch

  programCounter.io.branch := finalJump

  programCounter.io.END := controlUnit.io.END

  programCounter.io.run := io.run

  programCounter.io.jumpAddress := programMemory.io.instructionRead(15,0)
  //CPU section
  io.done := controlUnit.io.END

  
  //This signals are used by the tester for loading the program to the program memory, do not touch
  programMemory.io.testerAddress := io.testerProgMemAddress
  io.testerProgMemDataRead := programMemory.io.testerDataRead
  programMemory.io.testerDataWrite := io.testerProgMemDataWrite
  programMemory.io.testerEnable := io.testerProgMemEnable
  programMemory.io.testerWriteEnable := io.testerProgMemWriteEnable
  //This signals are used by the tester for loading and dumping the data memory content, do not touch
  dataMemory.io.testerAddress := io.testerDataMemAddress
  io.testerDataMemDataRead := dataMemory.io.testerDataRead
  dataMemory.io.testerDataWrite := io.testerDataMemDataWrite
  dataMemory.io.testerEnable := io.testerDataMemEnable
  dataMemory.io.testerWriteEnable := io.testerDataMemWriteEnable
}