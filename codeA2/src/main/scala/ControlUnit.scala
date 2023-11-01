import chisel3._
import chisel3.util._

class ControlUnit extends Module {
  val io = IO(new Bundle {
    //Define the module interface here (inputs/outputs)
    val opCode = Input(UInt(6.W))

    val isIm = Output(UInt(1.W))
    val ALUopr = Output(UInt(1.W))
    val isImALU = Output(UInt(1.W))
    val branchCond = Output(UInt(1.W))
    val regChange = Output(UInt(1.W))
    val branch = Output(Bool ())
    val END = Output(Bool ())
    val memWriteEnable = Output(Bool ())
    val fromMem = Output(UInt(1.W))
    val regWriteEnable = Output(UInt(1.W))

  })

  //Implement this module here
  val im = Cat(io.opCode(0), io.opCode(1))
  val cat = Cat(io.opCode(2), io.opCode(3))
  val op = Cat(io.opCode(4), io.opCode(5))

  io.isIm := 0.U
  io.ALUopr := 0.U
  io.isImALU := 0.U
  io.branchCond := 0.U
  io.regChange := 0.U
  io.branch := 0.U
  io.END := 0.U
  io.memWriteEnable := 0.U
  io.fromMem := 0.U
  io.regWriteEnable := 0.U

  switch(im){
    is(0.U){/*No operation*/}
    is(1.U){
      //Not immediate
      switch(cat){
        is(1.U){
          //Arithmetic operation
          io.regWriteEnable := 1.U
          switch(op){
            is(1.U){
              /*Addition (ADD)*/
              io.ALUopr := 0.U
            }
            is(2.U){
              /*Subtraction (SUB)*/
              io.ALUopr := 1.U
            }
          }
        }
        is(2.U){
          //Data operation
          io.regChange := 1.U
          switch(op){
            is(1.U){
              /*Load data (LD)*/
              io.regWriteEnable := 1.U
              io.fromMem := 1.U
            }
            is(2.U){
              /*Store data (SD)*/
              io.memWriteEnable := 1.U
            }
          }
        }
      }
    }
    is(2.U){
      //Immediate
      switch(cat){
        is(1.U){
          //Arithmetic operation
          io.isImALU := 1.U
          io.regWriteEnable := 1.U
          switch(op){
            is(1.U){
              /*Immediate Addition (ADDI)*/
              io.ALUopr := 0.U
            }
            is(2.U){
              /*Immediate Subtraction (SUBI)*/
              io.ALUopr := 1.U
            }
          }
        }
        is(2.U){
          //Load immediate (LI)
          io.regWriteEnable := 1.U
          io.isIm := 1.U
        }
      }
    }
    is(3.U){
      switch(op){
        is(1.U){
          /*Jumping to branch (BRANCH)*/
          io.branch := 1.U
        }
        is(2.U){
          /*If it is zero (BEQ)*/
          io.regChange := 1.U
          io.branchCond := 1.U
        }
        is(3.U){
          /*End execution (END)*/
          io.END := 1.U
        }
      }
    }
  }

}