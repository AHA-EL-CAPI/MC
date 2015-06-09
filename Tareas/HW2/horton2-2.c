// Grupo de Trabajo: Alejandro Hernández A. y Nicolás A. Morales D.
#include <stdio.h> // Incluyo librerías necesarias para el funcionamiento del método.

int main(void)
{
	float inches = 0.0f;
	float feet = 0.0f;
	float yard = 0.0f;
	float length = 0.0f;
	float width = 0.0f;
	float area = 0.0f; // Defino variables necesarias para implementar el método.

	const float inches_per_foot = 12.0f;
	const float inches_per_yard = 36.0f; // Defino valores que no cambian en el método.

	printf("Enter length in whole feet: " ) ;
	scanf("%f", &feet);
	printf("                                            ...and then inches: " ) ;
	scanf("%f", &inches); // Solicito información al usuario y la guardo en variables previamente definidas.

	length = feet*inches_per_foot + inches;
	length /= inches_per_yard; // Hag un cambio de unidades de acuerdo a lo solicitado por el ejercicio.

	printf("Enter width in whole feet: " ) ;
	scanf("%f", &feet);
	printf("                                            ...and then inches: " ) ;
	scanf("%f", &inches); 

	width = feet*inches_per_foot + inches;	
	width /= inches_per_yard;

	area = length*width; // Calculo el área en yardas cuadradas.

	printf("Area in squared yards: %.2f\n", area); // Muestro el resultado de la operación hecha en la línea anterior.
	
	return 0;
}