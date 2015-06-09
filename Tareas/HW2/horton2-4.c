// Grupo de Trabajo: Alejandro Hernández A. y Nicolás A. Morales D.
#include <stdio.h> // Incluyo librerías necesarias para el funcionamiento del método.

int main(void)
{
	float salary = 0.0f;
	float hours = 0.0f;
	int dollars;
	int cents; // Defino variables de distintos tipos que serán usadas a los largo del método.

	printf("Enter your weekly pay: $");
	scanf("%f", &salary);

	printf("Enter how muc hour you work per week: ");
	scanf("%f", &hours); // Solicito información al usuario y la guardo en variables previamente definidas.

	salary /= hours;

	dollars = (int) salary;
	cents = (int) (salary*100)%100; // Realizo el promedio salarial requerido y extraigo la información de dólares y centavos usando el cast de la variable salario de forma apropiada en cada caso. En particular, uso la función residuo para extraer la información sobre centavos.

	printf("Your average hourly pay rate is %d dollars and %d cents.\n", dollars, cents); // Muestro el resultado final del método en pantalla.

	return 0;
}