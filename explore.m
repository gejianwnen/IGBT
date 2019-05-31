%% clear 
clc;
clear all;
close all

%% laod data
% Thermal Overstress Aging with DC at gate

% file_folder = 'data\\Thermal Overstress Aging with DC at gate\\';
% file_name = '20080429T135531.mat';
% load([file_folder file_name]);
% 
% % join var
% TIME = TIME';
% COLLECTOR_CURRENT = COLLECTOR_CURRENT';
% COLLECTOR_VOLTAGE = COLLECTOR_VOLTAGE';
% GATE_CURRENT = GATE_CURRENT';
% GATE_VOLTAGE = GATE_VOLTAGE';
% HEAT_SINK_TEMP = HEAT_SINK_TEMP';
% PACKAGE_TEMP = PACKAGE_TEMP';
% DC_aging_df = table(TIME,COLLECTOR_CURRENT,COLLECTOR_VOLTAGE,GATE_CURRENT,GATE_VOLTAGE,HEAT_SINK_TEMP,PACKAGE_TEMP);
% writetable(DC_aging_df,[file_folder '20080429T135531.csv']);

%% laod data
% Thermal Overstress Aging with Square Signal at gate
file_folder = 'data\\Thermal Overstress Aging with Square Signal at gate\\';
file_name = 'april22nd-23rdIgbtIRCG40BC30kd-A17.mat';
load([file_folder file_name]);

% pwmTempControllerState = struct2table(measurement.pwmTempControllerState);
% writetable(pwmTempControllerState,[file_folder 'pwmTempControllerState.csv']);

% % extract steady State data    
% steadyState = struct([]);
% for i = 1:length(measurement.steadyState)
%     steadyState(i).date = measurement.steadyState(i).date;
%     steadyState(i).timeEpoch = measurement.steadyState(i).timeEpoch;
%     steadyState(i).supplyVoltage = measurement.steadyState(i).timeDomain.supplyVoltage;
%     steadyState(i).node1Voltage = measurement.steadyState(i).timeDomain.node1Voltage;
%     steadyState(i).node2Voltage = measurement.steadyState(i).timeDomain.node2Voltage;
%     steadyState(i).collectorEmitterCurrent = measurement.steadyState(i).timeDomain.collectorEmitterCurrent;
%     steadyState(i).heatSinkTempurature = measurement.steadyState(i).timeDomain.heatSinkTempurature;
%     steadyState(i).packageTempurature = measurement.steadyState(i).timeDomain.packageTempurature;
% end
% steadyState_df = struct2table(steadyState);
% writetable(steadyState_df,[file_folder 'steadyState.csv']);

% extract transient data
transient = struct([]);
for i = 1:length(measurement.transient)
    transient(i).date = measurement.transient(i).date;
    transient(i).timeEpoch = measurement.transient(i).timeSinceEpoch;
    % time domain
    transient(i).dt = measurement.transient(i).timeDomain.dt;
    % single table for each dt
%     single_df = struct([]);
    single_df.gateSignalVoltage = measurement.transient(i).timeDomain.gateSignalVoltage';
    single_df.gateEmitterVoltage = measurement.transient(i).timeDomain.gateEmitterVoltage';
    single_df.collectorEmitterVoltage = measurement.transient(i).timeDomain.collectorEmitterVoltage';
    single_df.collectorEmitterCurrentSingal = measurement.transient(i).timeDomain.collectorEmitterCurrentSignal';
    transient_df = struct2table(single_df);
    writetable(transient_df,[file_folder 'transient_timeDomain\\' num2str(i) '.csv']);
    % frequency domain
    transient(i).dxAmplitude = measurement.transient(i).frequencyDomain.dxAmplitude;
    transient(i).gateSignalAmplitude = measurement.transient(i).frequencyDomain.gateSignalAmplitude;
    transient(i).gateEmitterAmplitude = measurement.transient(i).frequencyDomain.gateEmitterAmplitude;
    transient(i).collectorEmitterAmplitude = measurement.transient(i).frequencyDomain.collectorEmitterAmplitude;
    transient(i).collectorEmitterCurrentAmplitude = measurement.transient(i).frequencyDomain.collectorEmitterCurrentAmplitude;
    transient(i).dxPhase = measurement.transient(i).frequencyDomain.dxPhase;
    transient(i).gateSignalPhase = measurement.transient(i).frequencyDomain.gateSignalPhase;
    transient(i).gateEmitterPhase = measurement.transient(i).frequencyDomain.gateEmitterPhase;
    transient(i).collectorEmitterPhase = measurement.transient(i).frequencyDomain.collectorEmitterPhase;
    transient(i).collectorEmitterCurrentPhase = measurement.transient(i).frequencyDomain.collectorEmitterCurrentPhase;
end

transient_df = struct2table(transient);
writetable(transient_df,[file_folder 'transient.csv']);














