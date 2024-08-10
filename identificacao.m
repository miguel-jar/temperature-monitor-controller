%% Identifica��o por Smith (modelo escolhido)

clear
clc

load('dados\pt_ma_24_11.mat')

tempo = TARGET_DATA____ProjetoA11_POTENCIA(1, :);
degrau = TARGET_DATA____ProjetoA11_POTENCIA(2, :);
saida = TARGET_DATA____TEMPERATURA(2, :);

saida_norm = saida - saida(1);
vf = saida_norm(end);
amplitude_degrau = degrau(end);

for i = 1:length(saida_norm)
   if saida_norm(i) >= vf*0.283
       t1 = tempo(i);
       break
   end
end

for i = 1:length(saida_norm)
   if saida_norm(i) >= vf*0.632
       t2 = tempo(i);
       break
   end
end

tau = 1.5*(t2 - t1);
theta = t2 - tau;
k = vf/amplitude_degrau;

sys = tf(k, [tau, 1], 'InputDelay', theta)

ye = step(sys, tempo);
ye = ye*amplitude_degrau;
plot(tempo, saida_norm, 'g', tempo, ye, 'r')
legend('Curva real', 'Curva predita')

%% Identifica��o por Sudarezan

clear
clc

load('C:\Users\supervisorio\Documents\miguel_a110_projeto\Dados\pt_ma_24_11.mat')

tempo = TARGET_DATA____ProjetoA11_POTENCIA(1, :);
degrau = TARGET_DATA____ProjetoA11_POTENCIA(2, :);
saida = TARGET_DATA____TEMPERATURA(2, :);

saida_norm = saida - saida(1);
vf = saida_norm(end);
amplitude_degrau = degrau(end);

for i = 1:length(saida_norm)
   if saida_norm(i) >= vf*0.353
       t1 = tempo(i);
       break
   end
end

for i = 1:length(saida_norm)
   if saida_norm(i) >= vf*0.853
       t2 = tempo(i);
       break
   end
end

tau = 0.67*(t2 - t1);
theta = 1.3*t1 - 0.29*t2;
k = vf/amplitude_degrau;

sys = tf(k, [tau, 1], 'InputDelay', theta)

plot(tempo, saida_norm, 'g')
hold on
step(sys * amplitude_degrau, tempo, 'b');
