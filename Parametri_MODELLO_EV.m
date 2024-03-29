%% Parametri MAT
Pn  = 170e3;    % W,  potenza nominale MAT
Vn  = 550;      % V,  tensione nominale rms fase-fase 
fn  = 60;       % Hz, frequenza nominale

Rs  = 0.0139;   % pu, Resistenza statore
Lls = 0.0672;   % pu, stator leakage inductance
Rr  = 0.0112;   % pu, Resistenza rotore (riporto allo statore)
Llr = 0.0672;   % pu, rotor leakage inductance, referred to the stator side
Lm  = 2.717;    % pu, Induttanza di magnetizzazione
Lr = Llr+Lm;    % pu, rotor inductance
Ls = Lls+Lm;    % pu, stator inductance

H = 0.2734;     % s, momento di inerzia
F = 0.0106;     % pu,coefficiente d'attrito ai cuscinetti
p = 2;          % poli MAT (numero pari)

Vbase = Vn/sqrt(3)*sqrt(2); % V, Tensione di picco linea - neutro
Ibase = Pn/(1.5*Vbase);     % A, Corrente base di picco
Zbase = Vbase/Ibase;        % ohm, Impedenza base
wbase = 2*pi*fn;            % rad/s, ws
Tbase = Pn/(wbase/p);       % N*m, Coppia base
psin  = (Vn/sqrt(3)*sqrt(2)/wbase);  %Flusso nominale

Rss = Rs*Zbase;  % ohm, Resistenza statore
Xls = Lls*Zbase; % ohm, stator leakage reactance
Rrr = Rr*Zbase;  % ohm, rotor resistance, referred to the stator side
Xlr = Llr*Zbase; % ohm, rotor leakage reactance, referred to the stator side
Xm = Lm*Zbase;   % ohm, magnetizing reactance

%% Parametri di controllo
Ts = 5e-5;        % s,  tempo di campionamento
fsw = 2e3;        % Hz, frequenza switching 
Tsc = 1/(fsw*10); % s,  tempo di campionamento controllo

% Parametri regolatore PI
Kp_wr = 65.47;
Ki_wr = 3134.24;

% Meccanica veicolo
M = 1200; % kg, massa veicolo
R = 0.44; % m, Raggio ruota
z = 3; % Rapporto di trasmissione albero motore - asse trazione
pend = 0; %pendenza veicolo

%Parametri batteria e inverter
Vbatt = 750; %V, tensione nominale batteria
R_batt = 0.05; %Resistenza interna batteria
R_carica = 2; %ohm, resistenza di carica batteria
R_scarica = 2; %ohm, resistenza di scarica batteria
Cap_batt = 3000; %Wh, Capacità batteria
Vinv = 750; %V, tensione in ingresso inverter