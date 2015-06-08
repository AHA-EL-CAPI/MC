#include <stdio.h>

int main(void)
{
	float inches = 0.0f;
	float feet = 0.0f;
	float yard = 0.0f;
	float length = 0.0f;
	float width = 0.0f;
	float area = 0.0f;

	const float inches_per_foot = 12.0f;
	const float inches_per_yard = 36.0f;

	printf("Enter length in whole feet: " ) ;
	scanf("%f", &feet);
	printf("                                            ...and then inches: " ) ;
	scanf("%f", &inches);
	length = feet*inches_per_foot + inches;
	length /= inches_per_yard;

	printf("Enter width in whole feet: " ) ;
	scanf("%f", &feet);
	printf("                                            ...and then inches: " ) ;
	scanf("%f", &inches);
	width = feet*inches_per_foot + inches;	
	width /= inches_per_yard;

	area = length*width;

	printf("Area in squared yards: %.2f\n", area);
	
	return 0;
}