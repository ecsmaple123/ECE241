vlib work
vlog lab7part2.v
vsim datapath
log {/*}
add wave {/*}

force {clk} 0
force {resetn} 0
force {ld_x} 0
force {ld_y} 0
force {ld_clr} 0
force {enable_plt} 0
force {enable_blk} 0
force {datain[7]} 0
force {datain[6]} 0
force {datain[5]} 0
force {datain[4]} 0
force {datain[3]} 0
force {datain[2]} 0
force {datain[1]} 0
force {datain[0]} 0
force {clr[2]} 0
force {clr[1]} 0
force {clr[0]} 0

run 10ns

force {clk} 1
force {resetn} 0
force {ld_x} 0
force {ld_y} 0
force {ld_clr} 0
force {enable_plt} 0
force {enable_blk} 0
force {datain[7]} 0
force {datain[6]} 0
force {datain[5]} 0
force {datain[4]} 0
force {datain[3]} 0
force {datain[2]} 0
force {datain[1]} 0
force {datain[0]} 0
force {clr[2]} 0
force {clr[1]} 0
force {clr[0]} 0

run 10ns

force {clk} 0
force {resetn} 1
force {ld_x} 1
force {ld_y} 0
force {ld_clr} 0
force {enable_plt} 0
force {enable_blk} 0
force {datain[7]} 0
force {datain[6]} 1
force {datain[5]} 1
force {datain[4]} 0
force {datain[3]} 0
force {datain[2]} 1
force {datain[1]} 0
force {datain[0]} 0
force {clr[2]} 0
force {clr[1]} 0
force {clr[0]} 0

run 10ns

force {clk} 1
force {resetn} 1
force {ld_x} 1
force {ld_y} 0
force {ld_clr} 0
force {enable_plt} 0
force {enable_blk} 0
force {datain[7]} 0
force {datain[6]} 1
force {datain[5]} 1
force {datain[4]} 0
force {datain[3]} 0
force {datain[2]} 1
force {datain[1]} 0
force {datain[0]} 0
force {clr[2]} 0
force {clr[1]} 0
force {clr[0]} 0

run 10ns

force {clk} 0
force {resetn} 1
force {ld_x} 1
force {ld_y} 0
force {ld_clr} 0
force {enable_plt} 0
force {enable_blk} 0
force {datain[7]} 0
force {datain[6]} 1
force {datain[5]} 1
force {datain[4]} 0
force {datain[3]} 0
force {datain[2]} 1
force {datain[1]} 0
force {datain[0]} 0
force {clr[2]} 0
force {clr[1]} 0
force {clr[0]} 0

run 10ns

force {clk} 1
force {resetn} 1
force {ld_x} 0
force {ld_y} 1
force {ld_clr} 0
force {enable_plt} 0
force {enable_blk} 0
force {datain[7]} 0
force {datain[6]} 1
force {datain[5]} 0
force {datain[4]} 1
force {datain[3]} 0
force {datain[2]} 0
force {datain[1]} 0
force {datain[0]} 0
force {clr[2]} 0
force {clr[1]} 0
force {clr[0]} 0

run 10ns

force {clk} 0
force {resetn} 1
force {ld_x} 0
force {ld_y} 0
force {ld_clr} 0
force {enable_plt} 0
force {enable_blk} 0
force {datain[7]} 0
force {datain[6]} 1
force {datain[5]} 1
force {datain[4]} 0
force {datain[3]} 0
force {datain[2]} 1
force {datain[1]} 0
force {datain[0]} 0
force {clr[2]} 0
force {clr[1]} 0
force {clr[0]} 0

run 10ns

force {clk} 1
force {resetn} 1
force {ld_x} 0
force {ld_y} 0
force {ld_clr} 1
force {enable_plt} 0
force {enable_blk} 0
force {datain[7]} 0
force {datain[6]} 1
force {datain[5]} 1
force {datain[4]} 0
force {datain[3]} 0
force {datain[2]} 1
force {datain[1]} 0
force {datain[0]} 0
force {clr[2]} 1
force {clr[1]} 1
force {clr[0]} 1

run 10ns

force {clk} 0
force {resetn} 1
force {ld_x} 0
force {ld_y} 0
force {ld_clr} 1
force {enable_plt} 0
force {enable_blk} 0
force {datain[7]} 0
force {datain[6]} 1
force {datain[5]} 1
force {datain[4]} 0
force {datain[3]} 0
force {datain[2]} 1
force {datain[1]} 0
force {datain[0]} 0
force {clr[2]} 1
force {clr[1]} 1
force {clr[0]} 1

run 10ns

force {clk} 1
force {resetn} 0
force {ld_x} 0
force {ld_y} 0
force {ld_clr} 1
force {enable_plt} 0
force {enable_blk} 0
force {datain[7]} 0
force {datain[6]} 1
force {datain[5]} 1
force {datain[4]} 0
force {datain[3]} 0
force {datain[2]} 1
force {datain[1]} 0
force {datain[0]} 0
force {clr[2]} 1
force {clr[1]} 1
force {clr[0]} 1

run 10ns