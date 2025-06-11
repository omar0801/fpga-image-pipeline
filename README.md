# 🎞️ FPGA Image Processing Pipeline

This repository presents a final-year engineering project focused on enhancing image processing speed using Field-Programmable Gate Arrays (FPGAs). It simulates and analyses single vs dual 3x3 kernel operations in Verilog, achieving parallel performance gains on FPGA architectures.

---

## 📌 Project Summary

This project explores:
- Verilog implementation of image filtering pipelines
- Integration of dual-kernel architecture for speed improvement
- Use of ROM, kernel fetch logic, and convolution modules
- Simulation and performance measurement using Quartus Prime Lite & Questa
- MATLAB preprocessing for image conversion and post-simulation visualisation

---

## ⚙️ Technical Workflow

- **Preprocessing in MATLAB**  
  Images are resized (64x64 or 256x256), converted to grayscale, and transformed into 1D hex arrays for FPGA ROM.

- **Verilog HDL Architecture**  
  Verilog modules simulate ROM reading, kernel memory fetch, and convolution operations including blur, sharpen, emboss, and outline.

- **Dual-Kernel Parallelisation**  
  Optimised version supports simultaneous data access and processing, doubling throughput using dual-port ROM and kernel logic.

---

## 🧪 Key Results

| Setup         | Time (ns) | Speedup |
|---------------|-----------|---------|
| Single Kernel | 819,310   | 1x      |
| Dual Kernel   | 409,710   | 2x      |

---

## 📸 Visual Results

| Filter        | Output |
|---------------|--------|
| Original      | ![Original Image](images/original.png) |
| Blur          | ![Blur](images/blur.png) |
| Outline       | ![Outline](images/outline.png) |
| Emboss        | ![Emboss](images/emboss.png) |
| Sharpen       | ![Sharpen](images/sharpen.png) |

---

## ⚠️ Implementation Challenges

Some errors occurred when trying to process larger images or run more complex designs in Quartus. These included:
- Device limit errors (not enough I/O pins or memory)
- ROM size and register overflow messages

To solve this, the design was tested using smaller 64x64 images, which ran successfully. Future work could optimise resource usage or explore more powerful FPGA boards.

---

## 🧠 Research Highlights

- **Performance:** FPGAs are up to 5–10× faster than CPUs for specific image tasks
- **Concurrency:** Dual-kernel implementation enables real-time filtering
- **Applications:** Ideal for medical imaging, video surveillance, and autonomous vehicles

---

## 🗒️ Acknowledgements

This work was completed as part of the BEng (Hons) Electrical & Electronic Engineering degree at Manchester Metropolitan University. Supervised by Ciaron Murphy.

---

## 📄 Report Access

This repository serves as a report showcase. For source code, testbenches, or full documentation, please contact the author directly.
