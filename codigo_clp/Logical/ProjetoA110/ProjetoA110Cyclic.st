(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: ProjetoA110
 * File: ProjetoA110Cyclic.st
 * Author: supervisorio
 * Created: November 18, 2023
 ********************************************************************
 * Implementation of program ProjetoA110
 ********************************************************************)

PROGRAM _CYCLIC
	TEMPERATURA := X / 327.67;
	
	PARAMETROS.Y_max := 100;
	PARAMETROS.Y_min := 0;
	
	IF LIGA = TRUE THEN
		BLOCO_PID.enable := TRUE;
		BLOCO_PWM.enable := TRUE;
		HABILITA_TRACE := TRUE;
	END_IF;
	
	IF EDGENEG(BOTAO_VERMELHO) OR LIGA = FALSE THEN
		BLOCO_PID.enable := FALSE;		
		BLOCO_PWM.enable := FALSE;	
		HABILITA_TRACE := FALSE;
		LIGA := FALSE;
	END_IF;
	
	IF ESTADO = 1 THEN
		BLOCO_PID.request := 1;
		KP := 0;
		TI := 0;
		TD := 0;
		
		IF BLOCO_PID.PIDTune_inst.state = 50 THEN
			ESTADO := 4;
			LIGA := FALSE;
		END_IF;
	ELSIF ESTADO = 3 THEN
		BLOCO_PID.request := 3;
		PARAMETROS.Kp := KP;
		PARAMETROS.Tn := TI;
		PARAMETROS.Tv := TD;
	ELSIF ESTADO = 4 THEN
		BLOCO_PID.request := 4;
		KP := PARAMETROS.Kp;
		TI := PARAMETROS.Tn;
		TD := PARAMETROS.Tv;
	END_IF;
			
	BLOCO_PID.pPar := ADR(PARAMETROS);
	BLOCO_PID.request := ESTADO;
	BLOCO_PID.W := SETPOINT;
	BLOCO_PID.X := TEMPERATURA;
	BLOCO_PID();
	
	BLOCO_PWM.max_value := 100;
	BLOCO_PWM.min_value := 0;
	BLOCO_PWM.t_min_pulse := 0;
	BLOCO_PWM.t_period := 1;
	BLOCO_PWM.x := BLOCO_PID.Y;
	BLOCO_PWM();
	
	SAIDA := BLOCO_PWM.pulse;
	SAIDA_PID := BLOCO_PID.Y;
END_PROGRAM
