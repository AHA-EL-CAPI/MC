	// Grupo de Trabajo: Alejandro Hernández A. y Nicolás A. Morales D.
	#include <stdio.h> // Incluyo librerías necesarias para el funcionamiento del método.

	int main(void)
	{
		int product_type;
		int quantity;
		float price = 0.0f;
		_Bool product = 1; // Defino variables de distintos tipos que serán usadas a los largo del método. La variable booleana se usa para distinguir entre los productos de tipo 1 y 2 de acuerdo a la información proporcionada por el usuario.

		const float price_1 = 3.50f;
		const float price_2 = 5.50f; // Defino valores que no cambian en el método.

		printf("Enter \"1\" for Type 1 product or \"2\" for Type 2 product: ");
		scanf("%d", &product_type); // Solicito información al usuario y la guardo en variables previamente definidas.

		product = ((product_type==1)?1:0); // Uso la variable booleana para definir cuál producto eligió el usuario.

		printf("Enter quantity of product: ");
		scanf("%d", &quantity);

		if(product==1)
		{
			price = quantity*price_1;
			printf("The price is: $ %.2f\n", price);
		}	
		else
		 {
		  	price = quantity*price_2;
			printf("The price is: $ %.2f\n", price);
		} // Utilizo expresiones condicionales para calcular el precio de la cantidad de productos que quiere el usuario y muestro dicho precio en pantalla.
				
		return 0;
	}