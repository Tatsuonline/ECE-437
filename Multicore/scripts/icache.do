onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /icache_tb/DUT/CLK
add wave -noupdate /icache_tb/DUT/nRST
add wave -noupdate /icache_tb/DUT/cur
add wave -noupdate /icache_tb/DUT/next
add wave -noupdate /icache_tb/DUT/tags
add wave -noupdate -expand /icache_tb/DUT/addr
add wave -noupdate -expand /icache_tb/DUT/icur
add wave -noupdate /icache_tb/DUT/inext
add wave -noupdate /icache_tb/DUT/values
add wave -noupdate /icache_tb/DUT/curValue
add wave -noupdate /icache_tb/DUT/nextValue
add wave -noupdate /icache_tb/DUT/imemload
add wave -noupdate /icache_tb/DUT/WEN
add wave -noupdate /icache_tb/DUT/hit
add wave -noupdate -group ccif /icache_tb/DUT/ccif/iwait
add wave -noupdate -group ccif /icache_tb/DUT/ccif/dwait
add wave -noupdate -group ccif /icache_tb/DUT/ccif/iREN
add wave -noupdate -group ccif /icache_tb/DUT/ccif/dREN
add wave -noupdate -group ccif /icache_tb/DUT/ccif/dWEN
add wave -noupdate -group ccif /icache_tb/DUT/ccif/iload
add wave -noupdate -group ccif /icache_tb/DUT/ccif/dload
add wave -noupdate -group ccif /icache_tb/DUT/ccif/dstore
add wave -noupdate -group ccif /icache_tb/DUT/ccif/iaddr
add wave -noupdate -group ccif /icache_tb/DUT/ccif/daddr
add wave -noupdate -group ccif /icache_tb/DUT/ccif/ccwait
add wave -noupdate -group ccif /icache_tb/DUT/ccif/ccinv
add wave -noupdate -group ccif /icache_tb/DUT/ccif/ccwrite
add wave -noupdate -group ccif /icache_tb/DUT/ccif/cctrans
add wave -noupdate -group ccif /icache_tb/DUT/ccif/ccsnoopaddr
add wave -noupdate -group ccif /icache_tb/DUT/ccif/ramWEN
add wave -noupdate -group ccif /icache_tb/DUT/ccif/ramREN
add wave -noupdate -group ccif /icache_tb/DUT/ccif/ramstate
add wave -noupdate -group ccif /icache_tb/DUT/ccif/ramaddr
add wave -noupdate -group ccif /icache_tb/DUT/ccif/ramstore
add wave -noupdate -group ccif /icache_tb/DUT/ccif/ramload
add wave -noupdate -group ccif /icache_tb/DUT/ccif/iwait
add wave -noupdate -group ccif /icache_tb/DUT/ccif/iload
add wave -noupdate -group ccif /icache_tb/DUT/ccif/iREN
add wave -noupdate -group ccif /icache_tb/DUT/ccif/iaddr
add wave -noupdate -expand -group dcif /icache_tb/DUT/dcif/halt
add wave -noupdate -expand -group dcif /icache_tb/DUT/dcif/ihit
add wave -noupdate -expand -group dcif /icache_tb/DUT/dcif/imemREN
add wave -noupdate -expand -group dcif /icache_tb/DUT/dcif/imemload
add wave -noupdate -expand -group dcif /icache_tb/DUT/dcif/imemaddr
add wave -noupdate -expand -group dcif /icache_tb/DUT/dcif/dhit
add wave -noupdate -expand -group dcif /icache_tb/DUT/dcif/datomic
add wave -noupdate -expand -group dcif /icache_tb/DUT/dcif/dmemREN
add wave -noupdate -expand -group dcif /icache_tb/DUT/dcif/dmemWEN
add wave -noupdate -expand -group dcif /icache_tb/DUT/dcif/flushed
add wave -noupdate -expand -group dcif /icache_tb/DUT/dcif/dmemload
add wave -noupdate -expand -group dcif /icache_tb/DUT/dcif/dmemstore
add wave -noupdate -expand -group dcif /icache_tb/DUT/dcif/dmemaddr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {108308 ps} 0}
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
WaveRestoreZoom {0 ps} {152250 ps}
