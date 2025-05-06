# UART FIFO Verilog Project

This project implements a UART (Universal Asynchronous Receiver/Transmitter) module with integrated FIFO buffers using Verilog HDL. The design includes both transmit (TX) and receive (RX) modules and a control unit for managing UART communication and data buffering.

---

## 📁 Project Structure

| File | Description |
|------|-------------|
| `uart_rx.v` | UART receiver module with start/stop bit detection and 8-bit data output |
| `uart_tx.v` | UART transmitter module with start, data, and stop bit generation |
| `fifo.v` | Parameterized synchronous FIFO buffer used between RX and TX |
| `uart_fifo_ctrl.v` | Top-level control module connecting RX, FIFO, and TX |
| `tb_uart_fifo.v` | Testbench for simulation in ModelSim (includes waveform verification) |
| `RTL_uart_fifo_ctrl.pdf` | RTL block diagram of the top-level control module |
| `wave_tb_uart_fifo.png` | Simulation waveform showing correct UART reception and transmission |

---

## ▶️ Simulation

This project was simulated using **ModelSim**.  
The testbench sends one byte `0xA5` (binary `10100101`) through the RX line using UART protocol.

📈 The waveform confirms:
- Correct start/data/stop bit interpretation
- FIFO buffering
- Transmission through TX pin

![Waveform](wave_tb_uart_fifo.png)

---

## 🛠️ Tools Used

- **ModelSim / Questa** – Functional simulation
- **Quartus Prime Lite** – RTL analysis & synthesis (target device: Cyclone V)
- **GitHub** – Version control and sharing

---

## 🧩 How to Use

1. Clone or download the repo
2. Open the Verilog source files in your FPGA design environment
3. Run the simulation with `tb_uart_fifo.v`
4. Use `uart_fifo_ctrl.v` as the top-level module for synthesis
