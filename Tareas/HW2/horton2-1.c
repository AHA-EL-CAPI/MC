#include <stdio.h>

int main(void)
{
	float inches = 0.0f;
	float feet = 0.0f;
	float yard = 0.0f;

	const float inches_per_foot = 12.0f;
	const float inches_per_yard = 36.0f;

	printf("Enter distance in inches: " ) ;
	scanf("%f", &inches);

	feet = inches/inches_per_foot;
	yard = inches/inches_per_yard;

	printf("Distance in feet: %.2f\n", feet );
	printf("Distance in yards: %.2f\n", yard );
	return 0;
}