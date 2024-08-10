clear
clc

load('dados\pt_pid_imc.mat')

tempoIMC = TARGET_DATA____SETPOINT(1, :);
entradaIMC = TARGET_DATA____SETPOINT(2, :);
saidaIMC = TARGET_DATA____TEMPERATURA(2, :);

load('dados\pt_pid_zn_mf.mat')

tempoZNMF = TARGET_DATA____SETPOINT(1, :);
entradaZNMF = TARGET_DATA____SETPOINT(2, :);
saidaZNMF = TARGET_DATA____TEMPERATURA(2, :);

load('dados\pt_pid_zn_ma.mat')

tempoZNMA = TARGET_DATA____SETPOINT(1, :);
entradaZNMA = TARGET_DATA____SETPOINT(2, :);
saidaZNMA = TARGET_DATA____TEMPERATURA(2, :);

load('dados\pt_autosintonia.mat')

tempoAutosintonia = TARGET_DATA____SETPOINT(1, :);
entradaAutosintonia = TARGET_DATA____SETPOINT(2, :);
saidaAutosintonia = TARGET_DATA____TEMPERATURA(2, :);

sz = 4000;

plot(tempoIMC(1:sz), entradaIMC(1:sz), 'k')
hold on;
plot(tempoIMC(1:sz), saidaIMC(1:sz), 'r', tempoZNMF(1:sz), saidaZNMF(1:sz), 'g', tempoZNMA(1:sz), saidaZNMA(1:sz), 'b')
plot(tempoAutosintonia(1:sz), saidaAutosintonia(1:sz), 'm');

xlabel('Tempo [s]')
ylabel('Temperatura')
legend('Setpoint', 'IMC', 'ZN MF', 'ZN MA', 'Autosintonia')
