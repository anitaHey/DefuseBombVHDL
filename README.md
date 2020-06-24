<div align="center">
<h3>DEFUSE BOMB (VHDL)</h3>
<img src="https://github.com/anitaHey/DefuseBombVHDL/raw/master/.meta/cover.jpg">

</div>

## Overview
Bulls and Cows game (also known as 1A2B game) implemented in VHDL.

This is the semester project for Digital System Lab (Spring 2020) in UTaipei using CPLD/FPGA (LP-2900) board.

## Schematic Diagram
![schematic](https://github.com/anitaHey/DefuseBombVHDL/raw/master/.meta/schematic.png)

## Features
* Player 1 can enter the answer (a four-digit passcode) at the beginning
* Player 2 can then start guessing the answer, and the seven-segment display will show the corresponding hints (_A_B)
* Player 2 has two minutes to guess the answer.
* Player 2's score is displayed via the LEDs, which will decrease over time.
* The main objective is to guess the four-digit answer before the time runs out. If the time has run out, the 8x8 dot display will be rendered all red (which indicates that the bomb has exploded).

## Build Requirements
* Quartus II 13.0

## Running Requirements
* CPLD/FPGA (Model: LP-2900) board

## Build and Run
1. Launch Quartus II
2. File -> Open Project: `DefuseBombVHDL/src/key_input.qpf`
3. Processing -> Start Compilation
4. Tools -> Programmer -> Hardware Setup ... (and select your device) -> Start

Note that if the ouput file is not automatically selected, you might need to add that file by yourself.

To manually add the output file (which is kinda like the "executable"), click "Add File...": `DefuseBombVHDL/src/output_files/key_input.sof`
