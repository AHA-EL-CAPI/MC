# Grupo de Trabajo: Alejandro Hernández A. y Nicolás A. Morales D.
#!/bin/bash
sed -e 'y/'$1''$2'/'$2''$1'/' $3 # Intercarbio 2 letras letras en un archivo usando el comando sed 'y/source/dest/', que precisamente tiene dicha funcionalidad. Las 2 letras y el archivo son pasadas como parámetro por el usuario.

