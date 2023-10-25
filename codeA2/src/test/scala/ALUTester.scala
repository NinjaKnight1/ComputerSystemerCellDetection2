import chisel3._
import chisel3.iotesters.PeekPokeTester

class ALUTester(dut: ALU) extends PeekPokeTester(dut) {

  //
  poke(dut.io.op1,321)
  poke(dut.io.op2, 320)
  poke(dut.io.sel, 1)

  step(5)
}

object ALUTester {
  def main(args: Array[String]): Unit = {
    println("Testing ALU")
    iotesters.Driver.execute(
      Array("--generate-vcd-output", "on",
        "--target-dir", "generated",
        "--top-name", "ALU"),
      () => new ALU()) {
      c => new ALUTester(c)
    }
  }
}
