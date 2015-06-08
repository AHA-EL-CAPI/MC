	#include <stdio.h>

	int main(void)
	{
		int product_type;
		int quantity;
		float price = 0.0f;
		_Bool product = 1;

		const float price_1 = 3.50f;
		const float price_2 = 5.50f;

		printf("Enter \"1\" for Type 1 product or \"2\" for Type 2 product: ");
		scanf("%d", &product_type);

		product = ((product_type==1)?1:0);

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
		}
				
		return 0;
	}