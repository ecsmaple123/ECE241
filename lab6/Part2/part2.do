# set the working dir, where all compiled verilog goes
vlib work

# compile all verilog modules in mux.v to working dir
# could also have multiple verilog files
vlog poly_function.v

#load simulation using mux as the top level simulation module
vsim poly_function

#log all signals and add some signals to waveform window
log {/*}
# add wave {/*} would add all items in top level simulation module
add wave {/*}

# Clock low, no change
force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 0
force {KEY[0]} 0
force {KEY[1]} 0
force {CLOCK_50} 0
run 10ns

# Pos edge of clock
# Reset values
# No longer reset
force {CLOCK_50} 1
run 10ns

force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 0
force {KEY[0]} 1 
force {KEY[1]} 1
force {CLOCK_50} 0
run 10ns

# Pos edge of clock
force {CLOCK_50} 1
run 10ns

force {KEY[1]} 0
force {CLOCK_50} 0
run 10ns

force {CLOCK_50} 1
run 10ns

force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 0
force {KEY[1]} 1
force {CLOCK_50} 0
run 10ns

force {CLOCK_50} 1
run 10ns

force {KEY[1]} 0
force {CLOCK_50} 0
run 10ns

force {CLOCK_50} 1
run 10ns

force {KEY[1]} 1
force {CLOCK_50} 0
run 10ns


force {CLOCK_50} 1
run 10ns

force {KEY[1]} 0
force {CLOCK_50} 0
run 10ns

force {CLOCK_50} 1
run 10ns

force {KEY[1]} 1
force {CLOCK_50} 0
run 10ns


force {CLOCK_50} 1
run 10ns

force {KEY[1]} 0
force {CLOCK_50} 0
run 10ns

force {CLOCK_50} 1
run 10ns

force {KEY[1]} 1
force {CLOCK_50} 0
run 10ns


force {CLOCK_50} 1
run 10ns

force {KEY[1]} 0
force {CLOCK_50} 0
run 10ns

force {CLOCK_50} 1
run 10ns

force {KEY[1]} 1
force {CLOCK_50} 0
run 10ns

force {CLOCK_50} 1
run 10ns

force {KEY[1]} 0
force {CLOCK_50} 0
run 10ns

force {CLOCK_50} 1
run 10ns

force {KEY[1]} 1
force {CLOCK_50} 0
run 10ns

force {CLOCK_50} 1
run 10ns

force {KEY[1]} 0
force {CLOCK_50} 0
run 10ns

force {CLOCK_50} 1
run 10ns

force {KEY[1]} 1
force {CLOCK_50} 0
run 10ns


force {CLOCK_50} 1
run 10ns

force {KEY[1]} 0
force {CLOCK_50} 0
run 10ns

force {CLOCK_50} 1
run 10ns

force {KEY[1]} 1
force {CLOCK_50} 0
run 10ns


force {CLOCK_50} 1
run 10ns

force {KEY[1]} 0
force {CLOCK_50} 0
run 10ns

force {CLOCK_50} 1
run 10ns

force {KEY[1]} 1
force {CLOCK_50} 0
run 10ns


force {CLOCK_50} 1
run 10ns

force {KEY[1]} 0
force {CLOCK_50} 0
run 10ns

force {CLOCK_50} 1
run 10ns

force {KEY[1]} 1
force {CLOCK_50} 0
run 10ns


force {CLOCK_50} 1
run 10ns

force {KEY[1]} 0
force {CLOCK_50} 0
run 10ns

force {CLOCK_50} 1
run 10ns

force {KEY[1]} 1
force {CLOCK_50} 0
run 10ns

force {CLOCK_50} 1
run 10ns

force {KEY[1]} 0
force {CLOCK_50} 0
run 10ns

force {CLOCK_50} 1
run 10ns

force {KEY[1]} 1
force {CLOCK_50} 0
run 10ns

force {CLOCK_50} 1
run 10ns

force {KEY[1]} 0
force {CLOCK_50} 0
run 10ns

force {CLOCK_50} 1
run 10ns

force {KEY[1]} 1
force {CLOCK_50} 0
run 10ns

force {CLOCK_50} 1
run 10ns

force {KEY[1]} 0
force {CLOCK_50} 0
run 10ns

force {CLOCK_50} 1
run 10ns

force {KEY[1]} 1
force {CLOCK_50} 0
run 10ns

force {CLOCK_50} 1
run 10ns

force {KEY[1]} 0
force {CLOCK_50} 0
run 10ns

force {CLOCK_50} 1
run 10ns

force {KEY[1]} 1
force {CLOCK_50} 0
run 10ns

force {CLOCK_50} 1
run 10ns

force {KEY[1]} 0
force {CLOCK_50} 0
run 10ns

force {CLOCK_50} 1
run 10ns

force {KEY[1]} 1
force {CLOCK_50} 0
run 10ns







