`ifndef REQUEST_UNIT_IF_VH
`define REQUEST_UNIT_IF_VH

`include "cpu_types_pkg.vh"

interface request_unit_if;

import cpu_types_pkg::*;

logic dRead, dWrite, dhit, ihit, halt;
logic iREN, dREN, dWEN;

modport ruif
(
  input dRead, dWrite, ihit, dhit, halt,
  output iREN, dREN, dWEN
);

endinterface

`endif
