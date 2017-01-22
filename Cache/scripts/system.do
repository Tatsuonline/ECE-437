onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /system_tb/CLK
add wave -noupdate /system_tb/nRST
add wave -noupdate /system_tb/DUT/CPU/DP/halt
add wave -noupdate /system_tb/DUT/CPU/DP/nextAddr
add wave -noupdate /system_tb/DUT/CPU/DP/pcAddr
add wave -noupdate /system_tb/DUT/CPU/DP/pc4
add wave -noupdate /system_tb/DUT/CPU/DP/pcWEN
add wave -noupdate -group PC /system_tb/DUT/CPU/DP/PC/CLK
add wave -noupdate -group PC /system_tb/DUT/CPU/DP/PC/nRST
add wave -noupdate -group PC /system_tb/DUT/CPU/DP/PC/nextAddr
add wave -noupdate -group PC /system_tb/DUT/CPU/DP/pcWEN
add wave -noupdate -group PC /system_tb/DUT/CPU/DP/PC/pcAddr
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/aluif/nf
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/aluif/zf
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/aluif/of
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/aluif/pout
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/aluif/port_a
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/aluif/port_b
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/aluif/opcode
add wave -noupdate -group RegisterFile /system_tb/DUT/CPU/DP/RegFile/rfif/WEN
add wave -noupdate -group RegisterFile /system_tb/DUT/CPU/DP/RegFile/rfif/wsel
add wave -noupdate -group RegisterFile /system_tb/DUT/CPU/DP/RegFile/rfif/rsel1
add wave -noupdate -group RegisterFile /system_tb/DUT/CPU/DP/RegFile/rfif/rsel2
add wave -noupdate -group RegisterFile /system_tb/DUT/CPU/DP/RegFile/rfif/wdat
add wave -noupdate -group RegisterFile /system_tb/DUT/CPU/DP/RegFile/rfif/rdat1
add wave -noupdate -group RegisterFile /system_tb/DUT/CPU/DP/RegFile/rfif/rdat2
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/alu_op
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/opcode
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/funct
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/Shamt
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/Alusrc
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/MemtoReg
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/RegtoPc
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/Branch
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/Equal
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/Jump
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/beq
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/bne
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/RegWrite
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/PCWait
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/RegDest
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/Link
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/Ext
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/Jr
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/LUI
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/halt
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/ImmtoReg
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/instr
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/dhit
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/dRead
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/dWrite
add wave -noupdate /system_tb/DUT/CPU/DP/PipeReg/ifidstall_en
add wave -noupdate /system_tb/DUT/CPU/DP/PipeReg/idexstall_en
add wave -noupdate -expand -group PipeReg /system_tb/DUT/CPU/DP/PipeReg/ihit
add wave -noupdate -expand -group PipeReg /system_tb/DUT/CPU/DP/PipeReg/dhit
add wave -noupdate -expand -group PipeReg -expand /system_tb/DUT/CPU/DP/PipeReg/ifidIn
add wave -noupdate -expand -group PipeReg /system_tb/DUT/CPU/DP/PipeReg/idexIn
add wave -noupdate -expand -group PipeReg /system_tb/DUT/CPU/DP/PipeReg/exmemIn
add wave -noupdate -expand -group PipeReg /system_tb/DUT/CPU/DP/PipeReg/memwbIn
add wave -noupdate -expand -group PipeReg /system_tb/DUT/CPU/DP/PipeReg/stall
add wave -noupdate -expand -group PipeReg -expand /system_tb/DUT/CPU/DP/PipeReg/ifidOut
add wave -noupdate -expand -group PipeReg /system_tb/DUT/CPU/DP/PipeReg/idexOut
add wave -noupdate -expand -group PipeReg /system_tb/DUT/CPU/DP/PipeReg/idexOut.Equal
add wave -noupdate -expand -group PipeReg /system_tb/DUT/CPU/DP/PipeReg/exmemOut
add wave -noupdate -expand -group PipeReg -expand /system_tb/DUT/CPU/DP/PipeReg/memwbOut
add wave -noupdate -expand -group PipeReg /system_tb/DUT/CPU/DP/PipeReg/ifid_en
add wave -noupdate -expand -group PipeReg /system_tb/DUT/CPU/DP/PipeReg/idex_en
add wave -noupdate -expand -group PipeReg /system_tb/DUT/CPU/DP/PipeReg/exmem_en
add wave -noupdate -expand -group PipeReg /system_tb/DUT/CPU/DP/PipeReg/memwb_en
add wave -noupdate -group Forward /system_tb/DUT/CPU/DP/fwdData_a
add wave -noupdate -group Forward /system_tb/DUT/CPU/DP/fwdData_b
add wave -noupdate -group Forward /system_tb/DUT/CPU/DP/exmemWdat
add wave -noupdate -group Forward /system_tb/DUT/CPU/DP/memwbWdat
add wave -noupdate -group Forward /system_tb/DUT/CPU/DP/FW/fuif/dMemWrite
add wave -noupdate -group Forward /system_tb/DUT/CPU/DP/FW/fuif/exmemRegW
add wave -noupdate -group Forward /system_tb/DUT/CPU/DP/FW/fuif/memwbRegW
add wave -noupdate -group Forward /system_tb/DUT/CPU/DP/FW/fuif/exmem_dMemRead
add wave -noupdate -group Forward /system_tb/DUT/CPU/DP/FW/fuif/memwb_dMemRead
add wave -noupdate -group Forward /system_tb/DUT/CPU/DP/FW/fuif/idexRegW
add wave -noupdate -group Forward /system_tb/DUT/CPU/DP/FW/fuif/ifid_rs
add wave -noupdate -group Forward /system_tb/DUT/CPU/DP/FW/fuif/ifid_rt
add wave -noupdate -group Forward /system_tb/DUT/CPU/DP/FW/fuif/idex_rt
add wave -noupdate -group Forward /system_tb/DUT/CPU/DP/FW/fuif/idex_rs
add wave -noupdate -group Forward /system_tb/DUT/CPU/DP/FW/fuif/idex_wsel
add wave -noupdate -group Forward /system_tb/DUT/CPU/DP/FW/fuif/exmem_wsel
add wave -noupdate -group Forward /system_tb/DUT/CPU/DP/FW/fuif/memwb_wsel
add wave -noupdate -group Forward /system_tb/DUT/CPU/DP/FW/fuif/exmem_rd
add wave -noupdate -group Forward /system_tb/DUT/CPU/DP/FW/fuif/memwb_rd
add wave -noupdate -group Forward /system_tb/DUT/CPU/DP/FW/fuif/fwa
add wave -noupdate -group Forward /system_tb/DUT/CPU/DP/FW/fuif/fwb
add wave -noupdate -group Forward /system_tb/DUT/CPU/DP/FW/fuif/fws
add wave -noupdate -expand -group Hazard /system_tb/DUT/CPU/DP/HAZ/hazz
add wave -noupdate -expand -group Hazard /system_tb/DUT/CPU/DP/HAZ/gayKing
add wave -noupdate -expand -group Hazard /system_tb/DUT/CPU/DP/RegFile/rfile
add wave -noupdate -expand -group Hazard /system_tb/DUT/CPU/DP/HAZ/huif/ifidFlush
add wave -noupdate -expand -group Hazard /system_tb/DUT/CPU/DP/HAZ/huif/idexFlush
add wave -noupdate -expand -group Hazard /system_tb/DUT/CPU/DP/HAZ/huif/exmemFlush
add wave -noupdate -expand -group Hazard /system_tb/DUT/CPU/DP/HAZ/huif/pcWait
add wave -noupdate -expand -group Hazard /system_tb/DUT/CPU/DP/huif/pcGo
add wave -noupdate -expand -group Hazard /system_tb/DUT/CPU/DP/HAZ/huif/flushEn
add wave -noupdate -expand -group Hazard /system_tb/DUT/CPU/DP/HAZ/huif/dMemRead
add wave -noupdate -expand -group Hazard /system_tb/DUT/CPU/DP/huif/dMemReq_exmem
add wave -noupdate -expand -group Hazard /system_tb/DUT/CPU/DP/HAZ/huif/ihit
add wave -noupdate -expand -group Hazard /system_tb/DUT/CPU/DP/HAZ/huif/dhit
add wave -noupdate -expand -group Hazard /system_tb/DUT/CPU/DP/HAZ/huif/halt
add wave -noupdate -expand -group Hazard /system_tb/DUT/CPU/DP/HAZ/huif/Link
add wave -noupdate -expand -group Hazard /system_tb/DUT/CPU/DP/HAZ/huif/idex_rt
add wave -noupdate -expand -group Hazard /system_tb/DUT/CPU/DP/HAZ/huif/ifid_rs
add wave -noupdate -expand -group Hazard /system_tb/DUT/CPU/DP/HAZ/huif/ifid_rt
add wave -noupdate -expand -group Hazard -expand /system_tb/DUT/CPU/DP/HAZ/huif/stall
add wave -noupdate -group ControlUnit /system_tb/DUT/CPU/DP/CtrUnit/cuif/alu_op
add wave -noupdate -group ControlUnit /system_tb/DUT/CPU/DP/CtrUnit/cuif/opcode
add wave -noupdate -group ControlUnit /system_tb/DUT/CPU/DP/CtrUnit/cuif/funct
add wave -noupdate -group ControlUnit /system_tb/DUT/CPU/DP/CtrUnit/cuif/Shamt
add wave -noupdate -group ControlUnit /system_tb/DUT/CPU/DP/CtrUnit/cuif/Alusrc
add wave -noupdate -group ControlUnit /system_tb/DUT/CPU/DP/CtrUnit/cuif/MemtoReg
add wave -noupdate -group ControlUnit /system_tb/DUT/CPU/DP/CtrUnit/cuif/RegtoPc
add wave -noupdate -group ControlUnit /system_tb/DUT/CPU/DP/CtrUnit/cuif/Branch
add wave -noupdate -group ControlUnit /system_tb/DUT/CPU/DP/CtrUnit/cuif/Equal
add wave -noupdate -group ControlUnit /system_tb/DUT/CPU/DP/CtrUnit/cuif/Jump
add wave -noupdate -group ControlUnit /system_tb/DUT/CPU/DP/CtrUnit/cuif/RegWrite
add wave -noupdate -group ControlUnit /system_tb/DUT/CPU/DP/CtrUnit/cuif/PCWait
add wave -noupdate -group ControlUnit /system_tb/DUT/CPU/DP/CtrUnit/cuif/RegDest
add wave -noupdate -group ControlUnit /system_tb/DUT/CPU/DP/CtrUnit/cuif/Link
add wave -noupdate -group ControlUnit /system_tb/DUT/CPU/DP/CtrUnit/cuif/Ext
add wave -noupdate -group ControlUnit /system_tb/DUT/CPU/DP/CtrUnit/cuif/Jr
add wave -noupdate -group ControlUnit /system_tb/DUT/CPU/DP/CtrUnit/cuif/LUI
add wave -noupdate -group ControlUnit /system_tb/DUT/CPU/DP/CtrUnit/cuif/halt
add wave -noupdate -group ControlUnit /system_tb/DUT/CPU/DP/CtrUnit/cuif/ImmtoReg
add wave -noupdate -group ControlUnit /system_tb/DUT/CPU/DP/CtrUnit/cuif/instr
add wave -noupdate -group ControlUnit /system_tb/DUT/CPU/DP/CtrUnit/cuif/dhit
add wave -noupdate -group ControlUnit /system_tb/DUT/CPU/DP/CtrUnit/cuif/dRead
add wave -noupdate -group ControlUnit /system_tb/DUT/CPU/DP/CtrUnit/cuif/dWrite
add wave -noupdate -group Decoder /system_tb/DUT/CPU/DP/DECODE/decodeif/rs
add wave -noupdate -group Decoder /system_tb/DUT/CPU/DP/DECODE/decodeif/rd
add wave -noupdate -group Decoder /system_tb/DUT/CPU/DP/DECODE/decodeif/rt
add wave -noupdate -group Decoder /system_tb/DUT/CPU/DP/DECODE/decodeif/opcode
add wave -noupdate -group Decoder /system_tb/DUT/CPU/DP/DECODE/decodeif/instr_d
add wave -noupdate -group Decoder /system_tb/DUT/CPU/DP/DECODE/decodeif/funct
add wave -noupdate -group Decoder /system_tb/DUT/CPU/DP/DECODE/decodeif/addr
add wave -noupdate -group Decoder /system_tb/DUT/CPU/DP/DECODE/decodeif/imm
add wave -noupdate -group Decoder /system_tb/DUT/CPU/DP/DECODE/decodeif/shamt
add wave -noupdate -group RAM /system_tb/DUT/RAM/ramif/ramREN
add wave -noupdate -group RAM /system_tb/DUT/RAM/ramif/ramWEN
add wave -noupdate -group RAM /system_tb/DUT/RAM/ramif/ramaddr
add wave -noupdate -group RAM /system_tb/DUT/RAM/ramif/ramstore
add wave -noupdate -group RAM /system_tb/DUT/RAM/ramif/ramload
add wave -noupdate -group RAM /system_tb/DUT/RAM/ramif/ramstate
add wave -noupdate -group RAM /system_tb/DUT/RAM/ramif/memREN
add wave -noupdate -group RAM /system_tb/DUT/RAM/ramif/memWEN
add wave -noupdate -group RAM /system_tb/DUT/RAM/ramif/memaddr
add wave -noupdate -group RAM /system_tb/DUT/RAM/ramif/memstore
add wave -noupdate -group dcif /system_tb/DUT/CPU/CM/dcif/halt
add wave -noupdate -group dcif /system_tb/DUT/CPU/CM/dcif/ihit
add wave -noupdate -group dcif /system_tb/DUT/CPU/CM/dcif/imemREN
add wave -noupdate -group dcif /system_tb/DUT/CPU/CM/dcif/imemload
add wave -noupdate -group dcif /system_tb/DUT/CPU/CM/dcif/imemaddr
add wave -noupdate -group dcif /system_tb/DUT/CPU/CM/dcif/dhit
add wave -noupdate -group dcif /system_tb/DUT/CPU/CM/dcif/datomic
add wave -noupdate -group dcif /system_tb/DUT/CPU/CM/dcif/dmemREN
add wave -noupdate -group dcif /system_tb/DUT/CPU/CM/dcif/dmemWEN
add wave -noupdate -group dcif /system_tb/DUT/CPU/CM/dcif/flushed
add wave -noupdate -group dcif /system_tb/DUT/CPU/CM/dcif/dmemload
add wave -noupdate -group dcif /system_tb/DUT/CPU/CM/dcif/dmemstore
add wave -noupdate -group dcif /system_tb/DUT/CPU/CM/dcif/dmemaddr
add wave -noupdate -group ccif /system_tb/DUT/CPU/CM/ccif/iwait
add wave -noupdate -group ccif /system_tb/DUT/CPU/CM/ccif/dwait
add wave -noupdate -group ccif /system_tb/DUT/CPU/CM/ccif/iREN
add wave -noupdate -group ccif /system_tb/DUT/CPU/CM/ccif/dREN
add wave -noupdate -group ccif /system_tb/DUT/CPU/CM/ccif/dWEN
add wave -noupdate -group ccif /system_tb/DUT/CPU/CM/ccif/iload
add wave -noupdate -group ccif /system_tb/DUT/CPU/CM/ccif/dload
add wave -noupdate -group ccif /system_tb/DUT/CPU/CM/ccif/dstore
add wave -noupdate -group ccif /system_tb/DUT/CPU/CM/ccif/iaddr
add wave -noupdate -group ccif /system_tb/DUT/CPU/CM/ccif/daddr
add wave -noupdate -group ccif /system_tb/DUT/CPU/CM/ccif/ccwait
add wave -noupdate -group ccif /system_tb/DUT/CPU/CM/ccif/ccinv
add wave -noupdate -group ccif /system_tb/DUT/CPU/CM/ccif/ccwrite
add wave -noupdate -group ccif /system_tb/DUT/CPU/CM/ccif/cctrans
add wave -noupdate -group ccif /system_tb/DUT/CPU/CM/ccif/ccsnoopaddr
add wave -noupdate -group ccif /system_tb/DUT/CPU/CM/ccif/ramWEN
add wave -noupdate -group ccif /system_tb/DUT/CPU/CM/ccif/ramREN
add wave -noupdate -group ccif /system_tb/DUT/CPU/CM/ccif/ramstate
add wave -noupdate -group ccif /system_tb/DUT/CPU/CM/ccif/ramaddr
add wave -noupdate -group ccif /system_tb/DUT/CPU/CM/ccif/ramstore
add wave -noupdate -group ccif /system_tb/DUT/CPU/CM/ccif/ramload
add wave -noupdate -group ccif /system_tb/DUT/CPU/CM/ccif/iwait
add wave -noupdate -group ccif /system_tb/DUT/CPU/CM/ccif/iload
add wave -noupdate -group ccif /system_tb/DUT/CPU/CM/ccif/dwait
add wave -noupdate -group ccif /system_tb/DUT/CPU/CM/ccif/dload
add wave -noupdate -group ccif /system_tb/DUT/CPU/CM/ccif/ccwait
add wave -noupdate -group ccif /system_tb/DUT/CPU/CM/ccif/ccinv
add wave -noupdate -group ccif /system_tb/DUT/CPU/CM/ccif/ccsnoopaddr
add wave -noupdate -group ccif /system_tb/DUT/CPU/CM/ccif/iREN
add wave -noupdate -group ccif /system_tb/DUT/CPU/CM/ccif/iaddr
add wave -noupdate -group ccif /system_tb/DUT/CPU/CM/ccif/dREN
add wave -noupdate -group ccif /system_tb/DUT/CPU/CM/ccif/dWEN
add wave -noupdate -group ccif /system_tb/DUT/CPU/CM/ccif/daddr
add wave -noupdate -group ccif /system_tb/DUT/CPU/CM/ccif/dstore
add wave -noupdate -group ccif /system_tb/DUT/CPU/CM/ccif/ccwrite
add wave -noupdate -group ccif /system_tb/DUT/CPU/CM/ccif/cctrans
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP/dpif/halt
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP/dpif/ihit
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP/dpif/imemREN
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP/dpif/imemload
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP/dpif/imemaddr
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP/dpif/dhit
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP/dpif/datomic
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP/dpif/dmemREN
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP/dpif/dmemWEN
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP/dpif/flushed
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP/dpif/dmemload
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP/dpif/dmemstore
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP/dpif/dmemaddr
add wave -noupdate /system_tb/DUT/CPU/DP/RegFile/rfile
add wave -noupdate -group Icache /system_tb/DUT/CPU/CM/ICACHE/CLK
add wave -noupdate -group Icache /system_tb/DUT/CPU/CM/ICACHE/nRST
add wave -noupdate -group Icache /system_tb/DUT/CPU/CM/ICACHE/cur
add wave -noupdate -group Icache /system_tb/DUT/CPU/CM/ICACHE/next
add wave -noupdate -group Icache /system_tb/DUT/CPU/CM/ICACHE/icur
add wave -noupdate -group Icache /system_tb/DUT/CPU/CM/ICACHE/inext
add wave -noupdate -group Icache /system_tb/DUT/CPU/CM/ICACHE/curValue
add wave -noupdate -group Icache /system_tb/DUT/CPU/CM/ICACHE/nextValue
add wave -noupdate -group Icache /system_tb/DUT/CPU/CM/ICACHE/addr
add wave -noupdate -group Icache /system_tb/DUT/CPU/CM/ICACHE/imemload
add wave -noupdate -group Icache /system_tb/DUT/CPU/CM/ICACHE/WEN
add wave -noupdate -group Icache /system_tb/DUT/CPU/CM/ICACHE/hit
add wave -noupdate -group Dcache /system_tb/DUT/CPU/CM/DCACHE/CLK
add wave -noupdate -group Dcache /system_tb/DUT/CPU/CM/DCACHE/nRST
add wave -noupdate -group Dcache /system_tb/DUT/CPU/CM/DCACHE/cur
add wave -noupdate -group Dcache /system_tb/DUT/CPU/CM/DCACHE/next
add wave -noupdate -group Dcache /system_tb/DUT/CPU/CM/DCACHE/tempTag
add wave -noupdate -group Dcache /system_tb/DUT/CPU/CM/DCACHE/dcur
add wave -noupdate -group Dcache /system_tb/DUT/CPU/CM/DCACHE/dnext
add wave -noupdate -group Dcache /system_tb/DUT/CPU/CM/DCACHE/dwrite
add wave -noupdate -group Dcache /system_tb/DUT/CPU/CM/DCACHE/tempValue
add wave -noupdate -group Dcache /system_tb/DUT/CPU/CM/DCACHE/tags
add wave -noupdate -group Dcache -expand -subitemconfig {{/system_tb/DUT/CPU/CM/DCACHE/values[4]} -expand {/system_tb/DUT/CPU/CM/DCACHE/values[2]} -expand} /system_tb/DUT/CPU/CM/DCACHE/values
add wave -noupdate -group Dcache -expand -subitemconfig {/system_tb/DUT/CPU/CM/DCACHE/dval.values -expand} /system_tb/DUT/CPU/CM/DCACHE/dval
add wave -noupdate -group Dcache /system_tb/DUT/CPU/CM/DCACHE/dvalnext
add wave -noupdate -group Dcache /system_tb/DUT/CPU/CM/DCACHE/dvalwrite
add wave -noupdate -group Dcache /system_tb/DUT/CPU/CM/DCACHE/nextlru
add wave -noupdate -group Dcache /system_tb/DUT/CPU/CM/DCACHE/tagWEN
add wave -noupdate -group Dcache /system_tb/DUT/CPU/CM/DCACHE/valueWEN
add wave -noupdate -group Dcache /system_tb/DUT/CPU/CM/DCACHE/hit
add wave -noupdate -group Dcache /system_tb/DUT/CPU/CM/DCACHE/way
add wave -noupdate -group Dcache /system_tb/DUT/CPU/CM/DCACHE/lru
add wave -noupdate -group Dcache /system_tb/DUT/CPU/CM/DCACHE/wWay
add wave -noupdate -group Dcache /system_tb/DUT/CPU/CM/DCACHE/dirtyFrame
add wave -noupdate -group Dcache /system_tb/DUT/CPU/CM/DCACHE/addr
add wave -noupdate -group Dcache /system_tb/DUT/CPU/CM/DCACHE/wayCount
add wave -noupdate -group Dcache /system_tb/DUT/CPU/CM/DCACHE/nextWayCount
add wave -noupdate -group Dcache /system_tb/DUT/CPU/CM/DCACHE/setCount
add wave -noupdate -group Dcache /system_tb/DUT/CPU/CM/DCACHE/nextSetCount
add wave -noupdate -group Dcache /system_tb/DUT/CPU/CM/DCACHE/hitCount
add wave -noupdate -group Dcache /system_tb/DUT/CPU/CM/DCACHE/nextHitCount
add wave -noupdate -group Dcache /system_tb/DUT/CPU/CM/DCACHE/flushWait
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1291090 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 310
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {1080453 ps} {1735274 ps}
