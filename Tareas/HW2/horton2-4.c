#include <stdio.h>

int main(void)
{
	float salary = 0.0f;
	float hours = 0.0f;
	int dollars;
	int cents;

	printf("Enter your weekly pay: $");
	scanf("%f", &salary);

	printf("Enter how muc hour you work per week: ");
	scanf("%f", &hours);

	salary /= hours;

	dollars = (int) salary;
	cents = (int) (salary*100)%100;

	printf("Your average hourly pay rate is %d dollars and %d cents.\n", dollars, cents);			

	return 0;
}