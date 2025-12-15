%% Initialize
format longG
clear variables; close all; clc; format short
freq(1:201) = linspace(5000,1000000,201); freq = freq./1000; sample_num = 3; row_num = 3; column_num = 1;
age = ['~3 Hrs';'~4 Hrs';'~3 Hrs']; poll = [50,100,500,900];
age_num = [3,4,3]; lgd_size = 6;

%% Load in Data
File_name = "Fresh Eyes";

%Conjunctive Tissue
[Conj,Conj_sampleavgs,Conj_sampleavgs_avg,Conj_excluded,Conj_excluded_count,Conj_included,Conj_included_count,Conj_mean,Conj_std,Conj_age,Conj_age_num] = ExVivoData_opt_filter("Conj",File_name,sample_num,age,age_num);

%Epithelial Cornea
[EpCorn,EpCorn_sampleavgs,EpCorn_sampleavgs_avg,EpCorn_excluded,EpCorn_excluded_count,EpCorn_included,EpCorn_included_count,EpCorn_mean,EpCorn_std,EpCorn_age,EpCorn_age_num] = ExVivoData_opt_filter("EpCorn",File_name,sample_num,age,age_num);

%Iris
[Iris,Iris_sampleavgs,Iris_sampleavgs_avg,Iris_excluded,Iris_excluded_count,Iris_included,Iris_included_count,Iris_mean,Iris_std,Iris_age,Iris_age_num] = ExVivoData_opt_filter("Iris",File_name,sample_num,age,age_num);

%Lens
[Lens,Lens_sampleavgs,Lens_sampleavgs_avg,Lens_excluded,Lens_excluded_count,Lens_included,Lens_included_count,Lens_mean,Lens_std,Lens_age,Lens_age_num] = ExVivoData_opt_filter("Lens",File_name,sample_num,age,age_num);

%Vitreous
[Vit,Vit_sampleavgs,Vit_sampleavgs_avg,Vit_excluded,Vit_excluded_count,Vit_included,Vit_included_count,Vit_mean,Vit_std,Vit_age,Vit_age_num] = ExVivoData_opt_filter("Vit",File_name,sample_num,age,age_num);

%Retina
[Ret,Ret_sampleavgs,Ret_sampleavgs_avg,Ret_excluded,Ret_excluded_count,Ret_included,Ret_included_count,Ret_mean,Ret_std,Ret_age,Ret_age_num] = ExVivoData_opt_filter("Ret",File_name,sample_num,age,age_num);

%% Data Stats
%Conjunctive Tissue
[Conj_min,Conj_max] = ExVivoDataStats_opt(Conj);

%Epithelial Cornea
[EpCorn_min,EpCorn_max] = ExVivoDataStats_opt(EpCorn);

%Iris
[Iris_min,Iris_max] = ExVivoDataStats_opt(Iris);

%Lens
[Lens_min,Lens_max] = ExVivoDataStats_opt(Lens);

%Vitreous
[Vit_min,Vit_max] = ExVivoDataStats_opt(Vit);

%Retina
[Ret_min,Ret_max] = ExVivoDataStats_opt(Ret);

%% Plot Data
%Conj
    Conj_plot = ExVivoDataPlot_opt_age('Conjunctive Tissue',Conj_included,Conj_sampleavgs,Conj_sampleavgs_avg,freq,poll,Conj_included_count,Conj_age,row_num,column_num,lgd_size);
  
%Epithelial Cornea
    EpCorn_plot = ExVivoDataPlot_opt_age('Epithelial Cornea',EpCorn_included,EpCorn_sampleavgs,EpCorn_sampleavgs_avg,freq,poll,EpCorn_included_count,EpCorn_age,row_num,column_num,lgd_size);
 
%Iris
    Iris_plot = ExVivoDataPlot_opt_age('Iris',Iris_included,Iris_sampleavgs,Iris_sampleavgs_avg,freq,poll,Iris_included_count,Iris_age,row_num,column_num,lgd_size);
 
%Lens
    Lens_plot = ExVivoDataPlot_opt_age('Lens',Lens_included,Lens_sampleavgs,Lens_sampleavgs_avg,freq,poll,Lens_included_count,Lens_age,row_num,column_num,lgd_size);

%Vitreous
    Vit_plot = ExVivoDataPlot_opt_age('Vitreous',Vit_included,Vit_sampleavgs,Vit_sampleavgs_avg,freq,poll,Vit_included_count,Vit_age,row_num,column_num,lgd_size);

%Retina
    Ret_plot = ExVivoDataPlot_opt_age('Retina',Ret_included,Ret_sampleavgs,Ret_sampleavgs_avg,freq,poll,Ret_included_count,Ret_age,row_num,column_num,lgd_size);
 
%Comparison of Averages
    Averages_fig = figure('Name','Comparison Sample of Averages (Fresh Eyes)');
    plot(freq,Conj_sampleavgs_avg);
    hold on
    plot(freq,EpCorn_sampleavgs_avg);
    plot(freq,Iris_sampleavgs_avg);
    plot(freq,Lens_sampleavgs_avg);
    plot(freq,Vit_sampleavgs_avg);
    plot(freq,Ret_sampleavgs_avg);
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    title('Comparison of Tissue Averages (Fresh Eyes)')
    lgd = legend('Conjunctive Tissue','Epithelial Cornea','Iris','Lens','Vitreous','Retina');
    lgd.FontSize = 9;
    x0 = 150; y0 = 35; width = 1000; height = 600;
    set(gcf,'position',[x0,y0,width,height])
    f.Units = 'normalized';
    lineWidth = 5; % Whatever you want.
    annotation('line', [0, 0], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [1, 1], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [0, 1], [0, 0], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [1, 0], [1, 1], 'LineWidth', lineWidth, 'Color', 'k');

%% Save Figures
FolderName = ('C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Figures\Ex Vivo Tissues\Fresh Eyes');   % using my directory
FigList = findobj(allchild(0), 'flat', 'Type', 'figure');
for iFig = 1:length(FigList)
  FigHandle = FigList(iFig);
  FigName   = num2str(get(FigHandle, 'Name'));
  set(0, 'CurrentFigure', FigHandle);
  saveas(FigHandle, fullfile(FolderName,strcat(FigName, '.png'))); % specify the full path
end