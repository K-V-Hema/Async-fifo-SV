#Async FIFO - SystemVerilog

This project implements an Asynchronous FIFO (First In First Out) design using SystemVerilog. It is used to safely transfer data between two independent clock domains. The FIFO ensures reliable communication even when the write and read clocks are asynchronous to each other.

The design demonstrates key digital design concepts like clock domain crossing, Gray code pointer synchronization, and flag generation for full and empty conditions.

**Overview**:
The asynchronous FIFO consists of two clock domains – a write domain and a read domain. Data written into the FIFO using the write clock is safely read out using the read clock without data corruption.

**Main features**:
Dual clock operation (write and read clocks are independent).
Configurable data width and FIFO depth.
Uses Gray-coded pointers for cross-domain synchronization.
Two-stage synchronizer flip-flops for metastability protection.
Full and empty flag generation logic.
SystemVerilog testbench included for verification.

**Signal Descriptions**:
wr_clk - Write clock input.
rd_clk - Read clock input.
rst_n - Active low asynchronous reset.
wr_en - Write enable signal.
rd_en - Read enable signal.
wdata - Data input for write operation.
rdata - Data output for read operation.
full - FIFO full indicator.
empty - FIFO empty indicator.

**Testbench Operation**:
The testbench creates two independent clocks with different periods.
It drives random or sequential write and read operations.
Scoreboard logic checks that the data read matches the data written.
Reset, boundary conditions, and simultaneous read/write operations are tested.

Example clock generation snippet:
wr_clk toggles every 5 time units (100 MHz).
rd_clk toggles every 7 time units (~71 MHz).
