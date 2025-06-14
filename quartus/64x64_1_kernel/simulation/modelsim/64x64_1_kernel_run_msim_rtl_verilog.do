transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Omar/Desktop/fpga-image-pipeline/quartus/64x64_1_kernel {C:/Users/Omar/Desktop/fpga-image-pipeline/quartus/64x64_1_kernel/kernel_ops.v}
vlog -vlog01compat -work work +incdir+C:/Users/Omar/Desktop/fpga-image-pipeline/quartus/64x64_1_kernel {C:/Users/Omar/Desktop/fpga-image-pipeline/quartus/64x64_1_kernel/kernel_mem_fetch.v}
vlog -vlog01compat -work work +incdir+C:/Users/Omar/Desktop/fpga-image-pipeline/quartus/64x64_1_kernel {C:/Users/Omar/Desktop/fpga-image-pipeline/quartus/64x64_1_kernel/kernel_3x3.v}
vlog -vlog01compat -work work +incdir+C:/Users/Omar/Desktop/fpga-image-pipeline/quartus/64x64_1_kernel {C:/Users/Omar/Desktop/fpga-image-pipeline/quartus/64x64_1_kernel/image_rom.v}

vlog -vlog01compat -work work +incdir+C:/Users/Omar/Desktop/fpga-image-pipeline/quartus/64x64_1_kernel {C:/Users/Omar/Desktop/fpga-image-pipeline/quartus/64x64_1_kernel/tb_kernel_ops.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  tb_kernel_ops

add wave *
view structure
view signals
run -all
