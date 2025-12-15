%% Initialize
format longG
clear variables; close all; clc; format short
freq(1:201) = linspace(5000,1000000,201); freq = freq./1000; sample_num = 15; row_num = 5; column_num = 3;
%age = ['~2 Dys';'~2 Dys';'~4 Dys';'~4 Dys';'~2 Dys';'~2 Dys';'~2 Dys';'~3 Hrs';'~4 Hrs';'~1 Dys';'~2 Dys';'~3 Hrs']; poll = [50,100,500,900];
age = ['~2 Dys';'~2 Dys';'~4 Dys';'~4 Dys';'~1 Dys';'~1 Dys';'~1 Dys';'~5 Hrs';'~7 Hrs';'~1 Dys';'~2 Dys';'~2 Dys';'~5 Hrs';'~7 Hrs';'~9 Hrs']; poll = [50,100,500,900];
%age_num = [48,48,96,96,48,48,48,3,4,24,48,3]; 
lgd_size1 = 4; lgd_size2 = 11;
age_num = [2,3,4,4,1,1,1,0,0,1,2,2,0,0,0];

%% Load in Data
File_name = "Total Eyes";

%Conjunctive Tissue
[Conj,Conj_sampleavgs,Conj_sampleavgs_avg,Conj_excluded,Conj_excluded_count,Conj_included,Conj_included_count,Conj_sampleavgs_included,Conj_sampleavgs_avg_included,Conj_mean,Conj_std,Conj_age,Conj_age_num] = ExVivoData_opt_filter("Conj",File_name,sample_num-1,age,age_num);

%Epithelial Cornea
[EpCorn,EpCorn_sampleavgs,EpCorn_sampleavgs_avg,EpCorn_excluded,EpCorn_excluded_count,EpCorn_included,EpCorn_included_count,EpCorn_sampleavgs_included,EpCorn_sampleavgs_avg_included,EpCorn_mean,EpCorn_std,EpCorn_age,EpCorn_age_num] = ExVivoData_opt_filter("EpCorn",File_name,sample_num-1,age,age_num);

%Epithelial Cornea
[EndCorn,EndCorn_sampleavgs,EndCorn_sampleavgs_avg] = ExVivoData_opt("EndCorn",File_name,1);
%EndCorn = EndCorn'; EndCorn_sampleavgs = EndCorn_sampleavgs'; EndCorn_sampleavgs_avg = EndCorn_sampleavgs_avg';

%Iris
[Iris,Iris_sampleavgs,Iris_sampleavgs_avg,Iris_excluded,Iris_excluded_count,Iris_included,Iris_included_count,Iris_sampleavgs_included,Iris_sampleavgs_avg_included,Iris_mean,Iris_std,Iris_age,Iris_age_num] = ExVivoData_opt_filter("Iris",File_name,sample_num-2,age,age_num);

%Lens
[Lens,Lens_sampleavgs,Lens_sampleavgs_avg,Lens_excluded,Lens_excluded_count,Lens_included,Lens_included_count,Lens_sampleavgs_included,Lens_sampleavgs_avg_included,Lens_mean,Lens_std,Lens_age,Lens_age_num] = ExVivoData_opt_filter("Lens",File_name,sample_num,age,age_num);

%Vitreous
[Vit,Vit_sampleavgs,Vit_sampleavgs_avg,Vit_excluded,Vit_excluded_count,Vit_included,Vit_included_count,Vit_sampleavgs_included,Vit_sampleavgs_avg_included,Vit_mean,Vit_std,Vit_age,Vit_age_num] = ExVivoData_opt_filter("Vit",File_name,sample_num-1,age,age_num);

%Retina
[Ret,Ret_sampleavgs,Ret_sampleavgs_avg,Ret_excluded,Ret_excluded_count,Ret_included,Ret_included_count,Ret_sampleavgs_included,Ret_sampleavgs_avg_included,Ret_mean,Ret_std,Ret_age,Ret_age_num] = ExVivoData_opt_filter("Ret",File_name,sample_num-1,age,age_num);

%% Data Stats
%Conjunctive Tissue
[Conj_min,Conj_max] = ExVivoDataStats_opt(Conj);

%Epithelial Cornea
[EpCorn_min,EpCorn_max] = ExVivoDataStats_opt(EpCorn);

%Epithelial Cornea
[EndCorn_min,EndCorn_max] = ExVivoDataStats_opt(EndCorn);

%Iris
[Iris_min,Iris_max] = ExVivoDataStats_opt(Iris);

%Lens
[Lens_min,Lens_max] = ExVivoDataStats_opt(Lens);

%Vitreous
[Vit_min,Vit_max] = ExVivoDataStats_opt(Vit);

%Retina
[Ret_min,Ret_max] = ExVivoDataStats_opt(Ret);

%% Poll
%Conjunctive Tissue
[Conj_PollValues,Conj_PollValueAvgs,Conj_PollValueAvgs_avg,Conj_PollValueSTDs,Conj_PollValueSTDs_avg,Conj_Poll_Max,Conj_Poll_Min,Conj_Poll_75,Conj_Poll_25,Conj_H_Values,Conj_P_Values] = ExVivo_Poll(Conj_included,freq,poll);

%Epithelial Cornea
[EpCorn_PollValues,EpCorn_PollValueAvgs,EpCorn_PollValueAvgs_avg,EpCorn_PollValueSTDs,EpCorn_PollValueSTDs_avg,EpCorn_Poll_Max,EpCorn_Poll_Min,EpCorn_Poll_75,EpCorn_Poll_25,EpCorn_H_Values,EpCorn_P_Values] = ExVivo_Poll(EpCorn_included,freq,poll);

%Endothelial Cornea
%[EndCorn_PollValues,EndCorn_PollValueAvgs,EndCorn_PollValueAvgs_avg,EndCorn_PollValueSTDs,EndCorn_PollValueSTDs_avg,EndCorn_Poll_Max,EndCorn_Poll_Min,EndCorn_Poll_75,EndCorn_Poll_25,EndCorn_H_Values,EndCorn_P_Values] = ExVivo_Poll(EndCorn,freq,poll);

%Iris
[Iris_PollValues,Iris_PollValueAvgs,Iris_PollValueAvgs_avg,Iris_PollValueSTDs,Iris_PollValueSTDs_avg,Iris_Poll_Max,Iris_Poll_Min,Iris_Poll_75,Iris_Poll_25,Iris_H_Values,Iris_P_Values] = ExVivo_Poll(Iris_included,freq,poll);

%Lens
[Lens_PollValues,Lens_PollValueAvgs,Lens_PollValueAvgs_avg,Lens_PollValueSTDs,Lens_PollValueSTDs_avg,Lens_Poll_Max,Lens_Poll_Min,Lens_Poll_75,Lens_Poll_25,Lens_H_Values,Lens_P_Values] = ExVivo_Poll(Lens_included,freq,poll);

%Vitreous
[Vit_PollValues,Vit_PollValueAvgs,Vit_PollValueAvgs_avg,Vit_PollValueSTDs,Vit_PollValueSTDs_avg,Vit_Poll_Max,Vit_Poll_Min,Vit_Poll_75,Vit_Poll_25,Vit_H_Values,Vit_P_Values] = ExVivo_Poll(Vit_included,freq,poll);

%Retina
[Ret_PollValues,Ret_PollValueAvgs,Ret_PollValueAvgs_avg,Ret_PollValueSTDs,Ret_PollValueSTDs_avg,Ret_Poll_Max,Ret_Poll_Min,Ret_Poll_75,Ret_Poll_25,Ret_H_Values,Ret_P_Values] = ExVivo_Poll(Ret_included,freq,poll);

%% Plot Data
%Conj
    [Conj_plot, Conj_plot2] = ExVivoDataPlot_opt_age('Sclera',Conj_included,Conj_sampleavgs_included,Conj_sampleavgs_avg_included,freq,poll,Conj_included_count,Conj_age,row_num,column_num,lgd_size1,lgd_size2);
  
%Epithelial Cornea
    EpCorn_plot = ExVivoDataPlot_opt_age('Epithelial Cornea',EpCorn_included,EpCorn_sampleavgs_included,EpCorn_sampleavgs_avg_included,freq,poll,EpCorn_included_count,EpCorn_age,row_num,column_num,lgd_size1,lgd_size2);
 
%Endothelial Cornea
    EndCorn_sampleavgs = mean(EndCorn');
    EndCorn_plot = ExVivoDataPlot_opt('Endothelial Cornea',EndCorn,EndCorn_sampleavgs,EndCorn_sampleavgs_avg,freq,1,1,1);

%Iris
    Iris_plot = ExVivoDataPlot_opt_age('Iris',Iris_included,Iris_sampleavgs_included,Iris_sampleavgs_avg_included,freq,poll,Iris_included_count,Iris_age,row_num,column_num,lgd_size1,lgd_size2);
 
%Lens
    Lens_plot = ExVivoDataPlot_opt_age('Lens',Lens_included,Lens_sampleavgs_included,Lens_sampleavgs_avg_included,freq,poll,Lens_included_count,Lens_age,row_num,column_num,lgd_size1,lgd_size2);

%Vitreous
    Vit_plot = ExVivoDataPlot_opt_age('Vitreous',Vit_included,Vit_sampleavgs_included,Vit_sampleavgs_avg_included,freq,poll,Vit_included_count,Vit_age,row_num,column_num,lgd_size1,lgd_size2);

%Retina
    Ret_plot = ExVivoDataPlot_opt_age('Retina',Ret_included,Ret_sampleavgs_included,Ret_sampleavgs_avg_included,freq,poll,Ret_included_count,Ret_age,row_num,column_num,lgd_size1,lgd_size2);
 
%Comparison of Averages
    Averages_fig = figure('Name','Comparison Sample of Averages');
    plot(freq,Conj_sampleavgs_avg_included);
    hold on
    plot(freq,EpCorn_sampleavgs_avg_included);
    plot(freq,Iris_sampleavgs_avg_included);
    plot(freq,Lens_sampleavgs_avg_included);
    plot(freq,Vit_sampleavgs_avg_included);
    plot(freq,Ret_sampleavgs_avg_included);
    for i = 1:length(poll)
            xline(poll(i))
    end
    hold off
    xlabel('Frequency (kHz)', 'FontSize', 18)
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)', 'FontSize', 18)
    title('Comparison of Tissue Averages', 'FontSize', 16)
    lgd = legend('Sclera','Epithelial Cornea','Iris','Lens','Vitreous','Retina');
    lgd.FontSize = lgd_size2;
    x0 = 150; y0 = 35; width = 1000; height = 600;
    set(gcf,'position',[x0,y0,width,height]) 
    f.Units = 'normalized';
    lineWidth = 5; % Whatever you want.
    annotation('line', [0, 0], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [1, 1], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [0, 1], [0, 0], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [1, 0], [1, 1], 'LineWidth', lineWidth, 'Color', 'k');
    ax = gca;
    ax.FontSize = 14;

%% Range of Expected Values Plot
    PollStats_fig = figure('Name','Polled Value Stats');
    plot(freq,Conj_sampleavgs_avg_included);
    hold on
    plot(freq,EpCorn_sampleavgs_avg_included);
    plot(freq,Iris_sampleavgs_avg_included);
    plot(freq,Lens_sampleavgs_avg_included);
    plot(freq,Vit_sampleavgs_avg_included);
    plot(freq,Ret_sampleavgs_avg_included);
    for i = 1:length(poll)
            xline(poll(i))
    end
    hold off
    xlabel('Frequency (kHz)', 'FontSize', 18)
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)', 'FontSize', 18)
    title('Comparison of Tissue Averages', 'FontSize', 16)
    lgd = legend('Sclera','Epithelial Cornea','Iris','Lens','Vitreous','Retina');
    lgd.FontSize = lgd_size2;
    x0 = 150; y0 = 35; width = 1000; height = 600;
    set(gcf,'position',[x0,y0,width,height])
    f.Units = 'normalized';
    lineWidth = 5; % Whatever you want.
    annotation('line', [0, 0], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [1, 1], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [0, 1], [0, 0], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [1, 0], [1, 1], 'LineWidth', lineWidth, 'Color', 'k');
    ax = gca;
    ax.FontSize = 14;


%% Save Figures
 FolderName = ('C:\Users\nnmne\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Figures\Ex Vivo Tissues\Total Eyes (Filtered)');   % using my directory
 FigList = findobj(allchild(0), 'flat', 'Type', 'figure');
 for iFig = 1:length(FigList)
   FigHandle = FigList(iFig);
   FigName   = num2str(get(FigHandle, 'Name'));
   set(0, 'CurrentFigure', FigHandle);
   saveas(FigHandle, fullfile(FolderName,strcat(FigName, '.png'))); % specify the full path
 end