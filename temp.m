% extract transient data
transient = struct([]);
for i = 1:length(measurement.transient)
    transient(i).date = measurement.transient(i).date;
    transient(i).timeEpoch = measurement.transient(i).timeSinceEpoch;
    % time domain
    transient(i).dt = measurement.transient(i).timeDomain.dt;
    transient(i).gateSignalVoltage = measurement.transient(i).timeDomain.gateSignalVoltage;
    transient(i).gateEmitterVoltage = measurement.transient(i).timeDomain.gateEmitterVoltage;
    transient(i).collectorEmitterVoltage = measurement.transient(i).timeDomain.collectorEmitterVoltage;
    transient(i).collectorEmitterCurrentSingal = measurement.transient(i).timeDomain.collectorEmitterCurrentSignal;
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