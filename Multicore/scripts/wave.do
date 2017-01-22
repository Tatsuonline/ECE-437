onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /system_tb/CLK
add wave -noupdate /system_tb/nRST
add wave -noupdate -group PC /system_tb/DUT/CPU/DP/PC/CLK
add wave -noupdate -group PC /system_tb/DUT/CPU/DP/PC/nRST
add wave -noupdate -group PC /system_tb/DUT/CPU/DP/PC/nextAddr
add wave -noupdate -group PC /system_tb/DUT/CPU/DP/PC/pcAddr
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/ALU/pout
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/ALU/nf
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/ALU/zf
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/ALU/of
add wave -noupdate -group RegisterFile /system_tb/DUT/CPU/DP/RegFile/rfif/WEN
add wave -noupdate -group RegisterFile /system_tb/DUT/CPU/DP/RegFile/rfif/wsel
add wave -noupdate -group RegisterFile /system_tb/DUT/CPU/DP/RegFile/rfif/rsel1
add wave -noupdate -group RegisterFile /system_tb/DUT/CPU/DP/RegFile/rfif/rsel2
add wave -noupdate -group RegisterFile /system_tb/DUT/CPU/DP/RegFile/rfif/wdat
add wave -noupdate -group RegisterFile /system_tb/DUT/CPU/DP/RegFile/rfif/rdat1
add wave -noupdate -group RegisterFile /system_tb/DUT/CPU/DP/RegFile/rfif/rdat2
add wave -noupdate -group RequestUnit /system_tb/DUT/CPU/DP/ReqUnit/ruif/dRead
add wave -noupdate -group RequestUnit /system_tb/DUT/CPU/DP/ReqUnit/ruif/dWrite
add wave -noupdate -group RequestUnit /system_tb/DUT/CPU/DP/ReqUnit/ruif/dhit
add wave -noupdate -group RequestUnit /system_tb/DUT/CPU/DP/ReqUnit/ruif/ihit
add wave -noupdate -group RequestUnit /system_tb/DUT/CPU/DP/ReqUnit/ruif/halt
add wave -noupdate -group RequestUnit /system_tb/DUT/CPU/DP/ReqUnit/ruif/iREN
add wave -noupdate -group RequestUnit /system_tb/DUT/CPU/DP/ReqUnit/ruif/dREN
add wave -noupdate -group RequestUnit /system_tb/DUT/CPU/DP/ReqUnit/ruif/dWEN
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
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {54 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ps} {296 ps}
