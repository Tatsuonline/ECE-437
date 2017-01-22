onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /system_tb/CLK
add wave -noupdate /system_tb/nRST
add wave -noupdate -group PC1 /system_tb/DUT/CPU/DP1/PC/CLK
add wave -noupdate -group PC1 /system_tb/DUT/CPU/DP1/PC/nRST
add wave -noupdate -group PC1 /system_tb/DUT/CPU/DP1/PC/pcWEN
add wave -noupdate -group PC1 /system_tb/DUT/CPU/DP1/PC/nextAddr
add wave -noupdate -group PC1 /system_tb/DUT/CPU/DP1/PC/pcAddr
add wave -noupdate -group huif0 /system_tb/DUT/CPU/DP0/HAZ/huif/ifidFlush
add wave -noupdate -group huif0 /system_tb/DUT/CPU/DP0/HAZ/huif/idexFlush
add wave -noupdate -group huif0 /system_tb/DUT/CPU/DP0/HAZ/huif/exmemFlush
add wave -noupdate -group huif0 /system_tb/DUT/CPU/DP0/HAZ/huif/pcWait
add wave -noupdate -group huif0 /system_tb/DUT/CPU/DP0/HAZ/huif/flushEn
add wave -noupdate -group huif0 /system_tb/DUT/CPU/DP0/HAZ/huif/Jr
add wave -noupdate -group huif0 /system_tb/DUT/CPU/DP0/HAZ/huif/Link
add wave -noupdate -group huif0 /system_tb/DUT/CPU/DP0/HAZ/huif/pcGo
add wave -noupdate -group huif0 /system_tb/DUT/CPU/DP0/HAZ/huif/dMemRead
add wave -noupdate -group huif0 /system_tb/DUT/CPU/DP0/HAZ/huif/dMemReq_exmem
add wave -noupdate -group huif0 /system_tb/DUT/CPU/DP0/HAZ/huif/ihit
add wave -noupdate -group huif0 /system_tb/DUT/CPU/DP0/HAZ/huif/dhit
add wave -noupdate -group huif0 /system_tb/DUT/CPU/DP0/HAZ/huif/halt
add wave -noupdate -group huif0 /system_tb/DUT/CPU/DP0/HAZ/huif/dpif_halt
add wave -noupdate -group huif0 /system_tb/DUT/CPU/DP0/HAZ/huif/idex_rt
add wave -noupdate -group huif0 /system_tb/DUT/CPU/DP0/HAZ/huif/ifid_rs
add wave -noupdate -group huif0 /system_tb/DUT/CPU/DP0/HAZ/huif/ifid_rt
add wave -noupdate -group huif0 /system_tb/DUT/CPU/DP0/HAZ/huif/stall
add wave -noupdate -expand -group huif1 /system_tb/DUT/CPU/DP1/huif/ifidFlush
add wave -noupdate -expand -group huif1 /system_tb/DUT/CPU/DP1/huif/idexFlush
add wave -noupdate -expand -group huif1 /system_tb/DUT/CPU/DP1/huif/exmemFlush
add wave -noupdate -expand -group huif1 /system_tb/DUT/CPU/DP1/huif/pcWait
add wave -noupdate -expand -group huif1 /system_tb/DUT/CPU/DP1/huif/flushEn
add wave -noupdate -expand -group huif1 /system_tb/DUT/CPU/DP1/huif/Jr
add wave -noupdate -expand -group huif1 /system_tb/DUT/CPU/DP1/huif/Link
add wave -noupdate -expand -group huif1 /system_tb/DUT/CPU/DP1/huif/pcGo
add wave -noupdate -expand -group huif1 /system_tb/DUT/CPU/DP1/huif/dMemRead
add wave -noupdate -expand -group huif1 /system_tb/DUT/CPU/DP1/huif/dMemReq_exmem
add wave -noupdate -expand -group huif1 /system_tb/DUT/CPU/DP1/huif/ihit
add wave -noupdate -expand -group huif1 /system_tb/DUT/CPU/DP1/huif/dhit
add wave -noupdate -expand -group huif1 /system_tb/DUT/CPU/DP1/huif/halt
add wave -noupdate -expand -group huif1 /system_tb/DUT/CPU/DP1/huif/dpif_halt
add wave -noupdate -expand -group huif1 /system_tb/DUT/CPU/DP1/huif/idex_rt
add wave -noupdate -expand -group huif1 /system_tb/DUT/CPU/DP1/huif/ifid_rs
add wave -noupdate -expand -group huif1 /system_tb/DUT/CPU/DP1/huif/ifid_rt
add wave -noupdate -expand -group huif1 /system_tb/DUT/CPU/DP1/huif/stall
add wave -noupdate -group PC /system_tb/DUT/CPU/DP0/PC/CLK
add wave -noupdate -group PC /system_tb/DUT/CPU/DP0/PC/nRST
add wave -noupdate -group PC /system_tb/DUT/CPU/DP0/PC/pcWEN
add wave -noupdate -group PC /system_tb/DUT/CPU/DP0/PC/nextAddr
add wave -noupdate -group PC /system_tb/DUT/CPU/DP0/PC/pcAddr
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP0/dpif/halt
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP0/dpif/ihit
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP0/dpif/imemREN
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP0/dpif/imemload
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP0/dpif/imemaddr
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP0/dpif/dhit
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP0/dpif/datomic
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP0/dpif/dmemREN
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP0/dpif/dmemWEN
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP0/dpif/flushed
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP0/dpif/dmemload
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP0/dpif/dmemstore
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP0/dpif/dmemaddr
add wave -noupdate -group rfif /system_tb/DUT/CPU/DP0/rfif/WEN
add wave -noupdate -group rfif /system_tb/DUT/CPU/DP0/rfif/wsel
add wave -noupdate -group rfif /system_tb/DUT/CPU/DP0/rfif/rsel1
add wave -noupdate -group rfif /system_tb/DUT/CPU/DP0/rfif/rsel2
add wave -noupdate -group rfif /system_tb/DUT/CPU/DP0/rfif/wdat
add wave -noupdate -group rfif /system_tb/DUT/CPU/DP0/rfif/rdat1
add wave -noupdate -group rfif /system_tb/DUT/CPU/DP0/rfif/rdat2
add wave -noupdate -group aluf /system_tb/DUT/CPU/DP0/aluif/nf
add wave -noupdate -group aluf /system_tb/DUT/CPU/DP0/aluif/zf
add wave -noupdate -group aluf /system_tb/DUT/CPU/DP0/aluif/of
add wave -noupdate -group aluf /system_tb/DUT/CPU/DP0/aluif/pout
add wave -noupdate -group aluf /system_tb/DUT/CPU/DP0/aluif/port_a
add wave -noupdate -group aluf /system_tb/DUT/CPU/DP0/aluif/port_b
add wave -noupdate -group aluf /system_tb/DUT/CPU/DP0/aluif/opcode
add wave -noupdate -group huif /system_tb/DUT/CPU/DP0/huif/ifidFlush
add wave -noupdate -group huif /system_tb/DUT/CPU/DP0/huif/idexFlush
add wave -noupdate -group huif /system_tb/DUT/CPU/DP0/huif/exmemFlush
add wave -noupdate -group huif /system_tb/DUT/CPU/DP0/huif/pcWait
add wave -noupdate -group huif /system_tb/DUT/CPU/DP0/huif/flushEn
add wave -noupdate -group huif /system_tb/DUT/CPU/DP0/huif/Jr
add wave -noupdate -group huif /system_tb/DUT/CPU/DP0/huif/Link
add wave -noupdate -group huif /system_tb/DUT/CPU/DP0/huif/pcGo
add wave -noupdate -group huif /system_tb/DUT/CPU/DP0/huif/dMemRead
add wave -noupdate -group huif /system_tb/DUT/CPU/DP0/huif/dMemReq_exmem
add wave -noupdate -group huif /system_tb/DUT/CPU/DP0/huif/ihit
add wave -noupdate -group huif /system_tb/DUT/CPU/DP0/huif/dhit
add wave -noupdate -group huif /system_tb/DUT/CPU/DP0/huif/halt
add wave -noupdate -group huif /system_tb/DUT/CPU/DP0/huif/dpif_halt
add wave -noupdate -group huif /system_tb/DUT/CPU/DP0/huif/idex_rt
add wave -noupdate -group huif /system_tb/DUT/CPU/DP0/huif/ifid_rs
add wave -noupdate -group huif /system_tb/DUT/CPU/DP0/huif/ifid_rt
add wave -noupdate -group huif /system_tb/DUT/CPU/DP0/huif/stall
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/CtrUnit/cuif/alu_op
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/CtrUnit/cuif/opcode
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/CtrUnit/cuif/funct
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/CtrUnit/cuif/Shamt
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/CtrUnit/cuif/Alusrc
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/CtrUnit/cuif/MemtoReg
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/CtrUnit/cuif/RegtoPc
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/CtrUnit/cuif/Branch
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/CtrUnit/cuif/Equal
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/CtrUnit/cuif/Jump
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/CtrUnit/cuif/beq
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/CtrUnit/cuif/bne
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/CtrUnit/cuif/RegWrite
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/CtrUnit/cuif/PCWait
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/CtrUnit/cuif/RegDest
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/CtrUnit/cuif/Link
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/CtrUnit/cuif/Ext
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/CtrUnit/cuif/Jr
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/CtrUnit/cuif/LUI
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/CtrUnit/cuif/LL
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/CtrUnit/cuif/SC
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/CtrUnit/cuif/halt
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/CtrUnit/cuif/ImmtoReg
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/CtrUnit/cuif/instr
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/CtrUnit/cuif/dhit
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/CtrUnit/cuif/dRead
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/CtrUnit/cuif/dWrite
add wave -noupdate -group fuif /system_tb/DUT/CPU/DP0/fuif/dMemWrite
add wave -noupdate -group fuif /system_tb/DUT/CPU/DP0/fuif/exmemRegW
add wave -noupdate -group fuif /system_tb/DUT/CPU/DP0/fuif/memwbRegW
add wave -noupdate -group fuif /system_tb/DUT/CPU/DP0/fuif/exmem_dMemRead
add wave -noupdate -group fuif /system_tb/DUT/CPU/DP0/fuif/memwb_dMemRead
add wave -noupdate -group fuif /system_tb/DUT/CPU/DP0/fuif/idexRegW
add wave -noupdate -group fuif /system_tb/DUT/CPU/DP0/fuif/idex_rt
add wave -noupdate -group fuif /system_tb/DUT/CPU/DP0/fuif/idex_rs
add wave -noupdate -group fuif /system_tb/DUT/CPU/DP0/fuif/idex_wsel
add wave -noupdate -group fuif /system_tb/DUT/CPU/DP0/fuif/exmem_wsel
add wave -noupdate -group fuif /system_tb/DUT/CPU/DP0/fuif/memwb_wsel
add wave -noupdate -group fuif /system_tb/DUT/CPU/DP0/fuif/exmem_rd
add wave -noupdate -group fuif /system_tb/DUT/CPU/DP0/fuif/memwb_rd
add wave -noupdate -group fuif /system_tb/DUT/CPU/DP0/fuif/ifid_rs
add wave -noupdate -group fuif /system_tb/DUT/CPU/DP0/fuif/ifid_rt
add wave -noupdate -group fuif /system_tb/DUT/CPU/DP0/fuif/fwa
add wave -noupdate -group fuif /system_tb/DUT/CPU/DP0/fuif/fwb
add wave -noupdate -group fuif /system_tb/DUT/CPU/DP0/fuif/fws
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/CtrUnit/cuif/alu_op
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/CtrUnit/cuif/opcode
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/CtrUnit/cuif/funct
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/CtrUnit/cuif/Shamt
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/CtrUnit/cuif/Alusrc
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/CtrUnit/cuif/MemtoReg
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/CtrUnit/cuif/RegtoPc
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/CtrUnit/cuif/Branch
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/CtrUnit/cuif/Equal
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/CtrUnit/cuif/Jump
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/CtrUnit/cuif/beq
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/CtrUnit/cuif/bne
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/CtrUnit/cuif/RegWrite
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/CtrUnit/cuif/PCWait
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/CtrUnit/cuif/RegDest
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/CtrUnit/cuif/Link
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/CtrUnit/cuif/Ext
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/CtrUnit/cuif/Jr
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/CtrUnit/cuif/LUI
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/CtrUnit/cuif/LL
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/CtrUnit/cuif/SC
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/CtrUnit/cuif/halt
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/CtrUnit/cuif/ImmtoReg
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/CtrUnit/cuif/instr
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/CtrUnit/cuif/dhit
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/CtrUnit/cuif/dRead
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/CtrUnit/cuif/dWrite
add wave -noupdate -group icache /system_tb/DUT/CPU/CM0/ICACHE/CPUID
add wave -noupdate -group icache /system_tb/DUT/CPU/CM0/ICACHE/CLK
add wave -noupdate -group icache /system_tb/DUT/CPU/CM0/ICACHE/nRST
add wave -noupdate -group icache /system_tb/DUT/CPU/CM0/ICACHE/cur
add wave -noupdate -group icache /system_tb/DUT/CPU/CM0/ICACHE/next
add wave -noupdate -group icache /system_tb/DUT/CPU/CM0/ICACHE/tags
add wave -noupdate -group icache /system_tb/DUT/CPU/CM0/ICACHE/icur
add wave -noupdate -group icache /system_tb/DUT/CPU/CM0/ICACHE/inext
add wave -noupdate -group icache /system_tb/DUT/CPU/CM0/ICACHE/values
add wave -noupdate -group icache /system_tb/DUT/CPU/CM0/ICACHE/curValue
add wave -noupdate -group icache /system_tb/DUT/CPU/CM0/ICACHE/nextValue
add wave -noupdate -group icache /system_tb/DUT/CPU/CM0/ICACHE/addr
add wave -noupdate -group icache /system_tb/DUT/CPU/CM0/ICACHE/imemload
add wave -noupdate -group icache /system_tb/DUT/CPU/CM0/ICACHE/WEN
add wave -noupdate -group icache /system_tb/DUT/CPU/CM0/ICACHE/hit
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM0/DCACHE/CPUID
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM0/DCACHE/CLK
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM0/DCACHE/nRST
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM0/DCACHE/cur
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM0/DCACHE/next
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM0/DCACHE/tags
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM0/DCACHE/tempTag
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM0/DCACHE/dcur
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM0/DCACHE/dnext
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM0/DCACHE/dwrite
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM0/DCACHE/values
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM0/DCACHE/tempValue
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM0/DCACHE/dval
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM0/DCACHE/dvalnext
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM0/DCACHE/dvalwrite
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM0/DCACHE/lru
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM0/DCACHE/nextlru
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM0/DCACHE/tagWEN
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM0/DCACHE/valueWEN
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM0/DCACHE/hit
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM0/DCACHE/way
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM0/DCACHE/wWay
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM0/DCACHE/dirtyFrame
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM0/DCACHE/addr
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM0/DCACHE/wayCount
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM0/DCACHE/nextWayCount
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM0/DCACHE/setCount
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM0/DCACHE/nextSetCount
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM0/DCACHE/hitCount
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM0/DCACHE/nextHitCount
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM0/DCACHE/flushWait
add wave -noupdate -group dcache /system_tb/DUT/CPU/CM0/DCACHE/dataIn
add wave -noupdate -group ramif /system_tb/DUT/RAM/ramif/ramREN
add wave -noupdate -group ramif /system_tb/DUT/RAM/ramif/ramWEN
add wave -noupdate -group ramif /system_tb/DUT/RAM/ramif/ramaddr
add wave -noupdate -group ramif /system_tb/DUT/RAM/ramif/ramstore
add wave -noupdate -group ramif /system_tb/DUT/RAM/ramif/ramload
add wave -noupdate -group ramif /system_tb/DUT/RAM/ramif/ramstate
add wave -noupdate -group ramif /system_tb/DUT/RAM/ramif/memREN
add wave -noupdate -group ramif /system_tb/DUT/RAM/ramif/memWEN
add wave -noupdate -group ramif /system_tb/DUT/RAM/ramif/memaddr
add wave -noupdate -group ramif /system_tb/DUT/RAM/ramif/memstore
add wave -noupdate -group cm0ccif /system_tb/DUT/CPU/CM0/ccif/iwait
add wave -noupdate -group cm0ccif /system_tb/DUT/CPU/CM0/ccif/dwait
add wave -noupdate -group cm0ccif /system_tb/DUT/CPU/CM0/ccif/iREN
add wave -noupdate -group cm0ccif /system_tb/DUT/CPU/CM0/ccif/dREN
add wave -noupdate -group cm0ccif /system_tb/DUT/CPU/CM0/ccif/dWEN
add wave -noupdate -group cm0ccif /system_tb/DUT/CPU/CM0/ccif/iload
add wave -noupdate -group cm0ccif /system_tb/DUT/CPU/CM0/ccif/dload
add wave -noupdate -group cm0ccif /system_tb/DUT/CPU/CM0/ccif/dstore
add wave -noupdate -group cm0ccif /system_tb/DUT/CPU/CM0/ccif/iaddr
add wave -noupdate -group cm0ccif /system_tb/DUT/CPU/CM0/ccif/daddr
add wave -noupdate -group cm0ccif /system_tb/DUT/CPU/CM0/ccif/ccwait
add wave -noupdate -group cm0ccif /system_tb/DUT/CPU/CM0/ccif/ccinv
add wave -noupdate -group cm0ccif /system_tb/DUT/CPU/CM0/ccif/ccwrite
add wave -noupdate -group cm0ccif /system_tb/DUT/CPU/CM0/ccif/cctrans
add wave -noupdate -group cm0ccif /system_tb/DUT/CPU/CM0/ccif/ccsnoopaddr
add wave -noupdate -group cm0ccif /system_tb/DUT/CPU/CM0/ccif/ramWEN
add wave -noupdate -group cm0ccif /system_tb/DUT/CPU/CM0/ccif/ramREN
add wave -noupdate -group cm0ccif /system_tb/DUT/CPU/CM0/ccif/ramstate
add wave -noupdate -group cm0ccif /system_tb/DUT/CPU/CM0/ccif/ramaddr
add wave -noupdate -group cm0ccif /system_tb/DUT/CPU/CM0/ccif/ramstore
add wave -noupdate -group cm0ccif /system_tb/DUT/CPU/CM0/ccif/ramload
add wave -noupdate /system_tb/DUT/CPU/CM0/ccif/dwait
add wave -noupdate /system_tb/DUT/CPU/CM1/ccif/dwait
add wave -noupdate -expand -group cm0dcif /system_tb/DUT/CPU/CM0/dcif/halt
add wave -noupdate -expand -group cm0dcif /system_tb/DUT/CPU/CM0/dcif/ihit
add wave -noupdate -expand -group cm0dcif /system_tb/DUT/CPU/CM0/dcif/imemREN
add wave -noupdate -expand -group cm0dcif /system_tb/DUT/CPU/CM0/dcif/imemload
add wave -noupdate -expand -group cm0dcif /system_tb/DUT/CPU/CM0/dcif/imemaddr
add wave -noupdate -expand -group cm0dcif /system_tb/DUT/CPU/CM0/dcif/dhit
add wave -noupdate -expand -group cm0dcif /system_tb/DUT/CPU/CM0/dcif/datomic
add wave -noupdate -expand -group cm0dcif /system_tb/DUT/CPU/CM0/dcif/dmemREN
add wave -noupdate -expand -group cm0dcif /system_tb/DUT/CPU/CM0/dcif/dmemWEN
add wave -noupdate -expand -group cm0dcif /system_tb/DUT/CPU/CM0/dcif/flushed
add wave -noupdate -expand -group cm0dcif /system_tb/DUT/CPU/CM0/dcif/dmemload
add wave -noupdate -expand -group cm0dcif /system_tb/DUT/CPU/CM0/dcif/dmemstore
add wave -noupdate -expand -group cm0dcif /system_tb/DUT/CPU/CM0/dcif/dmemaddr
add wave -noupdate -group cm1ccif /system_tb/DUT/CPU/CM1/ccif/CPUS
add wave -noupdate -group cm1ccif /system_tb/DUT/CPU/CM1/ccif/CPUID
add wave -noupdate -group cm1ccif /system_tb/DUT/CPU/CM1/ccif/iwait
add wave -noupdate -group cm1ccif /system_tb/DUT/CPU/CM1/ccif/dwait
add wave -noupdate -group cm1ccif /system_tb/DUT/CPU/CM1/ccif/iREN
add wave -noupdate -group cm1ccif /system_tb/DUT/CPU/CM1/ccif/dREN
add wave -noupdate -group cm1ccif /system_tb/DUT/CPU/CM1/ccif/dWEN
add wave -noupdate -group cm1ccif /system_tb/DUT/CPU/CM1/ccif/iload
add wave -noupdate -group cm1ccif /system_tb/DUT/CPU/CM1/ccif/dload
add wave -noupdate -group cm1ccif /system_tb/DUT/CPU/CM1/ccif/dstore
add wave -noupdate -group cm1ccif /system_tb/DUT/CPU/CM1/ccif/iaddr
add wave -noupdate -group cm1ccif /system_tb/DUT/CPU/CM1/ccif/daddr
add wave -noupdate -group cm1ccif /system_tb/DUT/CPU/CM1/ccif/ccwait
add wave -noupdate -group cm1ccif /system_tb/DUT/CPU/CM1/ccif/ccinv
add wave -noupdate -group cm1ccif /system_tb/DUT/CPU/CM1/ccif/ccwrite
add wave -noupdate -group cm1ccif /system_tb/DUT/CPU/CM1/ccif/cctrans
add wave -noupdate -group cm1ccif /system_tb/DUT/CPU/CM1/ccif/ccsnoopaddr
add wave -noupdate -group cm1ccif /system_tb/DUT/CPU/CM1/ccif/ramWEN
add wave -noupdate -group cm1ccif /system_tb/DUT/CPU/CM1/ccif/ramREN
add wave -noupdate -group cm1ccif /system_tb/DUT/CPU/CM1/ccif/ramstate
add wave -noupdate -group cm1ccif /system_tb/DUT/CPU/CM1/ccif/ramaddr
add wave -noupdate -group cm1ccif /system_tb/DUT/CPU/CM1/ccif/ramstore
add wave -noupdate -group cm1ccif /system_tb/DUT/CPU/CM1/ccif/ramload
add wave -noupdate -expand -group cm1dcif /system_tb/DUT/CPU/CM1/dcif/halt
add wave -noupdate -expand -group cm1dcif /system_tb/DUT/CPU/CM1/dcif/ihit
add wave -noupdate -expand -group cm1dcif /system_tb/DUT/CPU/CM1/dcif/imemREN
add wave -noupdate -expand -group cm1dcif /system_tb/DUT/CPU/CM1/dcif/imemload
add wave -noupdate -expand -group cm1dcif /system_tb/DUT/CPU/CM1/dcif/imemaddr
add wave -noupdate -expand -group cm1dcif /system_tb/DUT/CPU/CM1/dcif/dhit
add wave -noupdate -expand -group cm1dcif /system_tb/DUT/CPU/CM1/dcif/datomic
add wave -noupdate -expand -group cm1dcif /system_tb/DUT/CPU/CM1/dcif/dmemREN
add wave -noupdate -expand -group cm1dcif /system_tb/DUT/CPU/CM1/dcif/dmemWEN
add wave -noupdate -expand -group cm1dcif /system_tb/DUT/CPU/CM1/dcif/flushed
add wave -noupdate -expand -group cm1dcif /system_tb/DUT/CPU/CM1/dcif/dmemload
add wave -noupdate -expand -group cm1dcif /system_tb/DUT/CPU/CM1/dcif/dmemstore
add wave -noupdate -expand -group cm1dcif /system_tb/DUT/CPU/CM1/dcif/dmemaddr
add wave -noupdate -group Dcache0 /system_tb/DUT/CPU/CM0/DCACHE/CLK
add wave -noupdate -group Dcache0 /system_tb/DUT/CPU/CM0/DCACHE/nRST
add wave -noupdate -group Dcache0 /system_tb/DUT/CPU/CM0/DCACHE/cur
add wave -noupdate -group Dcache0 /system_tb/DUT/CPU/CM0/DCACHE/next
add wave -noupdate -group Dcache0 /system_tb/DUT/CPU/CM0/DCACHE/tempTag
add wave -noupdate -group Dcache0 /system_tb/DUT/CPU/CM0/DCACHE/shit
add wave -noupdate -group Dcache0 /system_tb/DUT/CPU/CM0/DCACHE/values
add wave -noupdate -group Dcache0 /system_tb/DUT/CPU/CM0/DCACHE/dcur
add wave -noupdate -group Dcache0 /system_tb/DUT/CPU/CM0/DCACHE/dnext
add wave -noupdate -group Dcache0 /system_tb/DUT/CPU/CM0/DCACHE/dwrite
add wave -noupdate -group Dcache0 /system_tb/DUT/CPU/CM0/DCACHE/tempValue
add wave -noupdate -group Dcache0 /system_tb/DUT/CPU/CM0/DCACHE/dval
add wave -noupdate -group Dcache0 /system_tb/DUT/CPU/CM0/DCACHE/dvalnext
add wave -noupdate -group Dcache0 /system_tb/DUT/CPU/CM0/DCACHE/dvalwrite
add wave -noupdate -group Dcache0 /system_tb/DUT/CPU/CM0/DCACHE/nextlru
add wave -noupdate -group Dcache0 /system_tb/DUT/CPU/CM0/DCACHE/tagWEN
add wave -noupdate -group Dcache0 -expand -subitemconfig {{/system_tb/DUT/CPU/CM0/DCACHE/tags[1]} -expand {/system_tb/DUT/CPU/CM0/DCACHE/tags[1][0]} -expand} /system_tb/DUT/CPU/CM0/DCACHE/tags
add wave -noupdate -group Dcache0 /system_tb/DUT/CPU/CM0/DCACHE/valueWEN
add wave -noupdate -group Dcache0 /system_tb/DUT/CPU/CM0/DCACHE/hit
add wave -noupdate -group Dcache0 /system_tb/DUT/CPU/CM0/DCACHE/way
add wave -noupdate -group Dcache0 /system_tb/DUT/CPU/CM0/DCACHE/wWay
add wave -noupdate -group Dcache0 /system_tb/DUT/CPU/CM0/DCACHE/dirtyFrame
add wave -noupdate -group Dcache0 /system_tb/DUT/CPU/CM0/DCACHE/addr
add wave -noupdate -group Dcache0 /system_tb/DUT/CPU/CM0/DCACHE/wayCount
add wave -noupdate -group Dcache0 /system_tb/DUT/CPU/CM0/DCACHE/nextWayCount
add wave -noupdate -group Dcache0 /system_tb/DUT/CPU/CM0/DCACHE/setCount
add wave -noupdate -group Dcache0 /system_tb/DUT/CPU/CM0/DCACHE/nextSetCount
add wave -noupdate -group Dcache0 /system_tb/DUT/CPU/CM0/DCACHE/hitCount
add wave -noupdate -group Dcache0 /system_tb/DUT/CPU/CM0/DCACHE/nextHitCount
add wave -noupdate -group Dcache0 /system_tb/DUT/CPU/CM0/DCACHE/flushWait
add wave -noupdate -group Dcache0 /system_tb/DUT/CPU/CM0/DCACHE/dataIn
add wave -noupdate -group Dcache1 /system_tb/DUT/CPU/CM1/DCACHE/CLK
add wave -noupdate -group Dcache1 /system_tb/DUT/CPU/CM1/DCACHE/nRST
add wave -noupdate -group Dcache1 /system_tb/DUT/CPU/CM1/DCACHE/shit
add wave -noupdate -group Dcache1 /system_tb/DUT/CPU/CM1/DCACHE/cur
add wave -noupdate -group Dcache1 /system_tb/DUT/CPU/CM1/DCACHE/next
add wave -noupdate -group Dcache1 /system_tb/DUT/CPU/CM1/DCACHE/tempTag
add wave -noupdate -group Dcache1 /system_tb/DUT/CPU/CM1/DCACHE/dcur
add wave -noupdate -group Dcache1 /system_tb/DUT/CPU/CM1/DCACHE/dnext
add wave -noupdate -group Dcache1 /system_tb/DUT/CPU/CM1/DCACHE/dwrite
add wave -noupdate -group Dcache1 /system_tb/DUT/CPU/CM1/DCACHE/tempValue
add wave -noupdate -group Dcache1 /system_tb/DUT/CPU/CM1/DCACHE/dval
add wave -noupdate -group Dcache1 /system_tb/DUT/CPU/CM1/DCACHE/dvalnext
add wave -noupdate -group Dcache1 -expand -subitemconfig {{/system_tb/DUT/CPU/CM1/DCACHE/tags[1]} -expand {/system_tb/DUT/CPU/CM1/DCACHE/tags[1][0]} -expand} /system_tb/DUT/CPU/CM1/DCACHE/tags
add wave -noupdate -group Dcache1 /system_tb/DUT/CPU/CM1/DCACHE/dvalwrite
add wave -noupdate -group Dcache1 /system_tb/DUT/CPU/CM1/DCACHE/nextlru
add wave -noupdate -group Dcache1 /system_tb/DUT/CPU/CM1/DCACHE/tagWEN
add wave -noupdate -group Dcache1 /system_tb/DUT/CPU/CM1/DCACHE/values
add wave -noupdate -group Dcache1 /system_tb/DUT/CPU/CM1/DCACHE/valueWEN
add wave -noupdate -group Dcache1 /system_tb/DUT/CPU/CM1/DCACHE/hit
add wave -noupdate -group Dcache1 /system_tb/DUT/CPU/CM1/DCACHE/way
add wave -noupdate -group Dcache1 /system_tb/DUT/CPU/CM1/DCACHE/wWay
add wave -noupdate -group Dcache1 /system_tb/DUT/CPU/CM1/DCACHE/dirtyFrame
add wave -noupdate -group Dcache1 /system_tb/DUT/CPU/CM1/DCACHE/addr
add wave -noupdate -group Dcache1 /system_tb/DUT/CPU/CM1/DCACHE/wayCount
add wave -noupdate -group Dcache1 /system_tb/DUT/CPU/CM1/DCACHE/nextWayCount
add wave -noupdate -group Dcache1 /system_tb/DUT/CPU/CM1/DCACHE/setCount
add wave -noupdate -group Dcache1 /system_tb/DUT/CPU/CM1/DCACHE/nextSetCount
add wave -noupdate -group Dcache1 /system_tb/DUT/CPU/CM1/DCACHE/hitCount
add wave -noupdate -group Dcache1 /system_tb/DUT/CPU/CM1/DCACHE/nextHitCount
add wave -noupdate -group Dcache1 /system_tb/DUT/CPU/CM1/DCACHE/flushWait
add wave -noupdate -group Dcache1 /system_tb/DUT/CPU/CM1/DCACHE/dataIn
add wave -noupdate -group Dcache1 /system_tb/DUT/CPU/CM0/DCACHE/tags
add wave -noupdate -expand -group ccstate /system_tb/DUT/CPU/CC/cur
add wave -noupdate -expand -group ccstate /system_tb/DUT/CPU/CC/next
add wave -noupdate -group Pipe0 /system_tb/DUT/CPU/DP0/PipeReg/CLK
add wave -noupdate -group Pipe0 /system_tb/DUT/CPU/DP0/PipeReg/nRST
add wave -noupdate -group Pipe0 /system_tb/DUT/CPU/DP0/PipeReg/ihit
add wave -noupdate -group Pipe0 /system_tb/DUT/CPU/DP0/PipeReg/dhit
add wave -noupdate -group Pipe0 /system_tb/DUT/CPU/DP0/PipeReg/ifidIn
add wave -noupdate -group Pipe0 /system_tb/DUT/CPU/DP0/PipeReg/idexIn
add wave -noupdate -group Pipe0 /system_tb/DUT/CPU/DP0/PipeReg/exmemIn
add wave -noupdate -group Pipe0 /system_tb/DUT/CPU/DP0/PipeReg/memwbIn
add wave -noupdate -group Pipe0 /system_tb/DUT/CPU/DP0/PipeReg/stall
add wave -noupdate -group Pipe0 /system_tb/DUT/CPU/DP0/PipeReg/ifidFlush
add wave -noupdate -group Pipe0 /system_tb/DUT/CPU/DP0/PipeReg/idexFlush
add wave -noupdate -group Pipe0 /system_tb/DUT/CPU/DP0/PipeReg/exmemFlush
add wave -noupdate -group Pipe0 /system_tb/DUT/CPU/DP0/PipeReg/ifidOut
add wave -noupdate -group Pipe0 /system_tb/DUT/CPU/DP0/PipeReg/idexOut
add wave -noupdate -group Pipe0 /system_tb/DUT/CPU/DP0/PipeReg/exmemOut
add wave -noupdate -group Pipe0 /system_tb/DUT/CPU/DP0/PipeReg/memwbOut
add wave -noupdate -group Pipe0 /system_tb/DUT/CPU/DP0/PipeReg/ifid_en
add wave -noupdate -group Pipe0 /system_tb/DUT/CPU/DP0/PipeReg/idex_en
add wave -noupdate -group Pipe0 /system_tb/DUT/CPU/DP0/PipeReg/exmem_en
add wave -noupdate -group Pipe0 /system_tb/DUT/CPU/DP0/PipeReg/memwb_en
add wave -noupdate -group Pipe0 /system_tb/DUT/CPU/DP0/PipeReg/ifidstall_en
add wave -noupdate -group Pipe0 /system_tb/DUT/CPU/DP0/PipeReg/idexstall_en
add wave -noupdate -group Pipe1 /system_tb/DUT/CPU/DP1/PipeReg/idexstall_en
add wave -noupdate -group Pipe1 /system_tb/DUT/CPU/DP1/PipeReg/ifidstall_en
add wave -noupdate -group Pipe1 /system_tb/DUT/CPU/DP1/PipeReg/memwb_en
add wave -noupdate -group Pipe1 /system_tb/DUT/CPU/DP1/PipeReg/exmem_en
add wave -noupdate -group Pipe1 /system_tb/DUT/CPU/DP1/PipeReg/idex_en
add wave -noupdate -group Pipe1 /system_tb/DUT/CPU/DP1/PipeReg/ifid_en
add wave -noupdate -group Pipe1 /system_tb/DUT/CPU/DP1/PipeReg/memwbOut
add wave -noupdate -group Pipe1 /system_tb/DUT/CPU/DP1/PipeReg/exmemOut
add wave -noupdate -group Pipe1 /system_tb/DUT/CPU/DP1/PipeReg/idexOut
add wave -noupdate -group Pipe1 /system_tb/DUT/CPU/DP1/PipeReg/ifidOut
add wave -noupdate -group Pipe1 /system_tb/DUT/CPU/DP1/PipeReg/exmemFlush
add wave -noupdate -group Pipe1 /system_tb/DUT/CPU/DP1/PipeReg/idexFlush
add wave -noupdate -group Pipe1 /system_tb/DUT/CPU/DP1/PipeReg/ifidFlush
add wave -noupdate -group Pipe1 /system_tb/DUT/CPU/DP1/PipeReg/stall
add wave -noupdate -group Pipe1 /system_tb/DUT/CPU/DP1/PipeReg/memwbIn
add wave -noupdate -group Pipe1 /system_tb/DUT/CPU/DP1/PipeReg/exmemIn
add wave -noupdate -group Pipe1 /system_tb/DUT/CPU/DP1/PipeReg/idexIn
add wave -noupdate -group Pipe1 /system_tb/DUT/CPU/DP1/PipeReg/ifidIn
add wave -noupdate -group Pipe1 /system_tb/DUT/CPU/DP1/PipeReg/dhit
add wave -noupdate -group Pipe1 /system_tb/DUT/CPU/DP1/PipeReg/ihit
add wave -noupdate -group Pipe1 /system_tb/DUT/CPU/DP1/PipeReg/nRST
add wave -noupdate -group Pipe1 /system_tb/DUT/CPU/DP1/PipeReg/CLK
add wave -noupdate /system_tb/DUT/CPU/DP0/PipeReg/idexIn
add wave -noupdate /system_tb/DUT/CPU/DP1/PipeReg/idexIn
add wave -noupdate -divider 1
add wave -noupdate /system_tb/DUT/CPU/CC/instFlag
add wave -noupdate /system_tb/DUT/CPU/CC/inst0
add wave -noupdate /system_tb/DUT/CPU/CC/inst1
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {200000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 140
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
WaveRestoreZoom {0 ps} {2126568 ps}
