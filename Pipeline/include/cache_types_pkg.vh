`ifndef CACHE_TYPES_PKG_VH
`define CACHE_TYPES_PKG_VH
`include "cpu_types_pkg.vh"

package cache_types_pkg;

import cpu_types_pkg::*;
// i cache i cache  i cache  i cache  i cache  i cache  i cache  //
typedef struct packed
{
 logic [25:0] tag;
 logic 3:0] index;
 logic [1:0] offset;
} icache_t;

typedef struct packed
{
 logic v;
 logic [25:0] tag;
} tag_t;

typedef struct packed
{
 word_t value;
} value_t;

typedef enum bit
{
 Idle, Update
} state_t;
// i cache  i cache  i cache  i cache  i cache  i cache  i cache //

endpackage
`endif
