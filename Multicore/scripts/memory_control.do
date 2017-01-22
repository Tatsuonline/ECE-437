onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /memory_control_tb/CLK
add wave -noupdate /memory_control_tb/nRST
add wave -noupdate /memory_control_tb/Mem/cur
add wave -noupdate /memory_control_tb/Mem/next
add wave -noupdate -expand -group {New Group} /memory_control_tb/Mem/ccif/CPUS
add wave -noupdate -expand -group {New Group} /memory_control_tb/Mem/ccif/CPUID
add wave -noupdate -expand -group {New Group} /memory_control_tb/Mem/ccif/iwait
add wave -noupdate -expand -group {New Group} /memory_control_tb/Mem/ccif/dwait
add wave -noupdate -expand -group {New Group} /memory_control_tb/Mem/ccif/iREN
add wave -noupdate -expand -group {New Group} /memory_control_tb/Mem/ccif/dREN
add wave -noupdate -expand -group {New Group} /memory_control_tb/Mem/ccif/dWEN
add wave -noupdate -expand -group {New Group} /memory_control_tb/Mem/ccif/iload
add wave -noupdate -expand -group {New Group} /memory_control_tb/Mem/ccif/dload
add wave -noupdate -expand -group {New Group} /memory_control_tb/Mem/ccif/dstore
add wave -noupdate -expand -group {New Group} /memory_control_tb/Mem/ccif/iaddr
add wave -noupdate -expand -group {New Group} /memory_control_tb/Mem/ccif/daddr
add wave -noupdate -expand -group {New Group} /memory_control_tb/Mem/ccif/ccwait
add wave -noupdate -expand -group {New Group} /memory_control_tb/Mem/ccif/ccinv
add wave -noupdate -expand -group {New Group} /memory_control_tb/Mem/ccif/ccwrite
add wave -noupdate -expand -group {New Group} /memory_control_tb/Mem/ccif/cctrans
add wave -noupdate -expand -group {New Group} /memory_control_tb/Mem/ccif/ccsnoopaddr
add wave -noupdate -expand -group {New Group} /memory_control_tb/Mem/ccif/ramWEN
add wave -noupdate -expand -group {New Group} /memory_control_tb/Mem/ccif/ramREN
add wave -noupdate -expand -group {New Group} /memory_control_tb/Mem/ccif/ramstate
add wave -noupdate -expand -group {New Group} /memory_control_tb/Mem/ccif/ramaddr
add wave -noupdate -expand -group {New Group} /memory_control_tb/Mem/ccif/ramstore
add wave -noupdate -expand -group {New Group} /memory_control_tb/Mem/ccif/ramload
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
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
WaveRestoreZoom {37050 ps} {38050 ps}
