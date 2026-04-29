# AND Gate

Primul meu modul Verilog. Poarta logică AND cu 2 intrări și o ieșire, 
simulată cu Icarus Verilog și vizualizată în GTKWave.

## Fișiere:

- `and_gate.v`
- `and_gate_tb.v`
- `waveform.png`

## Cum se rulează

Necesar: Icarus Verilog, GTKWave

​```bash
iverilog -o and_gate_sim and_gate.v and_gate_tb.v
vvp and_gate_sim
gtkwave and_gate.vcd
​```

## Waveform

![Waveform AND gate](waveform.png)

În cele 4 ferestre de 10 ns, a și b parcurg combinațiile 00, 01, 10, 11. y rămâne 0 în primele trei și sare la 1 doar în ultima — semnătura vizuală a unui AND.

## Ce am învățat

- assign – stabilește o conexiune permanentă (logică combinațională); orice schimbare la intrare se reflectă imediat la ieșire.

- wire – reprezintă un conductor electric fizic. Nu are memorie și nu stochează valori. Se utilizează pentru porturile de ieșire (output) ale modulelor și pentru a face conexiuni între diferite componente/porți logice.

- reg – un semnal căruia i se pot atribui valori (stochează date). Spre deosebire de wire, acesta apare doar în interiorul blocurilor procedurale de tip always sau initial.

- Testbench-ul – este un mediu de simulare care nu este synthesizable (nu se transformă în circuite logice pe chip-ul FPGA).

    - Acesta conține elemente care nu există în hardware-ul real (precum #10 pentru întârzieri, $dumpfile pentru salvarea diagramelor sau blocul initial).

    - Rolul lui este strict de a genera stimuli pentru a testa funcționarea modulului principal (ex: and_gate.v).

## Resurse folosite

- [Icarus Verilog](http://iverilog.icarus.com/)
- [GTKWave](https://gtkwave.sourceforge.net/)