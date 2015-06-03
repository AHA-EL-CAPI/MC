#!/bin/bash
wget https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionalesLaboratorio/master/2015-V/actividades/lottery/lottery.csv
head -1 lottery.csv
grep '201219580' lottery.csv | sed 's/201219580,//g'
rm lottery.csv
