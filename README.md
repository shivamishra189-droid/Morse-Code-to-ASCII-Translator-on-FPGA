# Morse Code to ASCII Translation System using FPGA

<p align="center">

![FPGA](https://img.shields.io/badge/FPGA-AMD%20Xilinx%20Zynq--7000-blue)
![HDL](https://img.shields.io/badge/HDL-Verilog-success)
![Tool](https://img.shields.io/badge/Tool-Xilinx%20Vivado-orange)
![Simulation](https://img.shields.io/badge/Simulation-Passed-brightgreen)
![Timing](https://img.shields.io/badge/Timing-Closed-success)
![License](https://img.shields.io/badge/License-MIT-red)

</p>

---

# Overview

This project presents a **real-time Morse Code to ASCII Translation System** implemented on the **AMD Xilinx Zynq-7000 FPGA** using **Verilog HDL**. The system receives Morse code inputs through the onboard push buttons, classifies each button press into a **dot** or **dash** based on its duration, decodes the Morse sequence into its corresponding ASCII character, stores the decoded characters in a string buffer, and displays the output using the **Vivado Virtual Input/Output (VIO)** interface.

The project demonstrates the complete FPGA design flow including RTL design, simulation, synthesis, implementation, timing verification, resource utilization analysis, power estimation, and on-board hardware validation.

---

# Features

- Real-time Morse Code to ASCII conversion
- Verilog HDL implementation
- AMD Xilinx Zynq-7000 FPGA implementation
- Finite State Machine (FSM) based controller
- Button press duration detection
- Lookup-table based Morse decoder
- String buffer for complete message storage
- Vivado VIO interface for real-time observation
- Functional simulation and hardware verification
- Timing constraints successfully met
- Low FPGA resource utilization
- Low on-chip power consumption

---

# Hardware and Software

| Item | Specification |
|------|---------------|
| FPGA Board | AMD Xilinx ZedBoard |
| FPGA Device | Zynq-7000 |
| HDL | Verilog |
| IDE | Xilinx Vivado |
| Input | Push Buttons |
| Output | Vivado VIO |
| System Clock | 100 MHz |
| Internal Clock | 2 Hz (Clock Divider) |

---

# Hardware Setup

The complete system was implemented on the AMD Xilinx ZedBoard. The onboard push buttons were used to enter Morse code sequences, while the decoded ASCII characters and complete messages were monitored in real time through the Vivado VIO interface.

<p align="center">

<img src="images/hardware_setup.jpg" width="700">

</p>

---

# System Architecture

<p align="center">

<img src="images/system_block.png" width="900">

</p>

The overall design is divided into the following hardware modules:

- Clock Divider
- Morse Input Detection
- Morse Decoder
- String Storage Buffer
- Vivado VIO
- Top Module

The FPGA receives Morse code from the push buttons, converts it into binary Morse patterns, decodes the pattern into an ASCII character, stores the decoded character inside a string buffer, and displays the complete message through the Vivado VIO interface.

---

# Overall Project Flow

<p align="center">

<img src="images/flowchart.png" width="450">

</p>

The overall operation is summarized below.

1. Detect button press.
2. Classify the press as Dot or Dash.
3. Append the detected symbol into the Morse pattern.
4. Detect character gap.
5. Decode the Morse pattern into ASCII.
6. Store the decoded ASCII in the string buffer.
7. Display the complete message using the VIO interface.

---
