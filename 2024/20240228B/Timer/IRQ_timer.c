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
#define row 9
#define col 8
char maze[row][col] = {"********",
"*S *S*",
"* **** *",
"* *",
"** * ***",
"* * *",
"** * ***",
"* * *",
"********"};
extern int deadEndFilling (int r,int c,char* matrix);

void TIMER0_IRQHandler (void)
{
	int i,j=0;
	int s,k=0;
	int result=deadEndFilling(9,8,maze);
	for(i=0;i<row;i++){
	    for(j=0;j<col;j++){
					if(maze[i][j]=='S'){
					s=i;
					k=j;
					break;}
	}}
	
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
