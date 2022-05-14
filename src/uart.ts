import { GWModule, toVerilog } from "gateware-ts";

class Mod extends GWModule {
  BTN_N = this.addInput('BTN_N', 1);
  LEDR_N = this.addOutput('LEDR_N', 1);

  describe(): void {
    this.combinationalProcess([
      this.LEDR_N.setTo(this.BTN_N.inverse())
    ]);
  }
}

console.log(toVerilog(new Mod('top')));
