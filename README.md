# Assembly Code Bug: Potential Segmentation Fault

This repository demonstrates a potential segmentation fault in assembly code due to unvalidated memory access.  The core issue lies in the instruction `mov eax, [ebx + ecx*4 + 0x10]`.  If the calculated memory address falls outside the permitted range, the program will crash.

## Bug Description
The assembly instruction attempts to read data from memory at a calculated address.  If `ebx`, `ecx`, or their combination results in an invalid memory address, a segmentation fault or general protection fault will occur.

## Solution
The solution involves adding bounds checking before the memory access to ensure the calculated address is within the valid memory range.  This prevents the program from attempting to access invalid memory locations.

## How to Reproduce
Compile and run the `bug.asm` code.  Depending on the values of `ebx` and `ecx`, it may crash or run successfully.  Observe the difference when running the `bugSolution.asm` which includes the bounds checking.