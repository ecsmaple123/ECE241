
vlib work
vlog lab3part3.v
vsim lab3part3
log {/*}
add wave {/*}

force {KEY[0]} 1
force {KEY[1]} 1
force {KEY[2]} 1
force {SW[7]} 1
force {SW[6]} 1
force {SW[5]} 0
force {SW[4]} 0
force {SW[3]} 0
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 1

run 10ns

# test function 0 1000 + 1000- works

force {KEY[0]} 1
force {KEY[1]} 1
force {KEY[2]} 1
force {SW[7]} 1
force {SW[6]} 0
force {SW[5]} 0
force {SW[4]} 0
force {SW[3]} 1
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 0

run 10ns

# test function 1 1000+0001 - works

force {KEY[0]} 0
force {KEY[1]} 1
force {KEY[2]} 1
force {SW[7]} 1
force {SW[6]} 0
force {SW[5]} 0
force {SW[4]} 0
force {SW[3]} 0
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 1

run 10ns

# test function 1 1000+1101 - works

force {KEY[0]} 0
force {KEY[1]} 1
force {KEY[2]} 1
force {SW[7]} 1
force {SW[6]} 0
force {SW[5]} 0
force {SW[4]} 0
force {SW[3]} 1
force {SW[2]} 1
force {SW[1]} 0
force {SW[0]} 1

run 10ns

# test function 2 - works

force {KEY[0]} 1
force {KEY[1]} 0
force {KEY[2]} 1
force {SW[7]} 1
force {SW[6]} 0
force {SW[5]} 0
force {SW[4]} 0
force {SW[3]} 1
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 1

run 10ns

# test function 2 - works

force {KEY[0]} 1
force {KEY[1]} 0
force {KEY[2]} 1
force {SW[7]} 0
force {SW[6]} 1
force {SW[5]} 1
force {SW[4]} 1
force {SW[3]} 1
force {SW[2]} 1
force {SW[1]} 1
force {SW[0]} 1

run 10ns

# test function 3 - works

force {KEY[0]} 0
force {KEY[1]} 0
force {KEY[2]} 1
force {SW[7]} 1
force {SW[6]} 0
force {SW[5]} 0
force {SW[4]} 0
force {SW[3]} 0
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 1

run 10ns

# test function 3 - works

force {KEY[0]} 0
force {KEY[1]} 0
force {KEY[2]} 1
force {SW[7]} 0
force {SW[6]} 0
force {SW[5]} 0
force {SW[4]} 0
force {SW[3]} 0
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 0

run 10ns

# test function 4 - works

force {KEY[0]} 1
force {KEY[1]} 1
force {KEY[2]} 0
force {SW[7]} 1
force {SW[6]} 0
force {SW[5]} 0
force {SW[4]} 0
force {SW[3]} 0
force {SW[2]} 0
force {SW[1]} 1
force {SW[0]} 1

run 10ns

# test function 4 

force {KEY[0]} 1
force {KEY[1]} 1
force {KEY[2]} 0
force {SW[7]} 1
force {SW[6]} 0
force {SW[5]} 0
force {SW[4]} 0
force {SW[3]} 1
force {SW[2]} 1
force {SW[1]} 1
force {SW[0]} 1

run 10ns

# test function 5 - works

force {KEY[0]} 0
force {KEY[1]} 1
force {KEY[2]} 0
force {SW[7]} 1
force {SW[6]} 0
force {SW[5]} 1
force {SW[4]} 0
force {SW[3]} 0
force {SW[2]} 1
force {SW[1]} 0
force {SW[0]} 1

run 10ns