vlib work
vlog lab3part2.v
vsim lab3part2
log {/*}
add wave {/*}

#test case 1100+0001 cin = 0
# result 1101 cout = 0
force {SW[8]} 0
force {SW[7]} 1
force {SW[6]} 1
force {SW[5]} 0
force {SW[4]} 0
force {SW[3]} 0
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 1
run 10ns

#test case 1000+1000 cin = 0
# result 0000 cout = 1
force {SW[8]} 0
force {SW[7]} 1
force {SW[6]} 0
force {SW[5]} 0
force {SW[4]} 0
force {SW[3]} 1
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 0
run 10ns

#test case 0010+0010 cin = 0
# result 0100 cout = 0
force {SW[8]} 0
force {SW[7]} 0
force {SW[6]} 0
force {SW[5]} 1
force {SW[4]} 0
force {SW[3]} 0
force {SW[2]} 0
force {SW[1]} 1
force {SW[0]} 0
run 10ns

#test case 0001+0001 cin = 0
# result 0010 cout = 0
#test case
force {SW[8]} 0
force {SW[7]} 0
force {SW[6]} 0
force {SW[5]} 0
force {SW[4]} 1
force {SW[3]} 0
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 1
run 10ns

#test case 0101+0010 cin = 1
# result 1000 cout = 0
#test case
force {SW[8]} 1
force {SW[7]} 0
force {SW[6]} 1
force {SW[5]} 0
force {SW[4]} 1
force {SW[3]} 0
force {SW[2]} 0
force {SW[1]} 1
force {SW[0]} 0
run 10ns

#test case 0101+0011 cin = 1
# result 1001 cout = 0
#test case
force {SW[8]} 1
force {SW[7]} 0
force {SW[6]} 1
force {SW[5]} 0
force {SW[4]} 1
force {SW[3]} 0
force {SW[2]} 0
force {SW[1]} 1
force {SW[0]} 1
run 10ns
