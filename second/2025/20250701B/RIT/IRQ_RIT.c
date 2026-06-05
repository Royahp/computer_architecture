/*********************************************************************************************************
**--------------File Info---------------------------------------------------------------------------------
** File name:           IRQ_RIT.c
** Last modified Date:  2014-09-25
** Last Version:        V1.00
** Descriptions:        functions to manage T0 and T1 interrupts
** Correlated files:    RIT.h
**--------------------------------------------------------------------------------------------------------
*********************************************************************************************************/
#include "LPC17xx.h"
#include "RIT.h"
#include "../Main.h"
extern int flag;
extern int result;
int hit=0;
int miss=0;
/******************************************************************************
** Function name:		RIT_IRQHandler
**
** Descriptions:		REPETITIVE INTERRUPT TIMER handler
**
** parameters:			None
** Returned value:		None
**
******************************************************************************/
void RIT_IRQHandler (void)
{			
		if((LPC_GPIO1->FIOPIN & (1<<25)) == 0){			//sel
		}	
		if((LPC_GPIO1->FIOPIN & (1<<26)) == 0){			//down
			if (flag==1 && result % 4 ==3) hit++;
				else miss++;
		}
		if((LPC_GPIO1->FIOPIN & (1<<27)) == 0){			//left
			if (flag==1 && result % 4 ==1) hit++;
				else miss++;
		}
		if((LPC_GPIO1->FIOPIN & (1<<28)) == 0){			//right
			if (flag==1 && result % 4 ==2) hit++;
				else miss++;
		}
		if((LPC_GPIO1->FIOPIN & (1<<29)) == 0){			//up
			if (flag==1 && result % 4 ==0) hit++;
				else miss++;
		}
		
		if (hit>miss) LED_On(11-10);
	 else LED_On(11-11);
  LPC_RIT->RICTRL |= 0x1;	/* clear interrupt flag */
	
}

/******************************************************************************
**                            End Of File
******************************************************************************/
