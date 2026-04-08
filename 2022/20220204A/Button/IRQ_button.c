#include "../Main.h"
#include "LPC17xx.h"
#define debounce_time 50
extern uint32_t tick;
int bin;
int cnt;
extern uint32_t restoringSquareRoot(int x, int k);
//key0
//uint32_t last_tick0 = 0;
//int state0 = 1;
//key1
//uint32_t last_tick1 = 0;
//int state1 = 1;
//key2
//uint32_t last_tick2 = 0;
//int state2 = 1;
void EINT0_IRQHandler (void)	  
{//baraye debouncing in bakhsh kolesh uncomment
//	if(tick<debounce_time && state0==1){ 
//		state0=0;
//		last_tick0 = tick;
////  write a copy of your code also here for debouncing
//		LPC_SC->EXTINT &= (1 << 0); /* clear pending interrupt         */
//		return;
//	}
//	if ((tick - last_tick0) < debounce_time) {	
//        LPC_SC->EXTINT &= (1 << 0); /* clear pending interrupt         */
//        return;
//	}
//	last_tick0 = tick;
//	state0=1;
////  write code from here with or without debouncing
	
	int result=restoringSquareRoot(bin,cnt);
	LED_Out(result);
	LPC_SC->EXTINT &= (1 << 0);     /* clear pending interrupt         */
}


void EINT1_IRQHandler (void)	  
{
//	if(tick<debounce_time && state1==1){
//		state1=0;
//		last_tick1 = tick;
////    write a copy of your code also here for debouncing
//		LPC_SC->EXTINT &= (1 << 1);     /* clear pending interrupt         */
//		return;
//	}
//	if ((tick - last_tick1) < debounce_time) {	
//        LPC_SC->EXTINT &= (1 << 1); /* clear pending interrupt         */
//        return;
//	}
//	last_tick1 = tick;
////  write code from here with or without debouncing
	bin=bin<<1;
	cnt++;
	LPC_SC->EXTINT &= (1 << 1);     /* clear pending interrupt         */
}

void EINT2_IRQHandler (void)	  
{
//	if(tick<debounce_time && state2==1){
//		state2=0;
//		last_tick2 = tick;
////    write a copy of your code also here for debouncing
//		LPC_SC->EXTINT &= (1 << 2);     /* clear pending interrupt         */
//		return;
//	}
//	if ((tick - last_tick2) < debounce_time) {	
//        LPC_SC->EXTINT &= (1 << 2); /* clear pending interrupt         */
//        return;
//	}
//	last_tick2 = tick;
////  write code from here with or without debouncing
	bin = bin<<1 | 1 ;
	cnt++;
  LPC_SC->EXTINT &= (1 << 2);     /* clear pending interrupt         */    
}


