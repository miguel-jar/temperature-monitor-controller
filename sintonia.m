%% Sinonia por ZN malha aberta

clc

kp_zn_ma = (1.2 * tau) / (k * theta)
ti_zn_ma = 2 * theta
td_zn_ma = theta / 2.0

ki_zn_ma = kp_zn_ma / ti_zn_ma;
kd_zn_ma = kp_zn_ma * td_zn_ma;

pid_zn_ma = tf([kd_zn_ma kp_zn_ma ki_zn_ma], [1, 0]);
sys_zn_ma = feedback(sys*pid_zn_ma, 1);

step(sys_zn_ma)

%% Sinonia por ZN malha fechada

clc

sysp = pade(sys);  % Modelando o atraso por Padé pra conseguir plotar o RLOCUS

rlocus(sysp)

kc = 6.9;
pc = 2 * pi / 0.0739;

kp_zn_mf = 0.6 * kc
ti_zn_mf = pc/2.0
td_zn_mf = pc/8.0

ki_zn_mf = kp_zn_mf / ti_zn_mf;
kd_zn_mf = kp_zn_mf * td_zn_mf;

pid_zn_mf = tf([kd_zn_mf kp_zn_mf ki_zn_mf], [1, 0]);
sys_zn_mf = feedback(sys*pid_zn_mf, 1);

step(sys_zn_mf)

%% Sinonia por IMC

clc

ts_novo = 2 * tau;
lambda = ts_novo / 4.0;

kp_imc = (2*tau + theta) / (2*k*lambda)
ti_imc = tau + theta / 2.0
td_imc = tau * theta / (2 * tau + theta)

ki_imc = kp_imc / ti_imc;
kd_imc = kp_imc * td_imc;

pid_imc = tf([kd_imc kp_imc ki_imc], [1, 0]);
sys_imc = feedback(sys * pid_imc, 1);

step(sys_imc)

%% Autosintonia CLP

clc

kp_autosintonia = 15.63258
ti_autosintonia = 28.603174
td_autosintonia = 7.1504

ki_autosintonia = kp_autosintonia / ti_autosintonia;
kd_autosintonia = kp_autosintonia * td_autosintonia;

pid_autosintonia = tf([kd_autosintonia kp_autosintonia ki_autosintonia], [1, 0]);
sys_autosintonia = feedback(sys * pid_autosintonia, 1);

step(sys_autosintonia)
% legend('ZN MA', 'ZN MF', 'IMC', 'Auto Sintonia')
