import chisel3._
import chisel3.util._

class ControlUnit extends Module {
  val io = IO(new Bundle {
    //Define the module interface here (inputs/outputs)
    val opCode = Input(UInt(6.W))

    val ALUsel = Output(UInt(1.W))
    val ALUsrc = Output(UInt(1.W))
    val branch = Output(Bool ())
    val stop = Output(Bool ())
    val run = Output(Bool ())
    val writeEnable = Output(UInt(1.W))

  })

  //Implement this module here
  val im = Cat(io.opCode(0), io.opCode(1))
  val cat = Cat(io.opCode(2), io.opCode(3))
  val op = Cat(io.opCode(4), io.opCode(5))

  io.ALUsel := 0.U
  io.writeEnable := 0.U

  switch(im){
    is(0.U){/*No operation*/}
    is(1.U){
      //Not immediate
      switch(cat){
        is(1.U){
          //Arithmetic operation
          io.writeEnable := 1.U
          switch(op){
            is(1.U){
              /*Addition (ADD)*/
              io.ALUsel := 0.U
            }
            is(2.U){
              /*Subtraction (SUB)*/
              io.ALUsel := 1.U
            }
          }
        }
        is(2.U){
          //Data operation
          switch(op){
            is(1.U){
              /*Load data (LD)*/
              io.writeEnable := 1.U
            }
            is(2.U){
              /*Store data (SD)*/
              io.writeEnable := 0.U
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
          switch(op){
            is(1.U){/*Immediate Addition (ADDI)*/}
            is(2.U){/*Immediate Subtraction (SUBI)*/}
          }
        }
        is(2.U){
          //Load immediate (LI)
        }
      }
    }
    is(3.U){
      switch(op){
        is(1.U){/*Jumping to branch (BRANCH)*/}
        is(2.U){/*If it is zero (BZERO)*/}
        is(3.U){/*End execution (END)*/}
      }
    }
  }

}