onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /dcache_tb/CLK
add wave -noupdate /dcache_tb/nRST
add wave -noupdate -group m /dcache_tb/DUT/CLK
add wave -noupdate -group m /dcache_tb/DUT/nRST
add wave -noupdate -group m /dcache_tb/DUT/i
add wave -noupdate -group m /dcache_tb/DUT/j
add wave -noupdate -group m /dcache_tb/DUT/cur
add wave -noupdate -group m /dcache_tb/DUT/next
add wave -noupdate -group m /dcache_tb/DUT/tags
add wave -noupdate -group m /dcache_tb/DUT/tempTag
add wave -noupdate -group m /dcache_tb/DUT/dcur
add wave -noupdate -group m /dcache_tb/DUT/dnext
add wave -noupdate -group m /dcache_tb/DUT/dwrite
add wave -noupdate -group m /dcache_tb/DUT/values
add wave -noupdate -group m /dcache_tb/DUT/tempValue
add wave -noupdate -group m /dcache_tb/DUT/dval
add wave -noupdate -group m /dcache_tb/DUT/dvalnext
add wave -noupdate -group m /dcache_tb/DUT/dvalwrite
add wave -noupdate -group m /dcache_tb/DUT/lru
add wave -noupdate -group m /dcache_tb/DUT/nextlru
add wave -noupdate -group m /dcache_tb/DUT/wayCount
add wave -noupdate -group m /dcache_tb/DUT/nextWayCount
add wave -noupdate -group m /dcache_tb/DUT/hit
add wave -noupdate -group m /dcache_tb/DUT/way
add wave -noupdate -group m /dcache_tb/DUT/wWay
add wave -noupdate -group m /dcache_tb/DUT/tagWEN
add wave -noupdate -group m /dcache_tb/DUT/valueWEN
add wave -noupdate -group m /dcache_tb/DUT/dirtyFrame
add wave -noupdate -group m /dcache_tb/DUT/addr
add wave -noupdate -group m /dcache_tb/DUT/setCount
add wave -noupdate -group m /dcache_tb/DUT/nextSetCount
add wave -noupdate -group m /dcache_tb/DUT/hitCount
add wave -noupdate -group m /dcache_tb/DUT/nextHitCount
add wave -noupdate -group m /dcache_tb/DUT/flushWait
add wave -noupdate -expand -group dc /dcache_tb/DUT/dcif/halt
add wave -noupdate -expand -group dc /dcache_tb/DUT/dcif/ihit
add wave -noupdate -expand -group dc /dcache_tb/DUT/dcif/imemREN
add wave -noupdate -expand -group dc /dcache_tb/DUT/dcif/imemload
add wave -noupdate -expand -group dc /dcache_tb/DUT/dcif/imemaddr
add wave -noupdate -expand -group dc /dcache_tb/DUT/dcif/dhit
add wave -noupdate -expand -group dc /dcache_tb/DUT/dcif/datomic
add wave -noupdate -expand -group dc /dcache_tb/DUT/dcif/dmemREN
add wave -noupdate -expand -group dc /dcache_tb/DUT/dcif/dmemWEN
add wave -noupdate -expand -group dc /dcache_tb/DUT/dcif/flushed
add wave -noupdate -expand -group dc -radix unsigned /dcache_tb/DUT/dcif/dmemload
add wave -noupdate -expand -group dc -radix decimal /dcache_tb/DUT/dcif/dmemstore
add wave -noupdate -expand -group dc -radix decimal /dcache_tb/DUT/dcif/dmemaddr
add wave -noupdate -expand -group cc /dcache_tb/DUT/ccif/iwait
add wave -noupdate -expand -group cc /dcache_tb/DUT/ccif/dwait
add wave -noupdate -expand -group cc /dcache_tb/DUT/ccif/iREN
add wave -noupdate -expand -group cc /dcache_tb/DUT/ccif/dREN
add wave -noupdate -expand -group cc /dcache_tb/DUT/ccif/dWEN
add wave -noupdate -expand -group cc /dcache_tb/DUT/ccif/iload
add wave -noupdate -expand -group cc -radix unsigned /dcache_tb/DUT/ccif/dload
add wave -noupdate -expand -group cc -radix decimal /dcache_tb/DUT/ccif/dstore
add wave -noupdate -expand -group cc /dcache_tb/DUT/ccif/iaddr
add wave -noupdate -expand -group cc -radix decimal /dcache_tb/DUT/ccif/daddr
add wave -noupdate -expand -group cc /dcache_tb/DUT/ccif/ccwait
add wave -noupdate -expand -group cc /dcache_tb/DUT/ccif/ccinv
add wave -noupdate -expand -group cc /dcache_tb/DUT/ccif/ccwrite
add wave -noupdate -expand -group cc /dcache_tb/DUT/ccif/cctrans
add wave -noupdate -expand -group cc /dcache_tb/DUT/ccif/ccsnoopaddr
add wave -noupdate -expand -group cc /dcache_tb/DUT/ccif/ramWEN
add wave -noupdate -expand -group cc /dcache_tb/DUT/ccif/ramREN
add wave -noupdate -expand -group cc /dcache_tb/DUT/ccif/ramstate
add wave -noupdate -expand -group cc /dcache_tb/DUT/ccif/ramaddr
add wave -noupdate -expand -group cc /dcache_tb/DUT/ccif/ramstore
add wave -noupdate -expand -group cc /dcache_tb/DUT/ccif/ramload
add wave -noupdate -expand -group cc /dcache_tb/DUT/ccif/dwait
add wave -noupdate -expand -group cc /dcache_tb/DUT/ccif/dload
add wave -noupdate -expand -group cc /dcache_tb/DUT/ccif/ccwait
add wave -noupdate -expand -group cc /dcache_tb/DUT/ccif/ccinv
add wave -noupdate -expand -group cc /dcache_tb/DUT/ccif/ccsnoopaddr
add wave -noupdate -expand -group cc /dcache_tb/DUT/ccif/dREN
add wave -noupdate -expand -group cc /dcache_tb/DUT/ccif/dWEN
add wave -noupdate -expand -group cc /dcache_tb/DUT/ccif/daddr
add wave -noupdate -expand -group cc /dcache_tb/DUT/ccif/dstore
add wave -noupdate -expand -group cc /dcache_tb/DUT/ccif/ccwrite
add wave -noupdate -expand -group cc /dcache_tb/DUT/ccif/cctrans
add wave -noupdate -expand -group LAMB /dcache_tb/RAM/ramif/ramREN
add wave -noupdate -expand -group LAMB /dcache_tb/RAM/ramif/ramWEN
add wave -noupdate -expand -group LAMB -radix unsigned /dcache_tb/RAM/ramif/ramaddr
add wave -noupdate -expand -group LAMB -radix unsigned /dcache_tb/RAM/ramif/ramstore
add wave -noupdate -expand -group LAMB /dcache_tb/RAM/ramif/ramload
add wave -noupdate -expand -group LAMB /dcache_tb/RAM/ramif/ramstate
add wave -noupdate -expand -group LAMB /dcache_tb/RAM/ramif/memREN
add wave -noupdate -expand -group LAMB /dcache_tb/RAM/ramif/memWEN
add wave -noupdate -expand -group LAMB /dcache_tb/RAM/ramif/memaddr
add wave -noupdate -expand -group LAMB /dcache_tb/RAM/ramif/memstore
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {39763 ps} 0}
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
WaveRestoreZoom {0 ps} {357 ns}
