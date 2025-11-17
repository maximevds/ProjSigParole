
% 1. Charger le signal de parole original
data = load('fcno03fz.mat');
s = data.fcno03fz();

Fe = 8000;

rsb= [5, 10, 15];


database = struct('RSB_dB', {}, 'signal_bruit', {}, 'bruit', {});

for i = 1:length(rsb)
    rsb_dB = rsb(i);
    bruit_additif = generer_bruits(s, rsb_dB);
    signal_bruit = s + bruit_additif;
    
    database(i).RSB_dB = rsb_dB;
    database(i).signal_bruit = signal_bruit;
    database(i).bruit = bruit_additif;
end

save('noisy_speech_database.mat', 'database', 'Fe');

% La variable 'database' contient les 3 signaux bruités et est sauvegardée 
% dans le fichier 'noisy_speech_database.mat'.

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright"}
%---
