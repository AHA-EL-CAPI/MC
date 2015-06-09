// Grupo de Trabajo: Alejandro Hernández A. y Nicolás A. Morales D.
#include <stdio.h> // Incluyo librerías necesarias para el funcionamiento del método.

int main(void)
{
	float inches = 0.0f;
	float feet = 0.0f;
	float yard = 0.0f; // Defino variables necesarias para implementar el método.

	const float inches_per_foot = 12.0f;
	const float inches_per_yard = 36.0f; // Defino valores que no cambian en el método.

	printf("Enter distance in inches: " ) ;
	scanf("%f", &inches); // Solicito información al usuario usando el comando scanf y guardo la información en la variable inches.

	feet = inches/inches_per_foot;
	yard = inches/inches_per_yard; // Tranformo la información proporcionada por el usuario a las unidades de interés.

	printf("Distance in feet: %.2f\n", feet );
	printf("Distance in yards: %.2f\n", yard ); // Muestro en pantalla el resultado de las operaciones previamente hechas.
	return 0;
}