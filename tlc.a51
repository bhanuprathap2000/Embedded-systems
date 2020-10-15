org 0000h
ljmp start


org 0200h
	start:clr p0.0; set red led
	      setb p0.1;off yellow
		  setb p0.2;off green
		  lcall delayfor10;generate a delay of 10 sec
		  clr p0.1;yellow led on indicating red will turn off in sometime
		  lcall delayfor5;delay for yellow led
		  setb p0.0;off the red led
		  setb p0.1;off yellow led
		  clr p0.2;turn on green led
		  lcall delayfor10;delay for 10sec
		  clr p0.1;turn on yellow led for indicating the green will turn on
		  lcall delayfor5;delay for 5 sec
		  sjmp start;again repeat the same process
		  
		  org 1500h
			  delayfor10:mov tmod,#01h;initilize the timer
			             mov r0,#152;N1
			  back:   mov tl0,#00h;
						 mov th0,#00h;
						 
						 setb tr0;
					check:jnb tf0,check;66ms 66ms*152=10 sec
					      clr tf0;
						  clr tr0;
					      djnz r0,back
						  ret;
						  
		org 1700h
			  delayfor5:mov tmod,#01h;initilize the timer 
			            mov r0,#76;
			  back1:   mov tl0,#00h;
						 mov th0,#00h;
						 
						 setb tr0;
					check1:jnb tf0,check1
					       clr tf0;
						   clr tr0;
					      djnz r0,back1;we are able to generate the required delay
						  ret;
						  
						  
		  
end;
	

