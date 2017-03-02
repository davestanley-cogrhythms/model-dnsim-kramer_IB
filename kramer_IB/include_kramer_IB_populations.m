
% % This script adds all the cell populations and their parameters. % %

% % % % % % % % % % % % %  Populations  % % % % % % % % % % % % %  
spec=[];
i=0;

%% IB Cells
if include_IB
    i=i+1;
    spec.populations(i).name = 'IB';
    spec.populations(i).size = N;
    spec.populations(i).equations = {['V''=@current/Cm; V(0)=' num2str(IC_V) ]};
    spec.populations(i).mechanism_list = {'iPeriodicPulsesFacilitate','iPeriodicPulsesiNMDADestexhe1998Markov.mech','IBdbiPoissonExpJason','itonicPaired','IBnoise','IBiNaF','IBiKDR','IBiMMich','IBiCaH','IBleak','IBleak2'};
    spec.populations(i).parameters = {...
      'V_IC',-65,'IC_noise',IC_noise,'Cm',Cm,'E_l',-67,'g_l',gl,...
      'E_l2',EGABA,'g_l2',0,...
      'PPstim', IBPPstim, 'PPfreq', PPfreq,      'PPwidth', PPwidth,'PPshift',PPshift,                    'PPonset', PPonset, 'PPoffset', PPoffset, 'ap_pulse_num', ap_pulse_num, 'ap_pulse_delay', ap_pulse_delay,'pulse_train_preset',pulse_train_preset,'kernel_type', kernel_type, 'width2_rise', width2_rise,'PPFacTau',PPFacTau,'PPFacFactor',IBPPFacFactor,...
      'gNMDA_pseudo',gNMDA_pseudo,'Rd ', Rd, 'Rr', Rr, ...    
      'gRAN',gRAN,'ERAN',ERAN,'tauRAN',tauRAN,'lambda',lambda,...
      'stim',Jd1,'onset',0,'offset',IB_offset1,'stim2',Jd2,'onset2',IB_onset2,'offset2',Inf,...
      'V_noise',IBda_Vnoise,...
      'gNaF',100,'E_NaF',ENa,...
      'gKDR',80,'E_KDR',E_EKDR,...
      'gM',2,'E_M',E_EKDR,...
      'gCaH',2,'E_CaH',ECa,...
      };
end

%% RS cells
if include_RS
    i=i+1;
    spec.populations(i).name = 'RS';
    spec.populations(i).size = Nrs;
    spec.populations(i).equations = {['V''=@current/Cm; V(0)=' num2str(IC_V) ]};
    spec.populations(i).mechanism_list = {'iPeriodicPulsesFacilitate','IBdbiPoissonExpJason','itonicPaired','IBnoise','IBiNaF','IBiKDR','IBiMMich','IBiCaH','IBleaknoisy'};
    spec.populations(i).parameters = {...
      'V_IC',-65,'IC_noise',IC_noise,'Cm',Cm,'E_l',-67,'E_l_std',RS_Eleak_std,'g_l',gl,...
      'PPstim', RSPPstim, 'PPfreq', PPfreq,      'PPwidth', PPwidth,'PPshift',PPshift,                    'PPonset', PPonset, 'PPoffset', PPoffset, 'ap_pulse_num', ap_pulse_num, 'ap_pulse_delay', ap_pulse_delay,'pulse_train_preset',pulse_train_preset,'kernel_type', kernel_type, 'width2_rise', width2_rise,'PPFacTau',RSPPFacTau,'PPFacFactor',RSPPFacFactor,...
      'gRAN',RSgRAN,'ERAN',ERAN,'tauRAN',tauRAN,'lambda',lambda,...
      'stim',JRS1,'onset',0,'offset',RS_offset1,'stim2',JRS2,'onset2',RS_onset2,'offset2',Inf,...
      'V_noise',RSda_Vnoise,...
      'gNaF',100,'E_NaF',ENa,...
      'gKDR',80,'E_KDR',E_EKDR,...
      'gM',0.5,'E_M',E_EKDR,...
      'gCaH',0,'E_CaH',ECa,...
      };
end

%% NG cells
if include_NG
    i=i+1;
    spec.populations(i).name = 'NG';
    spec.populations(i).size = Nng;
    spec.populations(i).equations = {['V''=@current/Cm; V(0)=' num2str(IC_V) ]};
    spec.populations(i).mechanism_list = {'iPeriodicPulsesFacilitate','itonicPaired','IBnoise','FSiNaF','FSiKDR','IBleak','iAhuguenard'};
    spec.populations(i).parameters = {...
      'V_IC',-65,'IC_noise',IC_noise,'Cm',Cm,'E_l',-67,'g_l',0.1,...
      'PPstim',NGPPstim,'PPfreq',PPfreq,'PPwidth',PPwidth,'PPshift',PPshift,'PPonset',PPonset,'PPoffset',PPoffset,'ap_pulse_num',ap_pulse_num,'ap_pulse_delay',ap_pulse_delay,'pulse_train_preset',pulse_train_preset,'kernel_type', kernel_type, 'width2_rise', width2_rise,'PPFacTau',PPFacTau,'PPFacFactor',PPFacFactor,...
      'stim',Jng1,'onset',0,'offset',50,'stim2',Jng2,'onset2',50,'offset2',Inf,...
      'V_noise',NG_Vnoise,...
      'gNaF',100,'E_NaF',ENa,...
      'gKDR',80,'E_KDR',E_EKDR,...
      'gA',20,'E_A',E_EKDR, ...
      };
end

%% FS cells
if include_FS

    FS_gM = 0;
    i=i+1;
    spec.populations(i).name = 'FS';
    spec.populations(i).size = Nfs;
    spec.populations(i).equations = {['V''=@current/Cm; V(0)=' num2str(IC_V) ]};
    spec.populations(i).mechanism_list = {'iPeriodicPulsesFacilitate','IBitonic','IBnoise','FSiNaF','FSiKDR','IBleaknoisy'};
    spec.populations(i).parameters = {...
      'V_IC',-65,'IC_noise',IC_noise,'Cm',Cm,'E_l',-67,'E_l_std',FS_Eleak_std,'g_l',0.1,...
      'PPstim',FSPPstim,'PPfreq',PPfreq,'PPwidth',PPwidth,'PPshift',PPshift,'PPonset',PPonset,'PPoffset',PPoffset,'ap_pulse_num',ap_pulse_num,'ap_pulse_delay',ap_pulse_delay,'pulse_train_preset',pulse_train_preset,'kernel_type', kernel_type, 'width2_rise', width2_rise,'PPFacTau',PPFacTau,'PPFacFactor',PPFacFactor,...
      'stim',Jfs,'onset',0,'offset',Inf,...
      'V_noise',FS_Vnoise,...
      'gNaF',100,'E_NaF',ENa,...
      'gKDR',80,'E_KDR',E_EKDR,...
      'gM',FS_gM,'E_M',E_EKDR,...
      };
end

%% LTS cells
if include_LTS
    i=i+1;
    spec.populations(i).name = 'LTS';
    spec.populations(i).size = Nlts;
    spec.populations(i).equations = {['V''=@current/Cm; V(0)=' num2str(IC_V) ]};
    spec.populations(i).mechanism_list = {'IBitonic','IBnoise','FSiNaF','FSiKDR','IBiMMich','IBleaknoisy'};
    spec.populations(i).parameters = {...
      'V_IC',-65,'IC_noise',IC_noise,'Cm',Cm,'E_l',-67,'E_l_std',LTS_Eleak_std,'g_l',0.1,...
      'stim',Jlts,'onset',0,'offset',Inf,...
      'V_noise',LTS_Vnoise,...
      'gNaF',100,'E_NaF',ENa,...
      'gKDR',80,'E_KDR',E_EKDR,...
      'gM',1,'E_M',E_EKDR,...
      };
end

%% Superficial NG cells
if include_supNG
    i=i+1;
    spec.populations(i).name = 'supNG';
    spec.populations(i).size = NsupNG;
    spec.populations(i).equations = {['V''=@current/Cm; V(0)=' num2str(IC_V) ]};
    spec.populations(i).mechanism_list = {'iPeriodicPulsesFacilitate','itonicPaired','IBnoise','FSiNaF','FSiKDR','IBleak','iAhuguenard'};
    spec.populations(i).parameters = {...
      'V_IC',-65,'IC_noise',IC_noise,'Cm',Cm,'E_l',-67,'g_l',0.1,...
      'PPstim',supNGPPstim,'PPfreq',PPfreq,'PPwidth',PPwidth,'PPshift',PPshift,'PPonset',PPonset,'PPoffset',PPoffset,'ap_pulse_num',ap_pulse_num,'ap_pulse_delay',ap_pulse_delay,'pulse_train_preset',pulse_train_preset,'kernel_type', kernel_type, 'width2_rise', width2_rise,'PPFacTau',PPFacTau,'PPFacFactor',PPFacFactor,...
      'stim',JsupNG1,'onset',0,'offset',50,'stim2',JsupNG2,'onset2',50,'offset2',Inf,...
      'V_noise',supNG_Vnoise,...
      'gNaF',100,'E_NaF',ENa,...
      'gKDR',80,'E_KDR',E_EKDR,...
      'gA',20,'E_A',E_EKDR, ...
      };
end

%% Deep cells

if include_deepFS
    i=i+1;
    spec.populations(i).name = 'deepFS';
    spec.populations(i).size = NdeepFS;
    spec.populations(i).equations = {['V''=(@current)/Cm; V(0)=' num2str(IC_V) '; monitor functions;']};
    spec.populations(i).mechanism_list = {'IBitonic','IBnoise','FSiNaF','FSiKDR','IBleak'};
    spec.populations(i).parameters = {...
      'V_IC',-65,'IC_noise',IC_noise,'Cm',Cm,'E_l',-67,'g_l',0.1,...
      'stim',deepJfs,'onset',0,'offset',Inf,...
      'V_noise',deepFS_Vnoise,...
      'gNaF',100,'E_NaF',ENa,...
      'gKDR',80,'E_KDR',E_EKDR,...
      };
end

if include_deepRS
    
    warning('Dave uses a different linker than Ben (D=(current); Ben=@current). To share mechanisms, should unify these.');
    
    i=i+1;
    spec.populations(i).name = 'deepRS';
    spec.populations(i).size = NdeepRS;
    spec.populations(i).equations = {['V''=(I_const+@current)/Cm; V(0)=' num2str(IC_V) '; monitor functions;']};
    %spec.populations(i).mechanism_list = {'iNaP','iKs','iKDRG','iNaG','gleak','CaDynT','iCaT','iKCaT','itonicBen'};
    spec.populations(i).mechanism_list = {'iNaP','iKs','iKDRG','iNaG','gleak',...
        'CaDynT','iCaT','iKCaT','iPeriodicPulsesBen','itonicBen'}; % 'iPeriodicSpikes',
    spec.populations(i).parameters = {...
      'Cm',Cm_Ben,'PPstim',deepRSPPstim,'gSpike',deepRSgSpike,...
      'gKs',gKs,'gNaP',gKs/gNaP_denom,'gKCa',gKCa,'bKCa',bKCa,'gCa',gCa,'CAF',CAF,...
      'gl',gl_dRS,'gNa',gNa_dRS,'gKDR',gKDR_dRS,...
      'I_const',I_const,'tau_h',tau_fast,'tau_m',tau_fast,... 
      'ton',500,'toff',tspan(end),'I_app',JdeepRS,'noise',0,...                                         %  (ton<t&t<toff) %%% 'PPstim = 0; PPfreq = 1.5; PPwidth = floor((1000/PPfreq)/4); PPshift = 0; ap_pulse_num = 0; kernel_type = 7;',... % in ms
      'PPonset',PPonset,...
      };
end
