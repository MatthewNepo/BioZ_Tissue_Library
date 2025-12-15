%% Initialize
format longG
clear variables; close all; clc; format short
freq(1:201) = linspace(5000,1000000,201); freq = freq./1000; sample_num = 15; row_num = 4; column_num = 3; poll = [50, 100, 500, 900];
age = ['~2 Dys';'~2 Dys';'~4 Dys';'~4 Dys';'~1 Dys';'~1 Dys';'~1 Dys';'~5 Hrs';'~7 Hrs';'~1 Dys';'~2 Dys';'~2 Dys';'~5 Hrs';'~7 Hrs';'~9 Hrs'];
%age_num = [45,49,96,98,45,47,52,5,7,24,40,47,5,7,9];
age_num = [2,3,4,4,1,1,1,0,0,1,2,2,0,0,0];

%% Load in Data
File_name = "Total Eyes";

%Conjunctive Tissue
[Conj,Conj_sampleavgs,Conj_sampleavgs_avg,Conj_excluded,Conj_excluded_count,Conj_included,Conj_included_count,Conj_sampleavgs_included,Conj_sampleavgs_avg_included,Conj_mean,Conj_std,Conj_age,Conj_age_num] = ExVivoData_opt_filter("Conj",File_name,sample_num-1,age,age_num);

%Epithelial Cornea
[EpCorn,EpCorn_sampleavgs,EpCorn_sampleavgs_avg,EpCorn_excluded,EpCorn_excluded_count,EpCorn_included,EpCorn_included_count,EpCorn_sampleavgs_included,EpCorn_sampleavgs_avg_included,EpCorn_mean,EpCorn_std,EpCorn_age,EpCorn_age_num] = ExVivoData_opt_filter("EpCorn",File_name,sample_num-1,age,age_num);

%Iris
[Iris,Iris_sampleavgs,Iris_sampleavgs_avg,Iris_excluded,Iris_excluded_count,Iris_included,Iris_included_count,Iris_sampleavgs_included,Iris_sampleavgs_avg_included,Iris_mean,Iris_std,Iris_age,Iris_age_num] = ExVivoData_opt_filter("Iris",File_name,sample_num-2,age,age_num);

%Lens
[Lens,Lens_sampleavgs,Lens_sampleavgs_avg,Lens_excluded,Lens_excluded_count,Lens_included,Lens_included_count,Lens_sampleavgs_included,Lens_sampleavgs_avg_included,Lens_mean,Lens_std,Lens_age,Lens_age_num] = ExVivoData_opt_filter("Lens",File_name,sample_num,age,age_num);

%Vitreous
[Vit,Vit_sampleavgs,Vit_sampleavgs_avg,Vit_excluded,Vit_excluded_count,Vit_included,Vit_included_count,Vit_sampleavgs_included,Vit_sampleavgs_avg_included,Vit_mean,Vit_std,Vit_age,Vit_age_num] = ExVivoData_opt_filter("Vit",File_name,sample_num-1,age,age_num);

%Retina
[Ret,Ret_sampleavgs,Ret_sampleavgs_avg,Ret_excluded,Ret_excluded_count,Ret_included,Ret_included_count,Ret_sampleavgs_included,Ret_sampleavgs_avg_included,Ret_mean,Ret_std,Ret_age,Ret_age_num] = ExVivoData_opt_filter("Ret",File_name,sample_num-1,age,age_num);

%% Data Stats
poll = [50, 100, 500, 900];
%Conjunctive Tissue
[Conj_PollValues,Conj_PollValueAvgs,Conj_PollValueAvgs_avg,Conj_PollValueSTDs,Conj_PollValueSTDs_avg,Conj_Poll_max,Conj_Poll_min,Conj_Poll_75,Conj_Poll_25,Conj_H_values,Conj_P_values] = ExVivo_Poll(Conj,freq,poll);

%Epithelial Cornea
[EpCorn_PollValues,EpCorn_PollValueAvgs,EpCorn_PollValueAvgs_avg,EpCorn_PollValueSTDs,EpCorn_PollValueSTDs_avg,EpCorn_Poll_max,EpCorn_Poll_min,EpCorn_Poll_75,EpCorn_Poll_25,EpCorn_H_values,EpCorn_P_values] = ExVivo_Poll(EpCorn,freq,poll);

%Iris
[Iris_PollValues,Iris_PollValueAvgs,Iris_PollValueAvgs_avg,Iris_PollValueSTDs,Iris_PollValueSTDs_avg,Iris_Poll_max,Iris_Poll_min,Iris_Poll_75,Iris_Poll_25,Iris_H_values,Iris_P_values] = ExVivo_Poll(Iris,freq,poll);

%Lens
[Lens_PollValues,Lens_PollValueAvgs,Lens_PollValueAvgs_avg,Lens_PollValueSTDs,Lens_PollValueSTDs_avg,Lens_Poll_max,Lens_Poll_min,Lens_Poll_75,Lens_Poll_25,Lens_H_values,Lens_P_values] = ExVivo_Poll(Lens,freq,poll);

%Vitreous
[Vit_PollValues,Vit_PollValueAvgs,Vit_PollValueAvgs_avg,Vit_PollValueSTDs,Vit_PollValueSTDs_avg,Vit_Poll_max,Vit_Poll_min,Vit_Poll_75,Vit_Poll_25,Vit_H_values,Vit_P_values] = ExVivo_Poll(Vit,freq,poll);

%Retina
[Ret_PollValues,Ret_PollValueAvgs,Ret_PollValueAvgs_avg,Ret_PollValueSTDs,Ret_PollValueSTDs_avg,Ret_Poll_max,Ret_Poll_min,Ret_Poll_75,Ret_Poll_25,Ret_H_values,Ret_P_values] = ExVivo_Poll(Ret,freq,poll);

%% Scatter Plots
%Conj
    [Conj_p, Conj_h] = ExVivoPlot_TimeStrat_Days_Stats('Conjunctive Tissue by Time',Conj_PollValues(4,:),Conj_PollValueAvgs,Conj_age_num,Conj_included_count);
    % [Conj_scatter, Conj_scatter2, Conj_p, Conj_h] = ExVivoPlot_TimeStrat_Days('Conjunctive Tissue by Time',Conj_included,Conj_sampleavgs_included,Conj_age_num,Conj_included_count);

%Epithelial Cornea
    [EpCorn_p, EpCorn_h] = ExVivoPlot_TimeStrat_Days_Stats('EpCornunctive Tissue by Time',EpCorn_PollValues(4,:),EpCorn_PollValueAvgs,EpCorn_age_num,EpCorn_included_count);
    % [EpCorn_scatter, EpCorn_scatter2, EpCorn_p, EpCorn_h] = ExVivoPlot_TimeStrat_Days('Epithelial Cornea by Time',EpCorn_included,EpCorn_sampleavgs_included,EpCorn_age_num,EpCorn_included_count);
 
%Iris
    [Iris_p, Iris_h] = ExVivoPlot_TimeStrat_Days_Stats('Irisunctive Tissue by Time',Iris_PollValues(4,:),Iris_PollValueAvgs,Iris_age_num,Iris_included_count);
    % [Iris_scatter, Iris_scatter2, Iris_p, Iris_h] = ExVivoPlot_TimeStrat_Days('Iris by Time',Iris_included,Iris_sampleavgs_included,Iris_age_num,Iris_included_count);
 
%Lens
    [Lens_p, Lens_h] = ExVivoPlot_TimeStrat_Days_Stats('Lensunctive Tissue by Time',Lens_PollValues(4,:),Lens_PollValueAvgs,Lens_age_num,Lens_included_count);
    % [Lens_scatter, Lens_scatter2, Lens_p, Lens_h] = ExVivoPlot_TimeStrat_Days('Lens by Time',Lens_included,Lens_sampleavgs_included,Lens_age_num,Lens_included_count);

%Vitreous
    [Vit_p, Vit_h] = ExVivoPlot_TimeStrat_Days_Stats('Vitunctive Tissue by Time',Vit_PollValues(4,:),Vit_PollValueAvgs,Vit_age_num,Vit_included_count);
    % [Vit_scatter, Vit_scatter2, Vit_p, Vit_h] = ExVivoPlot_TimeStrat_Days('Vitreous by Time',Vit_included,Vit_sampleavgs_included,Vit_age_num,Vit_included_count);

%Retina
    [Ret_p, Ret_h] = ExVivoPlot_TimeStrat_Days_Stats('Retunctive Tissue by Time',Ret_PollValues(4,:),Ret_PollValueAvgs,Ret_age_num,Ret_included_count);
    % [Ret_scatter, Ret_scatter2, Ret_p, Ret_h] = ExVivoPlot_TimeStrat_Days('Retina by Time',Ret_included,Ret_sampleavgs_included,Ret_age_num,Ret_included_count);

    p_check = [Conj_p; EpCorn_p; Iris_p; Lens_p; Vit_p; Ret_p]
    h_check = [Conj_h; EpCorn_h; Iris_h; Lens_h; Vit_h; Ret_h]

    writematrix(p_check,'Age Stratification P Values.csv')
    writematrix(h_check,'Age Stratification H Values.csv')
%% Save Figures
% FolderName = ('C:\Users\nnmne\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Figures\Ex Vivo Tissues\Time Stratified (Manual Included)');   % using my directory
% FigList = findobj(allchild(0), 'flat', 'Type', 'figure');
% % for iFig = 1:length(FigList)
% %  FigHandle = FigList(iFig);
% %  FigName   = num2str(get(FigHandle, 'Name'));
% %  set(0, 'CurrentFigure', FigHandle);
% %  saveas(FigHandle, fullfile(FolderName,strcat(FigName, '.png'))); % specify the full path
% % end
% for iFig = 1:length(FigList)
%  FigHandle = FigList(iFig);
%  FigName   = num2str(get(FigHandle, 'Name'));
%  set(0, 'CurrentFigure', FigHandle);
%  saveas(FigHandle, fullfile(FolderName,strcat(FigName, '.png'))); % specify the full path
% end