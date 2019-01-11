
% This script runs multiple simulations with pre-defined parameters. This
% will reproduce all the figures in the paper. It works by calling
% kramer_IB_function_mode, which in turn runs kramer_IB.m
%
% kramer_IB_deltapaper_scripts1 - Initial testing of network
% kramer_IB_deltapaper_scripts2 - Figures used in actual paper.

function kramer_IB_deltapaper_tune1(chosen_cell,maxNcores)


if nargin < 2
    maxNcores = Inf; 
end

namesuffix = '_gRAN_0.5_redo';
namesuffix = '_gRAN_0.5_highrez';
%namesuffix = '_IBPPStim0.3';
% namesuffix = '_gar0.0';
% namesuffix = '';

switch chosen_cell
    case '0a'
        %% Basic sim test 1 - Pure default simulation with save figs turned on 
        clear s
        f = 1;
        s{f} = struct;
        s{f}.save_figures = 0; s{f}.save_combined_figures = 0; s{f}.plot_on = 0; s{f}.plot_on2 = 1; s{f}.do_visible = 'off'; s{f}.save_simfiles_to_repo_presim = true; s{f}.save_everything_to_repo_postsim = true; s{f}.do_commit = 1;
        s{f}.repo_studyname = ['198_sm16pm1' namesuffix];
        s{f}.sim_mode = 16;
        s{f}.pulse_mode = 1;
        
        a = clock; s{f}.random_seed = floor(a(end-1)*60+a(end));    % Random seed locked to current clock
        
        datapf0a = kramer_IB_function_mode(s{f},f);
        
    case '0b'
        %% Basic sim test 2
        clear s
        f = 1;
        s{f} = struct;
        s{f}.save_figures = 0; s{f}.save_combined_figures = 0; s{f}.plot_on = 0; s{f}.plot_on2 = 1; s{f}.do_visible = 'off'; s{f}.save_simfiles_to_repo_presim = true; s{f}.save_everything_to_repo_postsim = true; s{f}.do_commit = 0;
        s{f}.repo_studyname = ['198_sm16pm7' namesuffix];
        s{f}.sim_mode = 16;
        s{f}.pulse_mode = 7;
        a = clock; s{f}.random_seed = floor(a(end-1)*60+a(end));    % Random seed locked to current clock
        
        datapf0b = kramer_IB_function_mode(s{f},f);
        
    case '20'
        %% Basic sim test 1 - Pure default simulation with save figs turned on 
        clear s
        f = 1;
        s{f} = struct;
        s{f}.save_figures = 0; s{f}.save_combined_figures = 0; s{f}.plot_on = 1; s{f}.plot_on2 = 0; s{f}.do_visible = 'off'; s{f}.save_simfiles_to_repo_presim = true; s{f}.save_everything_to_repo_postsim = true; s{f}.do_commit = 1;
        s{f}.repo_studyname = ['sweep4D_sm20pm1' namesuffix];
        s{f}.sim_mode = 20;
        s{f}.mycomment = [''];
        s{f}.pulse_mode = 1;
        s{f}.maxNcores = maxNcores; s{f}.parallel_flag = 1;     % Parallel flag and Ncores should always be active
        
        a = clock; s{f}.random_seed = floor(a(end-1)*60+a(end));    % Random seed locked to current clock
        
        s{f}.plot_on = 1;
        s{f}.save_combined_figures = 0;      % Flag for saving dsPlot2 across all simulations in data.
        s{f}.save_composite_figures = 0;     % Flag for saving composite figures comprised of multiple subfigures.
        
        datap20 = kramer_IB_function_mode(s{f},f);
        
    case '21'
        %% Basic sim test 1 - Pure default simulation with save figs turned on 
        clear s
        f = 1;
        s{f} = struct;
        s{f}.save_figures = 0; s{f}.save_combined_figures = 0; s{f}.plot_on = 1; s{f}.plot_on2 = 0; s{f}.do_visible = 'off'; s{f}.save_simfiles_to_repo_presim = true; s{f}.save_everything_to_repo_postsim = true; s{f}.do_commit = 1;
        s{f}.repo_studyname = ['sweep4D_sm21pm7' namesuffix];
        s{f}.mycomment = [''];
        s{f}.sim_mode = 21;
        s{f}.pulse_mode = 7;
        s{f}.maxNcores = maxNcores; s{f}.parallel_flag = 1;     % Parallel flag and Ncores should always be active
        
        a = clock; s{f}.random_seed = floor(a(end-1)*60+a(end));    % Random seed locked to current clock
        
        s{f}.plot_on = 1;
        s{f}.save_combined_figures = 0;      % Flag for saving dsPlot2 across all simulations in data.
        s{f}.save_composite_figures = 0;     % Flag for saving composite figures comprised of multiple subfigures.
        
        datap21 = kramer_IB_function_mode(s{f},f);
        
    case '1a1'
        %% Paper Figs 1a - Pulse train no AP
        
        clear s
        f = 1;
        s{f} = struct;
        s{f}.save_figures = 1; s{f}.save_combined_figures = 1; s{f}.plot_on = 0; s{f}.plot_on2 = 0; s{f}.do_visible = 'off'; s{f}.save_simfiles_to_repo_presim = true; s{f}.save_everything_to_repo_postsim = true; s{f}.do_commit = 0;
        s{f}.repo_studyname = ['tune1Fig1a1' num2str(f) '' namesuffix];
        s{f}.pulse_mode = 1;
        s{f}.pulse_train_preset = 0;
        s{f}.PPfreq = 40; % in Hz
        s{f}.tspan=[0 2500];
        s{f}.PPonset=400;
        s{f}.PPoffset = 2000;
        s{f}.maxNcores = maxNcores; s{f}.parallel_flag = 1;     % Parallel flag and Ncores should always be active
        
        a = clock; s{f}.random_seed = floor(a(end-1)*60+a(end));    % Random seed locked to current clock
        
        datapf1a = kramer_IB_function_mode(s{f},f);
        
    case '1b1'
        %% Paper Figs 1b - Pulse train AP
        
        clear s
        f = 1;
        s{f} = struct;
        s{f}.save_figures = 1; s{f}.save_combined_figures = 1; s{f}.plot_on = 0; s{f}.plot_on2 = 0; s{f}.do_visible = 'off'; s{f}.save_simfiles_to_repo_presim = true; s{f}.save_everything_to_repo_postsim = true; s{f}.do_commit = 0;
        s{f}.repo_studyname = ['tune1Fig1b1' num2str(f) '' namesuffix];
        s{f}.pulse_mode = 1;
        s{f}.pulse_train_preset = 1;
        s{f}.PPfreq = 40; % in Hz
        s{f}.tspan=[0 1500];
        s{f}.PPonset=400;
        s{f}.PPoffset = 1500;
        s{f}.maxNcores = maxNcores; s{f}.parallel_flag = 1;     % Parallel flag and Ncores should always be active
        
        s{f}.sim_mode = 11;
        
        a = clock; s{f}.random_seed = floor(a(end-1)*60+a(end));    % Random seed locked to current clock
        
        datapf1b = kramer_IB_function_mode(s{f},f);
        
    case '1b2'
        %% Paper Figs 1b - Pulse train AP
        
        clear s
        f = 1;
        s{f} = struct;
        s{f}.save_figures = 1; s{f}.save_combined_figures = 1; s{f}.plot_on = 0; s{f}.plot_on2 = 0; s{f}.do_visible = 'off'; s{f}.save_simfiles_to_repo_presim = true; s{f}.save_everything_to_repo_postsim = true; s{f}.do_commit = 0;
        s{f}.repo_studyname = ['tune1Fig1b2' num2str(f) '' namesuffix];
        s{f}.pulse_mode = 1;
        s{f}.pulse_train_preset = 1;
        s{f}.PPfreq = 40; % in Hz
        s{f}.tspan=[0 1500];
        s{f}.PPonset=400;
        s{f}.PPoffset = 1500;
        s{f}.maxNcores = maxNcores; s{f}.parallel_flag = 1;     % Parallel flag and Ncores should always be active
        
        a = clock; s{f}.random_seed = floor(a(end-1)*60+a(end));    % Random seed locked to current clock
        
        % % Only superficial oscillator
        s{f}.include_IB =   0;
        s{f}.include_RS =   1;
        s{f}.include_FS =   1;
        s{f}.include_LTS =  1;
        s{f}.include_NG =   0;
        s{f}.include_dFS5 = 0;
        s{f}.include_tFS5 = 0;
        s{f}.include_deepRS = 0;
        s{f}.include_deepFS = 0;
        
        datapf1b = kramer_IB_function_mode(s{f},f);

    case '1c' 
        %% Paper Figs 1c - Spontaneous
        clear s
        f=1;
        s{f} = struct;
        s{f}.save_figures = 1; s{f}.save_combined_figures = 1; s{f}.plot_on = 0; s{f}.plot_on2 = 0; s{f}.do_visible = 'off'; s{f}.save_simfiles_to_repo_presim = true; s{f}.save_everything_to_repo_postsim = true; s{f}.do_commit = 0;
        s{f}.repo_studyname = ['tune1Fig1c' num2str(f) '' namesuffix];
        s{f}.pulse_mode = 0;     % Turn off pulsemode
        s{f}.tspan=[0 3500];
        s{f}.PPonset=900;
        s{f}.PPoffset = 2000;
        s{f}.maxNcores = maxNcores; s{f}.parallel_flag = 1;     % Parallel flag and Ncores should always be active
        
        s{f}.sim_mode = 12;
        
        a = clock; s{f}.random_seed = floor(a(end-1)*60+a(end));    % Random seed locked to current clock
        
        datapf1c = kramer_IB_function_mode(s{f},f);
        
    case '1d'
        %% Paper Figs 1d - Tones - like 1a, except tones instead of 40 Hz
        
        clear s
        f = 1;
        s{f} = struct;
        s{f}.save_figures = 1; s{f}.save_combined_figures = 1; s{f}.plot_on = 0; s{f}.plot_on2 = 0; s{f}.do_visible = 'off'; s{f}.save_simfiles_to_repo_presim = true; s{f}.save_everything_to_repo_postsim = true; s{f}.do_commit = 0;
        s{f}.repo_studyname = ['tune1Fig1d' num2str(f) '' namesuffix];
        s{f}.pulse_mode = 1;
        s{f}.pulse_train_preset = 0;
        s{f}.kerneltype_Poiss_IB = 4;         % Set to 4 for IB tones
        s{f}.tspan=[0 2500];
        s{f}.PPonset=900;
        s{f}.PPoffset = 2000;
        s{f}.maxNcores = maxNcores; s{f}.parallel_flag = 1;     % Parallel flag and Ncores should always be active
        
        a = clock; s{f}.random_seed = floor(a(end-1)*60+a(end));    % Random seed locked to current clock
        
        datapf1d = kramer_IB_function_mode(s{f},f);


    case '4a'
        
        %% Paper Figs 4a - Lakatos
        clear s
        f = 1;
        s{f} = struct;
        s{f}.save_figures = 1; s{f}.save_combined_figures = 1; s{f}.plot_on = 0; s{f}.plot_on2 = 0; s{f}.do_visible = 'off'; s{f}.save_simfiles_to_repo_presim = true; s{f}.save_everything_to_repo_postsim = true; s{f}.do_commit = 0;
        s{f}.repo_studyname = ['tune1Fig4_lakatos' num2str(f) '' namesuffix];
        s{f}.kerneltype_Poiss_IB = 4;         % Set to 4 for IB tones
        s{f}.pulse_mode = 5;
        s{f}.tspan=[0 5500];
        s{f}.maxNcores = maxNcores; s{f}.parallel_flag = 1;     % Parallel flag and Ncores should always be active
        
        datapf4a = kramer_IB_function_mode(s{f},f);

    case '9a'
        %% Paper 9 - Polley figure
        % Setup
        clear s
        f=1;
        s{f} = struct;
        s{f}.save_figures = 1; s{f}.save_combined_figures = 1; s{f}.plot_on = 0; s{f}.plot_on2 = 0; s{f}.do_visible = 'off'; s{f}.save_simfiles_to_repo_presim = true; s{f}.save_everything_to_repo_postsim = true; s{f}.do_commit = 0;
        s{f}.repo_studyname = ['DeltaFig9a_polley' num2str(f) '' namesuffix];
        s{f}.pulse_mode = 6;
        s{f}.tspan=[0 3500];
        s{f}.maxNcores = maxNcores; s{f}.parallel_flag = 1;     % Parallel flag and Ncores should always be active
        
        datapf9a = kramer_IB_function_mode(s{f},f);
        
        
    case '9b'
        %% Paper 9b - Tune Polley figure
        % Setup
        clear s
        f=1;
        s{f} = struct;
        s{f}.save_figures = 1; s{f}.save_combined_figures = 1; s{f}.plot_on = 0; s{f}.plot_on2 = 0; s{f}.do_visible = 'off'; s{f}.save_simfiles_to_repo_presim = true; s{f}.save_everything_to_repo_postsim = true; s{f}.do_commit = 0;
        s{f}.repo_studyname = ['DeltaFig9b_polleytune' num2str(f) '' namesuffix];
        s{f}.pulse_mode = 6;
        s{f}.tspan=[0 5500];
        s{f}.maxNcores = maxNcores; s{f}.parallel_flag = 1;     % Parallel flag and Ncores should always be active

        datapf9b = kramer_IB_function_mode(s{f},f);
        
        
    %% % % % % % % % % % % % % % % % % % % % % % Supplementary stuff - Sweep PPfreq % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
        
    case '1b1_32Hz'
        %% Paper Figs 1b - Pulse train AP
        
        clear s
        f = 1;
        s{f} = struct;
        s{f}.save_figures = 1; s{f}.save_combined_figures = 1; s{f}.plot_on = 0; s{f}.plot_on2 = 0; s{f}.do_visible = 'off'; s{f}.save_simfiles_to_repo_presim = true; s{f}.save_everything_to_repo_postsim = true; s{f}.do_commit = 0;
        s{f}.repo_studyname = ['tune1Fig1b1_32Hz' num2str(f) '' namesuffix];
        s{f}.pulse_mode = 1;
        s{f}.pulse_train_preset = 1;
        s{f}.PPfreq = 32.7; % in Hz
        s{f}.ap_pulse_delay = 15.3;                        % ms, the amount the spike should be delayed. 0 for no aperiodicity.
        s{f}.tspan=[0 2500];
        s{f}.PPonset=400;
        s{f}.PPoffset = 2000;
        s{f}.maxNcores = maxNcores; s{f}.parallel_flag = 1;     % Parallel flag and Ncores should always be active
        
        a = clock; s{f}.random_seed = floor(a(end-1)*60+a(end));    % Random seed locked to current clock
        
        datapf1b = kramer_IB_function_mode(s{f},f);
        
    case '1b2_32Hz'
        %% Paper Figs 1b - Pulse train AP
        
        clear s
        f = 1;
        s{f} = struct;
        s{f}.save_figures = 1; s{f}.save_combined_figures = 1; s{f}.plot_on = 0; s{f}.plot_on2 = 0; s{f}.do_visible = 'off'; s{f}.save_simfiles_to_repo_presim = true; s{f}.save_everything_to_repo_postsim = true; s{f}.do_commit = 0;
        s{f}.repo_studyname = ['tune1Fig1b2_32Hz' num2str(f) '' namesuffix];
        s{f}.pulse_mode = 1;
        s{f}.pulse_train_preset = 1;
        s{f}.PPfreq = 32.7; % in Hz
        s{f}.ap_pulse_delay = 15.3;                        % ms, the amount the spike should be delayed. 0 for no aperiodicity.
        s{f}.tspan=[0 2500];
        s{f}.PPonset=400;
        s{f}.PPoffset = 2000;
        s{f}.maxNcores = maxNcores; s{f}.parallel_flag = 1;     % Parallel flag and Ncores should always be active
        
        a = clock; s{f}.random_seed = floor(a(end-1)*60+a(end));    % Random seed locked to current clock
        
        % % Only superficial oscillator
        s{f}.include_IB =   0;
        s{f}.include_RS =   1;
        s{f}.include_FS =   1;
        s{f}.include_LTS =  1;
        s{f}.include_NG =   0;
        s{f}.include_dFS5 = 0;
        s{f}.include_tFS5 = 0;
        s{f}.include_deepRS = 0;
        s{f}.include_deepFS = 0;
        
        datapf1b = kramer_IB_function_mode(s{f},f);
        
    case '1b1_26Hz'
        %% Paper Figs 1b - Pulse train AP
        
        clear s
        f = 1;
        s{f} = struct;
        s{f}.save_figures = 1; s{f}.save_combined_figures = 1; s{f}.plot_on = 0; s{f}.plot_on2 = 0; s{f}.do_visible = 'off'; s{f}.save_simfiles_to_repo_presim = true; s{f}.save_everything_to_repo_postsim = true; s{f}.do_commit = 0;
        s{f}.repo_studyname = ['tune1Fig1b1_26Hz' num2str(f) '' namesuffix];
        s{f}.pulse_mode = 1;
        s{f}.pulse_train_preset = 1;
        s{f}.PPfreq = 26.7; % in Hz
        s{f}.ap_pulse_delay = 18.8;                        % ms, the amount the spike should be delayed. 0 for no aperiodicity.
        s{f}.tspan=[0 2500];
        s{f}.PPonset=400;
        s{f}.PPoffset = 2000;
        s{f}.maxNcores = maxNcores; s{f}.parallel_flag = 1;     % Parallel flag and Ncores should always be active
        
        a = clock; s{f}.random_seed = floor(a(end-1)*60+a(end));    % Random seed locked to current clock
        
        datapf1b = kramer_IB_function_mode(s{f},f);
        
    case '1b2_26Hz'
        %% Paper Figs 1b - Pulse train AP
        
        clear s
        f = 1;
        s{f} = struct;
        s{f}.save_figures = 1; s{f}.save_combined_figures = 1; s{f}.plot_on = 0; s{f}.plot_on2 = 0; s{f}.do_visible = 'off'; s{f}.save_simfiles_to_repo_presim = true; s{f}.save_everything_to_repo_postsim = true; s{f}.do_commit = 0;
        s{f}.repo_studyname = ['tune1Fig1b2_26Hz' num2str(f) '' namesuffix];
        s{f}.pulse_mode = 1;
        s{f}.pulse_train_preset = 1;
        s{f}.PPfreq = 26.7; % in Hz
        s{f}.ap_pulse_delay = 18.8;                        % ms, the amount the spike should be delayed. 0 for no aperiodicity.
        s{f}.tspan=[0 2500];
        s{f}.PPonset=400;
        s{f}.PPoffset = 2000;
        s{f}.maxNcores = maxNcores; s{f}.parallel_flag = 1;     % Parallel flag and Ncores should always be active
        
        a = clock; s{f}.random_seed = floor(a(end-1)*60+a(end));    % Random seed locked to current clock
        
        % % Only superficial oscillator
        s{f}.include_IB =   0;
        s{f}.include_RS =   1;
        s{f}.include_FS =   1;
        s{f}.include_LTS =  1;
        s{f}.include_NG =   0;
        s{f}.include_dFS5 = 0;
        s{f}.include_tFS5 = 0;
        s{f}.include_deepRS = 0;
        s{f}.include_deepFS = 0;
        
        datapf1b = kramer_IB_function_mode(s{f},f);
        
    case '1b1_21Hz'
        %% Paper Figs 1b - Pulse train AP
        
        clear s
        f = 1;
        s{f} = struct;
        s{f}.save_figures = 1; s{f}.save_combined_figures = 1; s{f}.plot_on = 0; s{f}.plot_on2 = 0; s{f}.do_visible = 'off'; s{f}.save_simfiles_to_repo_presim = true; s{f}.save_everything_to_repo_postsim = true; s{f}.do_commit = 0;
        s{f}.repo_studyname = ['tune1Fig1b1_21Hz' num2str(f) '' namesuffix];
        s{f}.pulse_mode = 1;
        s{f}.pulse_train_preset = 1;
        s{f}.PPfreq = 21.8; % in Hz
        s{f}.ap_pulse_delay = 23.0;                        % ms, the amount the spike should be delayed. 0 for no aperiodicity.
        s{f}.tspan=[0 2500];
        s{f}.PPonset=400;
        s{f}.PPoffset = 2000;
        s{f}.maxNcores = maxNcores; s{f}.parallel_flag = 1;     % Parallel flag and Ncores should always be active
        
        a = clock; s{f}.random_seed = floor(a(end-1)*60+a(end));    % Random seed locked to current clock
        
        datapf1b = kramer_IB_function_mode(s{f},f);
        
    case '1b2_21Hz'
        %% Paper Figs 1b - Pulse train AP
        
        clear s
        f = 1;
        s{f} = struct;
        s{f}.save_figures = 1; s{f}.save_combined_figures = 1; s{f}.plot_on = 0; s{f}.plot_on2 = 0; s{f}.do_visible = 'off'; s{f}.save_simfiles_to_repo_presim = true; s{f}.save_everything_to_repo_postsim = true; s{f}.do_commit = 0;
        s{f}.repo_studyname = ['tune1Fig1b2_21Hz' num2str(f) '' namesuffix];
        s{f}.pulse_mode = 1;
        s{f}.pulse_train_preset = 1;
        s{f}.PPfreq = 21.8; % in Hz
        s{f}.ap_pulse_delay = 23.0;                        % ms, the amount the spike should be delayed. 0 for no aperiodicity.
        s{f}.tspan=[0 2500];
        s{f}.PPonset=400;
        s{f}.PPoffset = 2000;
        s{f}.maxNcores = maxNcores; s{f}.parallel_flag = 1;     % Parallel flag and Ncores should always be active
        
        a = clock; s{f}.random_seed = floor(a(end-1)*60+a(end));    % Random seed locked to current clock
        
        % % Only superficial oscillator
        s{f}.include_IB =   0;
        s{f}.include_RS =   1;
        s{f}.include_FS =   1;
        s{f}.include_LTS =  1;
        s{f}.include_NG =   0;
        s{f}.include_dFS5 = 0;
        s{f}.include_tFS5 = 0;
        s{f}.include_deepRS = 0;
        s{f}.include_deepFS = 0;
        
        datapf1b = kramer_IB_function_mode(s{f},f);
        
        
    case '1b1_17Hz'
        %% Paper Figs 1b - Pulse train AP
        
        clear s
        f = 1;
        s{f} = struct;
        s{f}.save_figures = 1; s{f}.save_combined_figures = 1; s{f}.plot_on = 0; s{f}.plot_on2 = 0; s{f}.do_visible = 'off'; s{f}.save_simfiles_to_repo_presim = true; s{f}.save_everything_to_repo_postsim = true; s{f}.do_commit = 0;
        s{f}.repo_studyname = ['tune1Fig1b1_17Hz' num2str(f) '' namesuffix];
        s{f}.pulse_mode = 1;
        s{f}.pulse_train_preset = 1;
        s{f}.PPfreq = 17.8; % in Hz
        s{f}.ap_pulse_delay = 28.1;                        % ms, the amount the spike should be delayed. 0 for no aperiodicity.
        s{f}.tspan=[0 2500];
        s{f}.PPonset=400;
        s{f}.PPoffset = 2000;
        s{f}.maxNcores = maxNcores; s{f}.parallel_flag = 1;     % Parallel flag and Ncores should always be active
        
        a = clock; s{f}.random_seed = floor(a(end-1)*60+a(end));    % Random seed locked to current clock
        
        datapf1b = kramer_IB_function_mode(s{f},f);
        
    case '1b2_17Hz'
        %% Paper Figs 1b - Pulse train AP
        
        clear s
        f = 1;
        s{f} = struct;
        s{f}.save_figures = 1; s{f}.save_combined_figures = 1; s{f}.plot_on = 0; s{f}.plot_on2 = 0; s{f}.do_visible = 'off'; s{f}.save_simfiles_to_repo_presim = true; s{f}.save_everything_to_repo_postsim = true; s{f}.do_commit = 0;
        s{f}.repo_studyname = ['tune1Fig1b2_17Hz' num2str(f) '' namesuffix];
        s{f}.pulse_mode = 1;
        s{f}.pulse_train_preset = 1;
        s{f}.PPfreq = 17.8; % in Hz
        s{f}.ap_pulse_delay = 28.1;                        % ms, the amount the spike should be delayed. 0 for no aperiodicity.
        s{f}.tspan=[0 2500];
        s{f}.PPonset=400;
        s{f}.PPoffset = 2000;
        s{f}.maxNcores = maxNcores; s{f}.parallel_flag = 1;     % Parallel flag and Ncores should always be active
        
        a = clock; s{f}.random_seed = floor(a(end-1)*60+a(end));    % Random seed locked to current clock
        
        % % Only superficial oscillator
        s{f}.include_IB =   0;
        s{f}.include_RS =   1;
        s{f}.include_FS =   1;
        s{f}.include_LTS =  1;
        s{f}.include_NG =   0;
        s{f}.include_dFS5 = 0;
        s{f}.include_tFS5 = 0;
        s{f}.include_deepRS = 0;
        s{f}.include_deepFS = 0;
        
        datapf1b = kramer_IB_function_mode(s{f},f);
        
    case '1b1_14Hz'
        %% Paper Figs 1b - Pulse train AP
        
        clear s
        f = 1;
        s{f} = struct;
        s{f}.save_figures = 1; s{f}.save_combined_figures = 1; s{f}.plot_on = 0; s{f}.plot_on2 = 0; s{f}.do_visible = 'off'; s{f}.save_simfiles_to_repo_presim = true; s{f}.save_everything_to_repo_postsim = true; s{f}.do_commit = 0;
        s{f}.repo_studyname = ['tune1Fig1b1_14Hz' num2str(f) '' namesuffix];
        s{f}.pulse_mode = 1;
        s{f}.pulse_train_preset = 1;
        s{f}.PPfreq = 14.5; % in Hz
        s{f}.ap_pulse_delay = 34.4;                        % ms, the amount the spike should be delayed. 0 for no aperiodicity.
        s{f}.tspan=[0 2500];
        s{f}.PPonset=400;
        s{f}.PPoffset = 2000;
        s{f}.maxNcores = maxNcores; s{f}.parallel_flag = 1;     % Parallel flag and Ncores should always be active
        
        a = clock; s{f}.random_seed = floor(a(end-1)*60+a(end));    % Random seed locked to current clock
        
        datapf1b = kramer_IB_function_mode(s{f},f);
        
    case '1b2_14Hz'
        %% Paper Figs 1b - Pulse train AP
        
        clear s
        f = 1;
        s{f} = struct;
        s{f}.save_figures = 1; s{f}.save_combined_figures = 1; s{f}.plot_on = 0; s{f}.plot_on2 = 0; s{f}.do_visible = 'off'; s{f}.save_simfiles_to_repo_presim = true; s{f}.save_everything_to_repo_postsim = true; s{f}.do_commit = 0;
        s{f}.repo_studyname = ['tune1Fig1b2_14Hz' num2str(f) '' namesuffix];
        s{f}.pulse_mode = 1;
        s{f}.pulse_train_preset = 1;
        s{f}.PPfreq = 14.5; % in Hz
        s{f}.ap_pulse_delay = 34.4;                        % ms, the amount the spike should be delayed. 0 for no aperiodicity.
        s{f}.tspan=[0 2500];
        s{f}.PPonset=400;
        s{f}.PPoffset = 2000;
        s{f}.maxNcores = maxNcores; s{f}.parallel_flag = 1;     % Parallel flag and Ncores should always be active
        
        a = clock; s{f}.random_seed = floor(a(end-1)*60+a(end));    % Random seed locked to current clock
        
        % % Only superficial oscillator
        s{f}.include_IB =   0;
        s{f}.include_RS =   1;
        s{f}.include_FS =   1;
        s{f}.include_LTS =  1;
        s{f}.include_NG =   0;
        s{f}.include_dFS5 = 0;
        s{f}.include_tFS5 = 0;
        s{f}.include_deepRS = 0;
        s{f}.include_deepFS = 0;
        
        datapf1b = kramer_IB_function_mode(s{f},f);
        
    case '1b1_11Hz'
        %% Paper Figs 1b - Pulse train AP
        
        clear s
        f = 1;
        s{f} = struct;
        s{f}.save_figures = 1; s{f}.save_combined_figures = 1; s{f}.plot_on = 0; s{f}.plot_on2 = 0; s{f}.do_visible = 'off'; s{f}.save_simfiles_to_repo_presim = true; s{f}.save_everything_to_repo_postsim = true; s{f}.do_commit = 0;
        s{f}.repo_studyname = ['tune1Fig1b1_11Hz' num2str(f) '' namesuffix];
        s{f}.pulse_mode = 1;
        s{f}.pulse_train_preset = 1;
        s{f}.PPfreq = 11.9; % in Hz
        s{f}.ap_pulse_delay = 42.2;                        % ms, the amount the spike should be delayed. 0 for no aperiodicity.
        s{f}.tspan=[0 2500];
        s{f}.PPonset=400;
        s{f}.PPoffset = 2000;
        s{f}.maxNcores = maxNcores; s{f}.parallel_flag = 1;     % Parallel flag and Ncores should always be active
        
        a = clock; s{f}.random_seed = floor(a(end-1)*60+a(end));    % Random seed locked to current clock
        
        datapf1b = kramer_IB_function_mode(s{f},f);
        
    case '1b2_11Hz'
        %% Paper Figs 1b - Pulse train AP
        
        clear s
        f = 1;
        s{f} = struct;
        s{f}.save_figures = 1; s{f}.save_combined_figures = 1; s{f}.plot_on = 0; s{f}.plot_on2 = 0; s{f}.do_visible = 'off'; s{f}.save_simfiles_to_repo_presim = true; s{f}.save_everything_to_repo_postsim = true; s{f}.do_commit = 0;
        s{f}.repo_studyname = ['tune1Fig1b2_11Hz' num2str(f) '' namesuffix];
        s{f}.pulse_mode = 1;
        s{f}.pulse_train_preset = 1;
        s{f}.PPfreq = 11.9; % in Hz
        s{f}.ap_pulse_delay = 42.2;                        % ms, the amount the spike should be delayed. 0 for no aperiodicity.
        s{f}.tspan=[0 2500];
        s{f}.PPonset=400;
        s{f}.PPoffset = 2000;
        s{f}.maxNcores = maxNcores; s{f}.parallel_flag = 1;     % Parallel flag and Ncores should always be active
        
        a = clock; s{f}.random_seed = floor(a(end-1)*60+a(end));    % Random seed locked to current clock
        
        % % Only superficial oscillator
        s{f}.include_IB =   0;
        s{f}.include_RS =   1;
        s{f}.include_FS =   1;
        s{f}.include_LTS =  1;
        s{f}.include_NG =   0;
        s{f}.include_dFS5 = 0;
        s{f}.include_tFS5 = 0;
        s{f}.include_deepRS = 0;
        s{f}.include_deepFS = 0;
        
        datapf1b = kramer_IB_function_mode(s{f},f);


end

end