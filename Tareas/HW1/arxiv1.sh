# ./bin/bash 
echo ========================================== 
figlet arXiv # Coloco la palabra arXiv en el formato mostrado en el enunciado de la tarea.
echo ========================================== 
echo Searching the arXiv for the new stuff 
echo http://arxiv.org/list/math-ph/recent
echo ========================================== 
echo keyword: $1 
echo ========================================== 

echo Articles found: 
curl -s http://arxiv.org/list/math-ph/recent | grep -iw Title:\</span\> | sed 's/.*>/-/g' | grep -iw $1 | wc -l # Busca los títulos de los artículos que contengan la palabra clave y los cuenta.

curl -s http://arxiv.org/list/math-ph/recent | grep -iw Title:\</span\> | sed 's/.*>/-/g' | grep -iw $1 # Imprime los títulos de los artículos econtrados.

echo ==========================================
