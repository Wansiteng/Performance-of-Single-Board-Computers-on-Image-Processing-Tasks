# Performance of Single-Board Computers on Image Processing Tasks

This project aims to systematically compare and analyze the performance of multiple single-board computers (SBCs) in image processing and object detection tasks. The primary algorithms tested include:  
- Traditional image processing algorithm: Canny Edge Detection  
- Deep learning-based object detection algorithm: YOLO v4  

By collecting experimental data, the project compares several SBCs (e.g., NVIDIA Jetson Xavier, Raspberry Pi series, Radxa Rock 5B, and more) in terms of runtime efficiency, memory usage, and other key performance indicators. This assists developers and researchers in selecting a suitable hardware platform and algorithm in resource-constrained scenarios.

## Table of Contents

- [Project Background](#project-background)  
- [Key Features](#key-features)  
- [Project Structure](#project-structure)  
- [Dependencies](#dependencies)  
- [Quick Start](#quick-start)  
- [Experimental Methodology](#experimental-methodology)  
- [Overview of Experimental Results](#overview-of-experimental-results)  
- [Potential Improvements](#potential-improvements)  
- [References](#references)  
- [Acknowledgments](#acknowledgments)  
- [License](#license)

---

## Project Background

With the rapid development of artificial intelligence and the Internet of Things (IoT), small, low-power, and computationally capable single-board computers have become widely used in image processing. This project focuses on the following core questions:

1. **How can traditional image processing algorithms (Canny) and more complex deep-learning object detection algorithms (YOLO v4) be run on resource-constrained hardware (e.g., SBCs)?**  
2. **How do different SBCs (such as NVIDIA Jetson Xavier, Raspberry Pi 4, Raspberry Pi 2, Radxa Rock 5B, etc.) perform when processing images of different sizes?**  
3. **What are the main factors that influence SBC performance (including hardware specs, temperature, cooling, algorithm implementation, etc.)?**

Through a series of experiments, the project thoroughly evaluates how multiple SBCs handle small, medium, and large images (focusing primarily on runtime and memory usage).

---

## Key Features

1. **Comparison Among Multiple SBCs**  
   Includes but is not limited to Jetson Xavier, Raspberry Pi series, Radxa Rock 5B, focusing on execution speed and resource consumption under the same algorithms.

2. **Multiple Image Processing Tasks**  
   - **Canny Edge Detection**: A classic image processing algorithm for fundamental image contour extraction.  
   - **YOLO v4**: A real-time deep-learning-based object detection algorithm, used to evaluate the capability of SBCs to handle complex neural network inference.

3. **Testing With Multiple Image Sizes/Resolutions**  
   - Small images (~200KB, from VOCtrainval 2012)  
   - Medium images (~2MB, from DIV2K train HR)  
   - Large images (~6MB, from DIV2K train HR)

4. **Multi-Dimensional Performance Metrics**  
   - Runtime (Latency / FPS)  
   - Memory Usage (Peak and Average)  
   - Effects of external factors such as temperature and cooling

5. **Reproducible Experiment Scripts**  
   Provides relevant scripts or code examples, making it easy to replicate experiments on different SBCs and obtain comparable results.

---

## Project Structure

*(Below is an example structure; please adapt it to your actual code.)*

```
.
├── README.md                # Project overview and usage instructions
├── data/                    # Test image datasets (or dataset links/scripts)
├── scripts/                 # Experimental, execution, and performance monitoring scripts
│   ├── setup_env.sh         # Environment setup script (example)
│   ├── run_canny.sh         # Script for running Canny edge detection
│   └── run_yolov4.sh        # Script for running YOLO v4 inference
├── src/
│   ├── canny/               # Source code related to Canny edge detection
│   └── yolov4/              # Source code related to YOLO v4 inference
├── results/                 # Directory for saving experiment outputs (logs, data reports, charts)
└── docs/                    # Papers, references, or related design documentation
```

---

## Dependencies

1. **Operating System**: Recommended Linux-based distributions (e.g., Ubuntu or Raspberry Pi OS), ensuring consistent dependencies across all SBCs.  
2. **Compiler**: gcc / g++ (depending on the OS defaults or manual installation).  
3. **Deep Learning Framework** (if YOLO v4 is used):  
   - Darknet / OpenCV / CUDA / cuDNN (The Jetson series often comes with some required components preinstalled; Raspberry Pi may need manual setup or a lightweight inference framework).  
4. **Image Processing Libraries**: OpenCV, ImageMagick, etc.  
5. **Performance Analysis Tools**: Valgrind (for memory usage monitoring) and common system monitoring tools (e.g., `htop`, `vcgencmd` to monitor temperature, etc.).

Due to differences among SBC platforms, dependency setup may vary. Refer to [scripts/setup_env.sh](scripts/setup_env.sh) (if present) for detailed installation instructions.

---

## Quick Start

1. **Clone this Repository**  
   ```bash
   git clone https://github.com/YourName/your-graduation-project.git
   cd your-graduation-project
   ```

2. **Install/Check Dependencies**  
   According to the instructions in `scripts/setup_env.sh`, install dependencies on each SBC:  
   ```bash
   chmod +x scripts/setup_env.sh
   ./scripts/setup_env.sh
   ```

3. **Prepare the Datasets**  
   - Extract the datasets (VOCtrainval 2012, DIV2K, etc.) into the `data/` directory, or specify the dataset path in the scripts.

4. **Compile or Configure Algorithms**  
   - For Canny Edge Detection (example in C)  
     ```bash
     cd src/canny
     make
     ```  
   - For YOLO v4 (Darknet or other inference frameworks)  
     ```bash
     cd src/yolov4
     make  # or use CMake/another build approach
     ```

5. **Run Experiment Scripts**  
   - Run the Canny edge detection experiment:  
     ```bash
     sh scripts/run_canny.sh
     ```  
   - Run the YOLO v4 inference experiment:  
     ```bash
     sh scripts/run_yolov4.sh
     ```

6. **View Results**  
   Logs and outputs will be placed in the `results/` directory, where you can compare runtime and memory usage across different SBCs via the recorded data and logs.

---

## Experimental Methodology

1. **Choice of Single-Board Computers**  
   - NVIDIA Jetson Xavier NX, Raspberry Pi 4, Raspberry Pi 2, Radxa Rock 5B, etc.  
   - Focus on key differences such as CPU frequency, RAM size, and GPU support (if applicable).

2. **Algorithms Under Comparison**  
   - **Canny** Edge Detection: A classic image processing algorithm suitable for basic performance and memory usage evaluations.  
   - **YOLO v4**: A deep learning-based object detection algorithm used to assess SBCs’ capabilities in complex neural network inference.

3. **Image Sizes**  
   - **Small** (~200KB, from VOCtrainval 2012)  
   - **Medium** (~2MB, from DIV2K train HR)  
   - **Large** (~6MB, from DIV2K train HR)

4. **Evaluation Metrics**  
   - **Runtime**: Total time from reading the image to generating the processed output (or frame rate, FPS).  
   - **Memory Usage**: Recorded peak and average memory usage via Valgrind.  
   - **Temperature and Power** (for deeper analysis): Collected using built-in or third-party SBC sensors.

5. **Experimental Workflow**  
   - **Preparation Stage**: Install dependencies, download or prepare test images, compile algorithms.  
   - **Execution Stage**: Sequentially run the same scripts on each SBC, logging real-time outputs.  
   - **Monitoring Stage**: Collect memory usage and temperature data via Valgrind (or nvidia-smi, vcgencmd, etc.).  
   - **Result Analysis**: Summarize runtime and memory usage comparison charts, focusing on averages or peak values.

---

## Overview of Experimental Results

An example of the main findings:

1. **NVIDIA Jetson Xavier NX**  
   - Offers the best performance in YOLO v4 tasks, with fast inference and relatively stable memory usage.  
   - Thanks to GPU acceleration, it maintains decent real-time performance even with large images.

2. **Raspberry Pi 4**  
   - Shows a significant improvement over the older Raspberry Pi 2, but still lags behind Jetson for YOLO v4.  
   - Works smoothly for simpler tasks like Canny edge detection.

3. **Raspberry Pi 2**  
   - Limited by lower CPU frequency and smaller memory, it struggles with complex neural networks but suffices for simple image processing.

4. **Radxa Rock 5B**  
   - Excellent overall performance, particularly with multitasking and mid-sized image processing.  
   - GPU capability is somewhat weaker compared to Jetson, but offers great value for the cost.

For more detailed data, refer to the tables and comparison graphs in [results/](results/).

---

## Potential Improvements

1. **Algorithm Optimization**: Model pruning, quantization, and distillation for YOLO v4 to reduce computation and memory usage.  
2. **Hardware Co-Design**: Leverage SBC hardware features (e.g., GPU/NPU acceleration) combined with system-level optimizations.  
3. **Thermal and Power Management**: Temperature significantly impacts performance under heavy workloads; consider active cooling solutions or more stable power supply options.  
4. **Additional Algorithm Trials**: Explore SSD, Faster R-CNN, RetinaNet, etc., to compare deep learning detection performance on SBCs.

---

## References

- **From Dissertation**:  
  - Siteng Wan, *Performance of single-board computers on image processing tasks*, 2024.  
- **External Resources**:  
  - [YOLO v4 Paper](https://arxiv.org/abs/2004.10934)  
  - [Canny Edge Detection Original Paper](https://doi.org/10.1109/TSMC.1986.4300068)  
  - [Official Raspberry Pi Documentation](https://www.raspberrypi.com/documentation/)  
  - [NVIDIA Jetson Official Documentation](https://developer.nvidia.com/embedded-computing)

(Feel free to add more references as needed.)

---

## Acknowledgments

Many thanks to my supervisor **Hans Wolfgang Loidl** for his guidance and support throughout this research, and to my classmates and family for their encouragement.

---

## License

Unless otherwise specified, the code and documentation in this project are licensed under the [MIT License](LICENSE).  
You are free to copy, modify, merge, publish, and distribute this project, provided that you retain the copyright and license notices.
