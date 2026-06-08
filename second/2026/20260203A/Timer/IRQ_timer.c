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
extern unsigned short AD_current;   
int msb;

void TIMER0_IRQHandler (void)
{
//if (LPC_TIM1->TCR & 1){ //yani dar heyne kar ba timer 0 mibine ke timer 1 enable hast ya na
//  LPC_TIM0->IR |= 1;			//yani agar timer 1 enable bud miad timer 0 ro terminate mikone
//  return;}
// if (LPC_TIM2->TCR & 1){ //yani dar heyne kar ba timer 0 mibine ke timer 2 enable hast ya na
//  LPC_TIM0->IR |= 1;			/* clear interrupt flag */
//  return;}
	
	msb= AD_current >> 4 ;
	LED_Out (msb);
 
	LPC_TIM0->IR |= 1;			/* clear interrupt flag */
  return;
}


void TIMER1_IRQHandler (void)
{
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
