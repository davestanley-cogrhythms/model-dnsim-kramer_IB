% Model: Kramer 2008, PLoS Comp Bio

% simulation controls
tspan=[0 100]; dt=.01; solver='euler'; % euler, rk2, rk4
dsfact=1; % downsample factor, applied after simulation

% number of cells per population
N=2;

% tonic input currents
Jd=23.5; % apical: 23.5(25.5), basal: 23.5(42.5)
Js=-4.5; % -4.5
Ja=-6;   % -6(-.4)

% Poisson IPSPs to IBdb (basal dendrite)
gRAN=125;

% some intrinsic currents
gAR_L=50;  % 50,  LTS - max conductance of h-channel
gAR_d=155; % 155, IBda - max conductance of h-channel

% connection strengths
gad=0;      % IBa -> IBdb, 0(.04)
gsd=.2;     % IBs -> IBda,IBdb
gds=.4;     % IBda,IBdb -> IBs
gas=.3;     % IBa -> IBs
gsa=.3;     % IBs -> IBa
ggja=.002;  % IBa -> IBa

% constant biophysical parameters
Cm=.9;        % membrane capacitance
ENa=50;      % sodium reversal potential
E_EKDR=-95;  % potassium reversal potential for excitatory cells
IB_Eh=-25;   % h-current reversal potential for deep layer IB cells
ECa=125;     % calcium reversal potential
IC_noise=.01;% fractional noise in initial conditions

IC_V = -0;

spec=[];
% spec.populations(1).name = 'IBda';
% spec.populations(1).size = N;
% spec.populations(1).equations = {['V''=(current)/Cm; V(0)=' num2str(IC_V) ]};
% spec.populations(1).mechanisms = {'IBdaitonic','IBdanoise','IBdaiNaF','IBdaiKDR','IBdaiAR','IBdaiM','IBdaiCaH','IBdaleak'};
% spec.populations(1).parameters = {...
%   'V_IC',-65,'IC_noise',IC_noise,'Cm',Cm,'E_l',-70,'g_l',2,...
%   'stim',Jd,'onset',0,'V_noise',.1,...
%   'gNaF',125,'E_NaF',ENa,'NaF_V0',34.5,'NaF_V1',59.4,'NaF_d1',10.7,'NaF_V2',33.5,'NaF_d2',15,'NaF_c0',.15,'NaF_c1',1.15,...
%   'gKDR',10,'E_KDR',E_EKDR,'KDR_V1',29.5,'KDR_d1',10,'KDR_V2',10,'KDR_d2',10,...
%   'gAR',gAR_d,'E_AR',IB_Eh,'AR_V12',-87.5,'AR_k',-5.5,'c_ARaM',2.75,'c_ARbM',3,'AR_L',1,'AR_R',1,...
%   'gM',.75,'E_M',E_EKDR,'c_MaM',1,'c_MbM',1,...
%   'gCaH',6.5,'E_CaH',ECa,'tauCaH',.33333,'c_CaHaM',3,'c_CaHbM',3,...
%   };
spec.populations(1).name = 'IBs';
spec.populations(1).size = N;
spec.populations(1).equations = {['V''=(current)/Cm; V(0)=' num2str(IC_V) ]};
spec.populations(1).mechanisms = {'IBsitonic','IBsnoise','IBsiNaF','IBsiKDR','IBsleak'};
spec.populations(1).parameters = {...
  'V_IC',-65,'IC_noise',IC_noise,'Cm',Cm,'E_l',-70,'g_l',1,...
  'stim',Js,'onset',0,'V_noise',0,...
  'gNaF',50,'E_NaF',ENa,'NaF_V0',34.5,'NaF_V1',59.4,'NaF_d1',10.7,'NaF_V2',33.5,'NaF_d2',15,'NaF_c0',.15,'NaF_c1',1.15,...
  'gKDR',10,'E_KDR',E_EKDR,'KDR_V1',29.5,'KDR_d1',10,'KDR_V2',10,'KDR_d2',10,...
  };
% spec.populations(3).name = 'IBdb';
% spec.populations(3).size = N;
% spec.populations(3).equations = {['V''=(current)/Cm; V(0)=' num2str(IC_V) ]};
% spec.populations(3).mechanisms = {'IBdbitonic','IBdbnoise','IBdbiNaF','IBdbiKDR','IBdbiAR','IBdbiM','IBdbiCaH','IBdbleak'};
% spec.populations(3).parameters = {... % same as IBda except gAR=115, + IPSP params
%   'V_IC',-65,'IC_noise',IC_noise,'Cm',Cm,'E_l',-70,'g_l',2,...
%   'stim',Jd,'onset',0,'V_noise',.1,'gRAN',gRAN,'ERAN',-80,'tauRAN',4,...
%   'gNaF',125,'E_NaF',ENa,'NaF_V0',34.5,'NaF_V1',59.4,'NaF_d1',10.7,'NaF_V2',33.5,'NaF_d2',15,'NaF_c0',.15,'NaF_c1',1.15,...
%   'gKDR',10,'E_KDR',E_EKDR,'KDR_V1',29.5,'KDR_d1',10,'KDR_V2',10,'KDR_d2',10,...
%   'gAR',115,'E_AR',IB_Eh,'AR_V12',-87.5,'AR_k',-5.5,'c_ARaM',2.75,'c_ARbM',3,'AR_L',1,'AR_R',1,...
%   'gM',.75,'E_M',E_EKDR,'c_MaM',1,'c_MbM',1,...
%   'gCaH',6.5,'E_CaH',ECa,'tauCaH',.33333,'c_CaHaM',3,'c_CaHbM',3,...
%   };

i=2;
spec.populations(i).name = 'IBa';
spec.populations(i).size = N;
spec.populations(i).equations = {['V''=(current)/Cm; V(0)=' num2str(IC_V) ]};
%spec.populations(i).equations = {['V''=(current+V_noise*randn(1,N_pop))/Cm; V(0)=' num2str(IC_V) ]};
spec.populations(i).mechanisms = {'IBaitonic','IBanoise','IBaiNaF','IBaiKDR','IBaiM','IBaleak'};
spec.populations(i).parameters = {...
  'V_IC',-65,'IC_noise',IC_noise,'Cm',Cm,'E_l',-70,'g_l',.25,...
  'stim',Ja,'onset',0,'V_noise',5.5,...
  'gNaF',100,'E_NaF',ENa,'NaF_V0',34.5,'NaF_V1',59.4,'NaF_d1',10.7,'NaF_V2',33.5,'NaF_d2',15,'NaF_c0',.15,'NaF_c1',1.15,...
  'gKDR',5,'E_KDR',E_EKDR,'KDR_V1',29.5,'KDR_d1',10,'KDR_V2',10,'KDR_d2',10,...
  'gM',1.5,'E_M',E_EKDR,'c_MaM',1.5,'c_MbM',.75,...
  };
% spec.connections(1,2).name = 'IBda-IBs';
% spec.connections(1,2).mechanisms = {'IBdaIBsiCOM'};
% spec.connections(1,2).parameters = {'g_COM',gds,'comspan',.5};
% spec.connections(2,1).name = 'IBs-IBda';
% spec.connections(2,1).mechanisms = {'IBsIBdaiCOM'};
% spec.connections(2,1).parameters = {'g_COM',gsd,'comspan',.5};
% spec.connections(2,3).name = 'IBs-IBdb';
% spec.connections(2,3).mechanisms = {'IBsIBdbiCOM'};
% spec.connections(2,3).parameters = {'g_COM',gsd,'comspan',.5};
% spec.connections(2,4).name = 'IBs-IBa';
% spec.connections(2,4).mechanisms = {'IBsIBaiCOM'};
% spec.connections(2,4).parameters = {'g_COM',gsa,'comspan',.5};
% spec.connections(3,2).name = 'IBdb-IBs';
% spec.connections(3,2).mechanisms = {'IBdbIBsiCOM'};
% spec.connections(3,2).parameters = {'g_COM',gds,'comspan',.5};
% spec.connections(4,2).name = 'IBa-IBs';
% spec.connections(4,2).mechanisms = {'IBaIBsiCOM'};
% spec.connections(4,2).parameters = {'g_COM',gas,'comspan',.5};
% spec.connections(4,3).name = 'IBa-IBdb';
% spec.connections(4,3).mechanisms = {'IBaIBdbiSYN'};
% spec.connections(4,3).parameters = {'g_SYN',gad,'E_SYN',0,'tauDx',100,'tauRx',.5,'fanout',inf,'IC_noise',0};
% spec.connections(4,4).name = 'IBa-IBa';
% spec.connections(4,4).mechanisms = {'IBaIBaiGAP'};
% spec.connections(4,4).parameters = {'g_GAP',ggja,'fanout',inf};

% spec.connections(1).direction='IBa->IBa';
% spec.connections(1).mechanism_list={'iGJ'};
% spec.connections(1).parameters={'gGJ',ggja};
% spec.connections(1).parameters={'gGJ',2};


% spec.connections(1).direction='IBa->IBs';
% spec.connections(1).mechanism_list={'iGJ'};
% spec.connections(1).parameters={'gGJ',20000};
% 
% spec.connections(2).direction='IBa<-IBs';
% spec.connections(2).mechanism_list={'iGJ'};
% spec.connections(2).parameters={'gGJ',20000};

% spec=[];
% spec.populations(1).name='E1';
% spec.populations(1).size=2;
% spec.populations(1).equations={'dv/dt=@current+10; {iNa,iK}; v(0)=-65;'};
% spec.populations(2).name='E2';
% spec.populations(2).size=2;
% spec.populations(2).equations='dv/dt=@current-0; {iNa,iK}; v(0)=-65';
% % s.connections(1).direction='E1<-E2';
% % s.connections(1).mechanism_list={'iGJ'};
% % s.connections(1).parameters={'gGJ',.2};
% spec.connections(1).direction='E1->E2';
% spec.connections(1).mechanism_list={'iGJ'};
% spec.connections(1).parameters={'gGJ',.2};





% DynaSim code
% data=SimulateModel(spec);
data=SimulateModel(spec,'tspan',tspan,'dt',dt,'dsfact',dsfact,'solver',solver,'coder',0,'random_seed',1);
%PlotData(data);
figl;
% subplot(411); plot(data.IBda_V)
subplot(211); plot(data.IBs_V)
% subplot(413); plot(data.IBdb_V)
subplot(212); plot(data.IBa_V)

% PlotData(data,'plot_type','waveform');

%% DNSim code
% process specification and simulate model
data = runsim(spec,'timelimits',tspan,'dt',dt,'dsfact',dsfact,'solver',solver,'coder',0);
plotv(data,spec,'varlabel','V');


% % Plot other currents
% plotv(data,spec,'varlabel','iKDR_mKDR');
% plotv(data,spec,'varlabel','iCaH_mCaH');
% plotv(data,spec,'varlabel','iM_mM');
% plotv(data,spec,'varlabel','iAR_mAR');
% plotv(data,spec,'varlabel','iSYN_sSYNpre');


% dnsim(spec);

