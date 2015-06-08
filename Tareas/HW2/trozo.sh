#!/bin/bash
awk '{print substr($0,'$1','$2'-'$1' +1)}' $3