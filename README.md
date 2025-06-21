# FPGA Image Processing Pipeline

This is my final-year engineering project that focuses on speeding up image processing using FPGAs. The project compares the performance of single and dual 3x3 kernel operations using Verilog and Quartus. MATLAB is used to convert images into a format suitable for FPGA ROM, and to visualise the output.

## What's Inside

- `quartus/` – All the Quartus projects by image sise and kernel setup (64x64, 256x256, dual kernel, etc.)
- `matlab/` – MATLAB scripts for converting images to hex and back for all cases
- `images/` – Sample images used in the project
  
## Project Structure

```text
quartus/
├── 64x64_1_kernel/       # Single kernel simulation
├── 64x64_2_kernel/       # Dual kernel simulation
├── 64x64_split/          # Split output setup
└── 256x256/              # Large image multiplexer project

matlab/
├── 64x64_1_kernel/       # Reads 64x64 output and displays image
├── 64x64_2_kernel/       # Merges two outputs from dual kernels
├── 64x64_split/          # Keeps each kernel's result separate
└── 256x256/              # Handles larger 256x256 image and output

images/
├── 64x64.jpg             # Example input image 
└── 256x256.jpg           # Larger image used in advanced test
```

Each Quartus folder has the `.qpf` project file, Verilog modules, testbenches, and simulation outputs.

## Results Summary

| Setup         | Time (ns) | Speedup |
|---------------|-----------|---------|
| Single Kernel | 819,310   | 1x      |
| Dual Kernel   | 409,710   | 2x      |

## Images

The images in the `images/` folder are used as inputs for MATLAB. They get converted into hexadecimal values and written to ROM files used by the Quartus simulations. These are not output images — the actual output is viewed in MATLAB after the simulation.

- [images/64x64.jpg](images/64x64.jpg) – Input image for 64×64 projects  
- [images/256x256.jpg](images/256x256.jpg) – Input image for 256×256 project

## Notes

Some Quartus errors popped up when trying larger images (like too many I/O pins or memory overflow). Because of that, I stuck to 64x64 for most testing. The rest of the designs are there and still show how the system works.

If you want to test this yourself, each folder is set up to run on its own.

---

Made by Omar Barouni – BEng Electrical and Electronic Engineering
