# DT5495_ledshow
Simple VHDL application for CAEN DT5495

## Quartus Prime setup procedure
The setup for a development environment of Quartus Prime is the following:
- Create a new empty project (no template), the name of the project must be **DT5495_ledshow**, the top level entity must be **ledshow**
- Import all the VHDL files in src
- Select the correct model of the device
- Import the assignments specific for DT5495 declared in the QSF files of the directory **quartus_setup**

## Quartus Prime components configuration
The application requires the LPM_COUNTER component from Altera library.
The configuration of the component is the following:
- the IP variation file name must ne stored into the top directory, the name of the file can be led_counter.
- the IP variation file type must be VHDL
- the number of output bits of the counter must be 26
- the flag Carry-out must be checked
- all the other definitions must be kept as they are


