import chisel3._
import chisel3.iotesters.PeekPokeTester

class RegisterFileTester(dut: RegisterFile) extends PeekPokeTester(dut) {

  //Check that the ALU is working correctly
  // Write value to Register
  poke(dut.io.aSel, 0)
  poke(dut.io.bSel, 0)
  poke(dut.io.writeData, 320)
  poke(dut.io.writeSel, 0)
  poke(dut.io.writeEnable, 1)
  step(5)

  // Write value to Register w/o writeEnable enabled enable.
  poke(dut.io.aSel, 0)
  poke(dut.io.bSel, 0)
  poke(dut.io.writeData, 141)
  poke(dut.io.writeSel, 0)
  poke(dut.io.writeEnable, 0)
  step(5)

  // Get data from aSel.
  poke(dut.io.aSel, 0)
  poke(dut.io.bSel, 0)
  poke(dut.io.writeData, 0)
  poke(dut.io.writeSel, 0)
  poke(dut.io.writeEnable, 0)
  step(5)
}

object RegisterFileTester {
  def main(args: Array[String]): Unit = {
    println("Testing RegisterFile")
    iotesters.Driver.execute(
      Array("--generate-vcd-output", "on",
        "--target-dir", "generated",
        "--top-name", "RegisterFile"),
      () => new RegisterFile()) {
      c => new RegisterFileTester(c)
    }
  }
}
