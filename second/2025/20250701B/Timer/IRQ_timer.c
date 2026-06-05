/*********************************************************************************************************
**--------------File Info---------------------------------------------------------------------------------
** File name:           IRQ_timer.c
** Last modified Date:  2014-09-25
** Last Version:        V1.00
** Descriptions:        functions to manage T0 and T1 interrupts
** Correlated files:    timer.h
**--------------------------------------------------------------------------------------------------------
*********************************************************************************************************/
#include "LPC17xx.h"
#include "../Main.h"
extern uint32_t tick;
extern int LCGsequence (int seed,int a,int c,int s,int m);
int result=6;
int cnt=0;
int flag =0 ;
extern int hit;
extern int miss;



void TIMER0_IRQHandler (void)
{
  LPC_TIM0->IR |= 1;			/* clear interrupt flag */
  return;
}


void TIMER1_IRQHandler (void)
{ if(cnt<10 && flag==0){
	result = LCGsequence (result,157,3,3,256) ;
		if (result % 4 ==0)
 			{LED_On (11-4);
	       	flag =1 ;}
		
		else if (result % 4 ==1) 
			{LED_On (11-5);
				flag =1;}
		else if (result % 4 ==2) {
			LED_On (11-6);
			flag =1 ;}
		else if (result % 4 ==3) {
			LED_On (11-7);
			flag=1;}
	LED_Out (0);
   cnt++;
   flag =0;}


  LPC_TIM1->IR = 1;			/* clear interrupt flag */
  return;
}

void TIMER2_IRQHandler (void)
{
  LPC_TIM2->IR = 1;			/* clear interrupt flag */
  return;
}

void TIMER3_IRQHandler (void)
{
	tick++;
  LPC_TIM3->IR = 1;			/* clear interrupt flag */
  return;
}

/******************************************************************************
**                            End Of File
******************************************************************************/
