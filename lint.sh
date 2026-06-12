#!/bin/bash
find . -name "*.v" -exec verible-verilog-lint {} \;

#Acest script este un tool care ne spune daca fisierele Verilog 
#au probleme de calitate sau pericole, probleme care nu ar aparea
#atunci cand am simula circuitul