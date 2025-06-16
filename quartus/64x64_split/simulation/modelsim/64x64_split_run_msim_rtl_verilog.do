transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Omar/Desktop/fpga-image-pipeline/quartus/64x64_split {C:/Users/Omar/Desktop/fpga-image-pipeline/quartus/64x64_split/kernel_ops_dual.v}
vlog -vlog01compat -work work +incdir+C:/Users/Omar/Desktop/fpga-image-pipeline/quartus/64x64_split {C:/Users/Omar/Desktop/fpga-image-pipeline/quartus/64x64_split/kernel_mem_fetch_dual.v}
vlog -vlog01compat -work work +incdir+C:/Users/Omar/Desktop/fpga-image-pipeline/quartus/64x64_split {C:/Users/Omar/Desktop/fpga-image-pipeline/quartus/64x64_split/kernel_3x3_2.v}
vlog -vlog01compat -work work +incdir+C:/Users/Omar/Desktop/fpga-image-pipeline/quartus/64x64_split {C:/Users/Omar/Desktop/fpga-image-pipeline/quartus/64x64_split/kernel_3x3_1.v}
vlog -vlog01compat -work work +incdir+C:/Users/Omar/Desktop/fpga-image-pipeline/quartus/64x64_split {C:/Users/Omar/Desktop/fpga-image-pipeline/quartus/64x64_split/image_rom_dual.v}

vlog -vlog01compat -work work +incdir+C:/Users/Omar/Desktop/fpga-image-pipeline/quartus/64x64_split {C:/Users/Omar/Desktop/fpga-image-pipeline/quartus/64x64_split/tb_kernel_ops_dual.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  tb_kernel_ops_dual

add wave *
view structure
view signals
run -all
