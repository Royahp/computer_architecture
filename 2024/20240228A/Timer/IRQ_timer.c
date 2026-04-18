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
char maze[9][8] = {"XXXXXXXX",
			{'X', 0, ' ', ' ', ' ', ' ', ' ', 'X'},
			"X XXXX X",
			"X      X",
			"XX X XXX",
			"X  X  eX",
			"X XX XXX",
			"X      X",
			"XXXXXXXX"};
extern int shortestPath (int r,int c,char * mat[]);


void TIMER0_IRQHandler (void)
{
	int i=0;
	int j=0;
	int i_k,j_k=0;
	for(i=0;i<9;i++){
		for(j=0;j<8;j++){
			if(maze[i][j]=="e"){
				i_k=i;
				j_k=j;
				
				}}}
	int k= shortestPath (9,8,maze);
	
		LED_Out(0);
		if(maze[i_k][j_k +1]==k){
			LED_On(11-4);}
	  else if(maze[i_k+1][j_k]==k){
			LED_On(11-5);}
	else if(maze[i_k][j_k-1]==k){
			LED_On(11-6);}
	else if(maze[i_k-1][j_k]=k){
			LED_On(11-7);}
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
