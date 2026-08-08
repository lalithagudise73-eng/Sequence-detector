# Sequence Detector for 1011 Using Verilog

## 📌 Project Overview

This project implements a digital sequence detector using Verilog HDL.

The circuit detects the binary sequence:

```text
1011
```

A Finite State Machine (FSM) is used to design the sequence detector.

The design is implemented as a **Mealy sequence detector**, where the output depends on the current state and the current input.

## 🎯 Objective

The objectives of this project are:

* To understand Finite State Machines.
* To design a sequence detector using Verilog HDL.
* To implement a Mealy FSM.
* To create a Verilog testbench.
* To verify the design using simulation.
* To analyze the output using a waveform.

## ⚙️ Features

* Detects the sequence `1011`.
* Uses a Mealy FSM.
* Supports overlapping sequence detection.
* Synchronous operation using a clock.
* Includes asynchronous reset.
* Verified using a Verilog testbench.

## 🔌 Inputs

| Input     | Description       |
| --------- | ----------------- |
| `clk`     | Clock signal      |
| `reset`   | Reset signal      |
| `data_in` | Serial input data |

## 📤 Output

| Output     | Description                                  |
| ---------- | -------------------------------------------- |
| `detected` | Becomes `1` when sequence `1011` is detected |

## 🧠 FSM States

| State | Description      |
| ----- | ---------------- |
| S0    | No matching bits |
| S1    | `1` detected     |
| S2    | `10` detected    |
| S3    | `101` detected   |

When the circuit is in `S3` and receives `1`, the complete sequence `1011` has been detected.

## 🔄 State Transitions

```text
S0 + 1 → S1
S0 + 0 → S0

S1 + 1 → S1
S1 + 0 → S2

S2 + 1 → S3
S2 + 0 → S0

S3 + 0 → S2
S3 + 1 → S1
           detected = 1
```

## 📁 Project Structure

```text
sequence-detector-1011/
│
├── README.md
├── src/
│   └── sequence_detector.v
├── tb/
│   └── sequence_detector_tb.v
└── simulation/
    └── waveform.png
```

## 🧪 Testbench

The testbench applies a serial input sequence to the sequence detector.

The main test sequence is:

```text
1011
```

When `1011` is received, the output becomes:

```text
detected = 1
```

## 📊 Expected Result

For the input:

```text
Data:     1 0 1 1
Detected: 0 0 0 1
```

The detector generates a pulse when the complete sequence is detected.

## 💻 Simulation

This project can be simulated using:

* Icarus Verilog
* GTKWave
* ModelSim
* Vivado

### Using Icarus Verilog

Compile the design:

```bash
iverilog -o sequence_sim src/sequence_detector.v tb/sequence_detector_tb.v
```

Run the simulation:

```bash
vvp sequence_sim
```

The testbench generates:

```text
sequence_detector.vcd
```

Open the waveform using GTKWave:

```bash
gtkwave sequence_detector.vcd
```

## 📈 Simulation Waveform

After running the simulation, capture the waveform showing:

* `clk`
* `reset`
* `data_in`
* `detected`

Save the screenshot as:

```text
simulation/waveform.png
```

## 📚 Concepts Used

* Verilog HDL
* Finite State Machine
* Mealy FSM
* Sequential logic
* Combinational logic
* State transitions
* Clock and reset
* Testbench
* Functional verification
* Waveform simulation

## 🚀 Future Improvements

The project can be extended to:

* Detect different sequences.
* Detect multiple sequences.
* Implement a Moore FSM.
* Add programmable sequence input.
* Design a 4-bit or 8-bit configurable sequence detector.
* Implement the design on an FPGA board.

## 👩‍💻 Author

Dharani

## 📜 License

This project is created for educational and academic purposes.
