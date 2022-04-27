onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_alu/Clock
add wave -noupdate /tb_alu/Reset
add wave -noupdate /tb_alu/button_in
add wave -noupdate /tb_alu/pulse_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {980309 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 155
configure wave -valuecolwidth 84
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {977297 ns} {999889 ns}
