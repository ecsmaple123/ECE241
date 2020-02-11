vlib work
vlog lab5part3.v
vsim lab5part3
log {/*}
add wave {/*}

#first cycle
force {CLOCK_50} 0
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 1
force {KEY[1]} 0
force {KEY[0]} 0
run 10ns

force {CLOCK_50} 1
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 1
force {KEY[1]} 0
force {KEY[0]} 0
run 10ns

#reset
force {CLOCK_50} 0
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 1
force {KEY[1]} 0
force {KEY[0]} 1
run 10ns

force {CLOCK_50} 1
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 1
force {KEY[1]} 0
force {KEY[0]} 1
run 10ns

#load
force {CLOCK_50} 0
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 1
force {KEY[1]} 0
force {KEY[0]} 0
run 10ns

force {CLOCK_50} 1
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 1
force {KEY[1]} 0
force {KEY[0]} 0
run 10ns

#shift
force {CLOCK_50} 0
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 1
force {KEY[1]} 1
force {KEY[0]} 0
run 10ns

force {CLOCK_50} 1
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 1
force {KEY[1]} 1
force {KEY[0]} 0
run 10ns

#shift
force {CLOCK_50} 0
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 1
force {KEY[1]} 1
force {KEY[0]} 0
run 10ns

force {CLOCK_50} 1
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 1
force {KEY[1]} 1
force {KEY[0]} 0
run 10ns

#shift
force {CLOCK_50} 0
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 1
force {KEY[1]} 1
force {KEY[0]} 0
run 10ns

force {CLOCK_50} 1
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 1
force {KEY[1]} 1
force {KEY[0]} 0
run 10ns

force {CLOCK_50} 0
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 1
force {KEY[1]} 1
force {KEY[0]} 0
run 10ns

force {CLOCK_50} 1
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 1
force {KEY[1]} 1
force {KEY[0]} 0
run 10ns

force {CLOCK_50} 0
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 1
force {KEY[1]} 1
force {KEY[0]} 0
run 10ns

force {CLOCK_50} 1
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 1
force {KEY[1]} 1
force {KEY[0]} 0
run 10ns

force {CLOCK_50} 0
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 1
force {KEY[1]} 1
force {KEY[0]} 0
run 10ns

force {CLOCK_50} 1
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 1
force {KEY[1]} 1
force {KEY[0]} 0
run 10ns

force {CLOCK_50} 0
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 1
force {KEY[1]} 1
force {KEY[0]} 0
run 10ns

force {CLOCK_50} 1
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 1
force {KEY[1]} 1
force {KEY[0]} 0
run 10ns

force {CLOCK_50} 0
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 1
force {KEY[1]} 1
force {KEY[0]} 0
run 10ns

force {CLOCK_50} 1
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 1
force {KEY[1]} 1
force {KEY[0]} 0
run 10ns

force {CLOCK_50} 0
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 1
force {KEY[1]} 1
force {KEY[0]} 0
run 10ns

force {CLOCK_50} 1
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 1
force {KEY[1]} 1
force {KEY[0]} 0
run 10ns

force {CLOCK_50} 0
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 1
force {KEY[1]} 1
force {KEY[0]} 0
run 10ns

force {CLOCK_50} 1
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 1
force {KEY[1]} 1
force {KEY[0]} 0
run 10ns

force {CLOCK_50} 0
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 1
force {KEY[1]} 1
force {KEY[0]} 0
run 10ns

force {CLOCK_50} 1
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 1
force {KEY[1]} 1
force {KEY[0]} 0
run 10ns

force {CLOCK_50} 0
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 1
force {KEY[1]} 1
force {KEY[0]} 0
run 10ns

force {CLOCK_50} 1
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 1
force {KEY[1]} 1
force {KEY[0]} 0
run 10ns