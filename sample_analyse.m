%% clear 
clc;
clear all;
close all

%% laod data
% Thermal Overstress Aging with DC at gate

% file_folder = 'data\\Thermal Overstress Aging with DC at gate\\';
% file_name = '20080429T135531.csv';
% data_table = readtable([file_folder file_name]);
% 
% %% plot
% 
% COLLECTOR_CURRENT = data_table.COLLECTOR_CURRENT;
% COLLECTOR_VOLTAGE = data_table.COLLECTOR_VOLTAGE;
% GATE_CURRENT = data_table.GATE_CURRENT;
% GATE_VOLTAGE = data_table.GATE_VOLTAGE;
% HEAT_SINK_TEMP = data_table.HEAT_SINK_TEMP;
% PACKAGE_TEMP = data_table.PACKAGE_TEMP;
% 
% figure();
% plot(data_table.COLLECTOR_CURRENT);
% figure();
% plot(data_table.COLLECTOR_VOLTAGE);
% figure();
% plot(data_table.GATE_CURRENT);% the peak of the gate current increase
% figure();
% plot(data_table.HEAT_SINK_TEMP);
% figure();
% plot(data_table.PACKAGE_TEMP);

%% laod data 
% Thermal Overstress Aging with Square Signal at gate
file_folder = 'data\\Thermal Overstress Aging with Square Signal at gate\\';
file_name = 'april22nd-23rdIgbtIRCG40BC30kd-A17.mat';
load([file_folder file_name]);

%% plot
close all
i = 400;

figure();
gateSignalVoltage = measurement.transient(i).timeDomain.gateSignalVoltage';
plot(gateSignalVoltage)
figure();
gateEmitterVoltage = measurement.transient(i).timeDomain.gateEmitterVoltage';
plot(gateEmitterVoltage)
figure();
collectorEmitterVoltage = measurement.transient(i).timeDomain.collectorEmitterVoltage';
plot(collectorEmitterVoltage)
figure();
collectorEmitterCurrentSingal = measurement.transient(i).timeDomain.collectorEmitterCurrentSignal';
plot(collectorEmitterCurrentSingal)

%% frequence domain analyse

gateSignalVoltage_f = abs(fft(gateSignalVoltage));
figure();
plot(gateSignalVoltage_f)

% gateSignalVoltage_






















