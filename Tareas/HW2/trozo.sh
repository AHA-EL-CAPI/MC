# Grupo de Trabajo: Alejandro Hernández A. y Nicolás A. Morales D.
#!/bin/bash
awk '{print substr($0,'$1','$2'-'$1' +1)}' $3 # Imprimo una sección de un archivo de una sola línea usando la posición del caracter iniciañ y la posición del caracter final. El +1 dentro del awk tiene en cuenta el caracter final. La posición de los caracteres y el archivo son pasados como parámetro.