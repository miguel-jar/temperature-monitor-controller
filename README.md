# temperature-monitor-controller
Este repositório contém o código e as configurações para um sistema de controle e monitoramento de uma planta de temperatura experimental. 

Utilizando o sistema SCADA desenvolvido com Elipse E3, é possível ajustar os parâmetros do controlador PID, com opções como Ziegler-Nichols (Malha Aberta e Malha Fechada), IMC, Auto Sintonia, ou configuração manual. Além disso, o sistema permite ligar e desligar o controle e oferece monitoramento em tempo real e histórico da temperatura.

O sistema de controle foi implementado em um CLP B&R X20CP1583, equipado com módulos de I/O digital e analógico. A troca de dados entre CLP e supervisor acontece via protocolo OPC UA.
