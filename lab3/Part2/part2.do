
vlib work
vlog lab3part2.v
vsim lab3part2

log {/*}
add wave {/*}

# test 0000+0001 with cin = 0

force {SW[8]} 0
force {SW[7]} 0
force {SW[6]} 0
force {SW[5]} 0
force {SW[4]} 0
force {SW[3]} 0
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 1
#0001
run 10ns 

# test 1000+0001 with cin = 0

force {SW[8]} 0
force {SW[7]} 1
force {SW[6]} 0
force {SW[5]} 0
force {SW[4]} 0
force {SW[3]} 0
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 1

run 10ns 

# test 1000+0001 with cin = 1

force {SW[8]} 1
force {SW[7]} 1
force {SW[6]} 0
force {SW[5]} 0
force {SW[4]} 0
force {SW[3]} 0
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 1
#1010
run 10ns 

# test cout with 1000+1000

force {SW[8]} 0
force {SW[7]} 1
force {SW[6]} 0
force {SW[5]} 0
force {SW[4]} 0
force {SW[3]} 1
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 0
#0000 cout = 1
run 10ns 

# test 1101 + 0111

force {SW[8]} 0
force {SW[7]} 1
force {SW[6]} 1
force {SW[5]} 0
force {SW[4]} 1
force {SW[3]} 0
force {SW[2]} 1
force {SW[1]} 1
force {SW[0]} 1
#0100 cout = 1
run 10ns 