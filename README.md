# FPGA Image Processing Pipeline

This is my final-year engineering project that focuses on speeding up image processing using FPGAs. The project compares the performance of single and dual 3x3 kernel operations using Verilog and Quartus. MATLAB is used to convert images into a format suitable for FPGA ROM, and to visualise the output.

## What's Inside

- `quartus/` – All the Quartus projects by image size and kernel setup (64x64, 256x256, dual kernel, etc.)
- `matlab/` – MATLAB scripts for converting images to hex and back for all cases
- `images/` – Sample images used in the project
- `README.md` – This file

## Project Structure

```text
quartus/
├── 64x64_1_kernel/       # Single kernel simulation
├── 64x64_2_kernel/       # Dual kernel simulation
├── 64x64_split/          # Split output setup
└── 256x256/              # Large image multiplexer project

matlab/
├── 64x64_1_kernel/
├── 64x64_2_kernel/
├── 64x64_split/
└── 256x256/
```

Each Quartus folder has the `.qpf` project file, Verilog modules, testbenches, and simulation outputs.

## Results Summary

| Setup         | Time (ns) | Speedup |
|---------------|-----------|---------|
| Single Kernel | 819,310   | 1x      |
| Dual Kernel   | 409,710   | 2x      |

## Images

Here’s a quick look at one of the original input images and a processed result:

- `images/64x64.jpg` – Original resized image
- `images/256x256.jpg` – One of the processed outputs

## Notes

Some Quartus errors popped up when trying larger images (like too many I/O pins or memory overflow). Because of that, I stuck to 64x64 for most testing. The rest of the designs are there and still show how the system works.

If you want to test this yourself, each folder is set up to run on its own.

---

Made by Omar Barouni – BEng Electrical & Electronic Engineering