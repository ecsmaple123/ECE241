vlib work
vlog lab7part3.v
vsim datapath
log {/*}
add wave {/*}

force {clk} 0
force {enable_plt} 0
force {resetn} 0
force {erase} 0
force {update} 0
force {reset} 0
force {clr[2]} 1
force {clr[1]} 1
force {clr[0]} 1

run 10ns

force {clk} 1
force {enable_plt} 0
force {resetn} 0
force {erase} 0
force {update} 0
force {reset} 0
force {clr[2]} 1
force {clr[1]} 1
force {clr[0]} 1

run 10ns

force {clk} 0
force {enable_plt} 0
force {resetn} 0
force {erase} 0
force {update} 0
force {reset} 0
force {clr[2]} 1
force {clr[1]} 1
force {clr[0]} 1

run 10ns

force {clk} 1
force {enable_plt} 1
force {resetn} 0
force {erase} 0
force {update} 0
force {reset} 0
force {clr[2]} 1
force {clr[1]} 1
force {clr[0]} 1

run 10ns

force {clk} 0
force {enable_plt} 0
force {resetn} 0
force {erase} 0
force {update} 0
force {reset} 0
force {clr[2]} 1
force {clr[1]} 1
force {clr[0]} 1

run 10ns

force {clk} 1
force {enable_plt} 0
force {resetn} 0
force {erase} 1
force {update} 0
force {reset} 0
force {clr[2]} 1
force {clr[1]} 1
force {clr[0]} 1

run 10ns

force {clk} 0
force {enable_plt} 0
force {resetn} 0
force {erase} 0
force {update} 0
force {reset} 0
force {clr[2]} 1
force {clr[1]} 1
force {clr[0]} 1

run 10ns

force {clk} 1
force {enable_plt} 0
force {resetn} 0
force {erase} 0
force {update} 1
force {reset} 0
force {clr[2]} 1
force {clr[1]} 1
force {clr[0]} 1

run 10ns