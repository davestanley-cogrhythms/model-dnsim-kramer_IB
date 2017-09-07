
% This script runs multiple simulations with pre-defined parameters. This
% will reproduce all the figures in the paper. It works by calling
% kramer_IB_function_mode, which in turn runs kramer_IB.m

%% Figures 1 Test turning on/off PPStim for various populations
% Setup
clear s
f = 0;

% Simulation batch 1
f = f + 1;
s{f} = struct;
s{f}.save_figures_move_to_Figs_repo = true;
s{f}.sim_mode = 1;
s{f}.parallel_flag = 1;
i=0;
i=i+1; s{f}.vary{i} = {'(IB,RS,FS)','PP_gSYN',[0.25, 0.2, 0.2]};     % Rows are applied to populations
i=i+1; s{f}.vary{i} = {'(IB,RS,FS)','PP_gSYN',[0.00, 0.2, 0.1]};
i=i+1; s{f}.vary{i} = {'(IB,RS,FS)','PP_gSYN',[0.25, 0.0, 0.0]};

clear data;
for f = 1:length(s)
    datac{f} = kramer_IB_function_mode(s{f});
end
data = datac{1};



%% Figures 2 Test varying stim frequency

% Setup
clear s
f = 0;

% Simulation batch 1
f = f + 1;
s{f} = struct;
s{f}.save_figures_move_to_Figs_repo = true;
s{f}.parallel_flag = 1;
s{f}.vary = {'(IB,RS,FS)','PPfreq',[10,30,50,70]};     % Rows are applied to populations

clear data;
for f = 1:length(s)
    datac{f} = kramer_IB_function_mode(s{f});
end
data = datac{1};


%% Figures 2 Test everything default

% Setup
clear s
f = 0;

% Simulation batch 1
f = f + 1;
s{f} = struct;
s{f}.save_figures_move_to_Figs_repo = true;
s{f}.repo_studyname = ['Batch2p' num2str(f)];

clear data;
for f = 1:length(s)
    datac{f} = kramer_IB_function_mode(s{f});
end
data = datac{1};



%% Figures 3 Test without RS PPStim

% Setup
clear s
f = 0;

% Simulation batch 1
f = f + 1;
s{f} = struct;
s{f}.save_figures_move_to_Figs_repo = true;
s{f}.RS_PP_gSYN = 0;     % Set RS PPStim to zero
s{f}.repo_studyname = ['Batch3p' num2str(f)];

clear data;
for f = 1:length(s)
    datac{f} = kramer_IB_function_mode(s{f});
end
data = datac{1};



%% Figures 4 Spontaneous 

% Setup
clear s
f = 0;

% Simulation batch 1
f = f + 1;
s{f} = struct;
s{f}.save_figures_move_to_Figs_repo = true;
s{f}.pulse_mode = 0;     % Turn off pulsemode
s{f}.repo_studyname = ['Batch4p' num2str(f)];

clear data;
for f = 1:length(s)
    datac{f} = kramer_IB_function_mode(s{f});
end
data = datac{1};

%% Figures 5 All paper figures

% Setup
clear s
f = 0;

% Default sim with AP
f = f + 1;
s{f} = struct;
s{f}.save_figures_move_to_Figs_repo = true;
s{f}.repo_studyname = ['Batch5' num2str(f)];

% Default sim with PP
f = f + 1;
s{f} = struct;
s{f}.save_figures_move_to_Figs_repo = true;
s{f}.repo_studyname = ['Batch5' num2str(f)];
s{f}.ap_pulse_num = 0;

clear data;
parfor f = 1:length(s)
    datac{f} = kramer_IB_function_mode(s{f},f);
end
data = datac{1};


