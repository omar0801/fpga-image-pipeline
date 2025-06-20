transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Omar/Desktop/fpga-image-pipeline/quartus/256x256 {C:/Users/Omar/Desktop/fpga-image-pipeline/quartus/256x256/kernel_ops.v}
vlog -vlog01compat -work work +incdir+C:/Users/Omar/Desktop/fpga-image-pipeline/quartus/256x256 {C:/Users/Omar/Desktop/fpga-image-pipeline/quartus/256x256/kernel_mem_fetch.v}
vlog -vlog01compat -work work +incdir+C:/Users/Omar/Desktop/fpga-image-pipeline/quartus/256x256 {C:/Users/Omar/Desktop/fpga-image-pipeline/quartus/256x256/kernel_3x3_sharpen.v}
vlog -vlog01compat -work work +incdir+C:/Users/Omar/Desktop/fpga-image-pipeline/quartus/256x256 {C:/Users/Omar/Desktop/fpga-image-pipeline/quartus/256x256/kernel_3x3_outline.v}
vlog -vlog01compat -work work +incdir+C:/Users/Omar/Desktop/fpga-image-pipeline/quartus/256x256 {C:/Users/Omar/Desktop/fpga-image-pipeline/quartus/256x256/kernel_3x3_emboss.v}
vlog -vlog01compat -work work +incdir+C:/Users/Omar/Desktop/fpga-image-pipeline/quartus/256x256 {C:/Users/Omar/Desktop/fpga-image-pipeline/quartus/256x256/kernel_3x3_blur.v}
vlog -vlog01compat -work work +incdir+C:/Users/Omar/Desktop/fpga-image-pipeline/quartus/256x256 {C:/Users/Omar/Desktop/fpga-image-pipeline/quartus/256x256/image_rom.v}

vlog -vlog01compat -work work +incdir+C:/Users/Omar/Desktop/fpga-image-pipeline/quartus/256x256 {C:/Users/Omar/Desktop/fpga-image-pipeline/quartus/256x256/tb_kernel_ops.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  tb_kernel_ops

add wave *
view structure
view signals
run -all
