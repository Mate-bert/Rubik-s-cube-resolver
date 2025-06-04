onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group mem_reader /top_tb/UUT/memory_reader_inst/i_clk
add wave -noupdate -group mem_reader /top_tb/UUT/memory_reader_inst/i_rst
add wave -noupdate -group mem_reader /top_tb/UUT/memory_reader_inst/i_go
add wave -noupdate -group mem_reader /top_tb/UUT/memory_reader_inst/i_done
add wave -noupdate -group mem_reader /top_tb/UUT/memory_reader_inst/o_cmd
add wave -noupdate -group mem_reader /top_tb/UUT/memory_reader_inst/o_new
add wave -noupdate -group mem_reader /top_tb/UUT/memory_reader_inst/bram_addr
add wave -noupdate -group mem_reader /top_tb/UUT/memory_reader_inst/bram_clk
add wave -noupdate -group mem_reader /top_tb/UUT/memory_reader_inst/bram_din
add wave -noupdate -group mem_reader /top_tb/UUT/memory_reader_inst/bram_dout
add wave -noupdate -group mem_reader /top_tb/UUT/memory_reader_inst/bram_en
add wave -noupdate -group mem_reader /top_tb/UUT/memory_reader_inst/bram_rst
add wave -noupdate -group mem_reader /top_tb/UUT/memory_reader_inst/bram_we
add wave -noupdate -group mem_reader /top_tb/UUT/memory_reader_inst/send_state
add wave -noupdate -group mem_reader /top_tb/UUT/memory_reader_inst/s_count_addr
add wave -noupdate -expand -group rubik /top_tb/UUT/rubik_resolve_inst/i_clk
add wave -noupdate -expand -group rubik /top_tb/UUT/rubik_resolve_inst/i_rst
add wave -noupdate -expand -group rubik /top_tb/UUT/rubik_resolve_inst/i_cmd
add wave -noupdate -expand -group rubik /top_tb/UUT/rubik_resolve_inst/i_new
add wave -noupdate -expand -group rubik /top_tb/UUT/rubik_resolve_inst/o_done
add wave -noupdate -expand -group rubik /top_tb/UUT/rubik_resolve_inst/o_m1
add wave -noupdate -expand -group rubik /top_tb/UUT/rubik_resolve_inst/o_m2
add wave -noupdate -expand -group rubik /top_tb/UUT/rubik_resolve_inst/o_m3
add wave -noupdate -expand -group rubik /top_tb/UUT/rubik_resolve_inst/o_m4
add wave -noupdate -expand -group rubik /top_tb/UUT/rubik_resolve_inst/o_m5
add wave -noupdate -expand -group rubik /top_tb/UUT/rubik_resolve_inst/o_m6
add wave -noupdate -expand -group rubik /top_tb/UUT/rubik_resolve_inst/o_leds
add wave -noupdate -expand -group rubik /top_tb/UUT/rubik_resolve_inst/s_state
add wave -noupdate -expand -group rubik /top_tb/UUT/rubik_resolve_inst/s_cmd_d
add wave -noupdate -expand -group rubik /top_tb/UUT/rubik_resolve_inst/s_done
add wave -noupdate -expand -group rubik /top_tb/UUT/rubik_resolve_inst/s_start_cnt_phase
add wave -noupdate -expand -group rubik /top_tb/UUT/rubik_resolve_inst/s_cpt_phase
add wave -noupdate -expand -group rubik /top_tb/UUT/rubik_resolve_inst/s_next_phase
add wave -noupdate -expand -group rubik /top_tb/UUT/rubik_resolve_inst/s_cpt_loop
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
WaveRestoreZoom {0 ps} {1 ns}
