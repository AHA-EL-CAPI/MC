# ./bin/bash
for file in $(ls); do echo "=============================" >> códigos.md ; echo "# Nombre del archivo: $file" >> códigos.md ; echo "=============================" >> códigos.md; echo "\`\`\`c" >> códigos.md ; cat $file >> códigos.md ; echo "\`\`\^C >> códigos.md ; done