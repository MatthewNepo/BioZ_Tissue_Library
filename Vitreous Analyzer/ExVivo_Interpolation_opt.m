%% Initialize
format longG
clear variables; close all; clc; format short
freq(1:201) = linspace(5000,1000000,201); freq = freq./1000; sample_num = 11; row_num = 4; column_num = 3;

%% Load in Data
File_name = "Total Eyes";

%Conjunctive Tissue
[Conj,Conj_comp,Conj_sampleavgs,Conj_comp_sampleavgs,Conj_sampleavgs_avg,Conj_comp_sampleavgs_avg] = ExVivoData_opt("Conj",File_name,sample_num);

%Epithelial Cornea
[EpCorn,EpCorn_comp,EpCorn_sampleavgs,EpCorn_comp_sampleavgs,EpCorn_sampleavgs_avg,EpCorn_comp_sampleavgs_avg] = ExVivoData_opt("EpCorn",File_name,sample_num);

%Iris
[Iris,Iris_comp,Iris_sampleavgs,Iris_comp_sampleavgs,Iris_sampleavgs_avg,Iris_comp_sampleavgs_avg] = ExVivoData_opt("Iris",File_name,sample_num);

%Lens
[Lens,Lens_comp,Lens_sampleavgs,Lens_comp_sampleavgs,Lens_sampleavgs_avg,Lens_comp_sampleavgs_avg] = ExVivoData_opt("Lens",File_name,sample_num);

%Vitreous
[Vit,Vit_comp,Vit_sampleavgs,Vit_comp_sampleavgs,Vit_sampleavgs_avg,Vit_comp_sampleavgs_avg] = ExVivoData_opt("Vit",File_name,sample_num);

%Retina
[Ret,Ret_comp,Ret_sampleavgs,Ret_comp_sampleavgs,Ret_sampleavgs_avg,Ret_comp_sampleavgs_avg] = ExVivoData_opt("Ret",File_name,sample_num);

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
    Conj_plot = ExVivoDataPlot_opt('Conjunctive Tissue',Conj,Conj_sampleavgs,Conj_sampleavgs_avg,freq,sample_num,row_num,column_num);
    Conj_comp_plot = ExVivoDataPlot_opt('Conjunctive Tissue (Imaginary)',Conj,Conj_comp_sampleavgs,Conj_comp_sampleavgs_avg,freq,sample_num,row_num,column_num);

%Epithelial Cornea
    EpCorn_plot = ExVivoDataPlot_opt('Epithelial Cornea',EpCorn,EpCorn_sampleavgs,EpCorn_sampleavgs_avg,freq,sample_num,row_num,column_num);
    EpCorn_comp_plot = ExVivoDataPlot_opt('Epithelial Cornea (Imaginary)',EpCorn_comp,EpCorn_comp_sampleavgs,EpCorn_comp_sampleavgs_avg,freq,sample_num,row_num,column_num);

%Iris
    Iris_plot = ExVivoDataPlot_opt('Iris',Iris,Iris_sampleavgs,Iris_sampleavgs_avg,freq,sample_num,row_num,column_num);
    Iris_comp_plot = ExVivoDataPlot_opt('Iris (Imaginary)',Iris_comp,Iris_comp_sampleavgs,Iris_comp_sampleavgs_avg,freq,sample_num,row_num,column_num);
   
%Lens
    Lens_plot = ExVivoDataPlot_opt('Lens',Lens,Lens_sampleavgs,Lens_sampleavgs_avg,freq,sample_num,row_num,column_num);
    Lens_comp_plot = ExVivoDataPlot_opt('Lens (Imaginary)',Lens_comp,Lens_comp_sampleavgs,Lens_comp_sampleavgs_avg,freq,sample_num,row_num,column_num);

%Vitreous
    Vit_plot = ExVivoDataPlot_opt('Vitreous',Vit,Vit_sampleavgs,Vit_sampleavgs_avg,freq,sample_num,row_num,column_num);
    Vit_comp_plot = ExVivoDataPlot_opt('Vitreous (Imaginary)',Vit_comp,Vit_comp_sampleavgs,Vit_comp_sampleavgs_avg,freq,sample_num,row_num,column_num);

%Retina
    Ret_plot = ExVivoDataPlot_opt('Retina',Ret,Ret_sampleavgs,Ret_sampleavgs_avg,freq,sample_num,row_num,column_num);
    Ret_comp_plot = ExVivoDataPlot_opt('Retina (Imaginary)',Ret_comp,Ret_comp_sampleavgs,Ret_comp_sampleavgs_avg,freq,sample_num,row_num,column_num);

%Comparison of Averages
    Averages_fig = figure('Name','Comparison Sample of Averages');
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
    title('Comparison of Tissue Averages')
    lgd = legend('Conjunctive Tissue','Epithelial Cornea','Iris','Lens','Vitreous','Retina');
    lgd.FontSize = 5;
    x0 = 150; y0 = 35; width = 1000; height = 600;
    set(gcf,'position',[x0,y0,width,height])
    f.Units = 'normalized';
    lineWidth = 5; % Whatever you want.
    annotation('line', [0, 0], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [1, 1], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [0, 1], [0, 0], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [1, 0], [1, 1], 'LineWidth', lineWidth, 'Color', 'k');

    Averages_comp_fig = figure('Name','Comparison Sample of Averages (Imaginary)');
    plot(freq,Conj_comp_sampleavgs_avg);
    hold on
    plot(freq,EpCorn_comp_sampleavgs_avg);
    plot(freq,Iris_comp_sampleavgs_avg);
    plot(freq,Lens_comp_sampleavgs_avg);
    plot(freq,Vit_comp_sampleavgs_avg);
    plot(freq,Ret_comp_sampleavgs_avg);
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    title('Comparison of Tissue Averages (Imaginary)')
    lgd = legend('Conjunctive Tissue Imaginary','Epithelial Cornea Imaginary','Iris Imaginary','Lens Imaginary','Vitreous Imaginary','Retina Imaginary');
    lgd.FontSize = 5;
    x0 = 150; y0 = 35; width = 1000; height = 600;
    set(gcf,'position',[x0,y0,width,height])
    f.Units = 'normalized';
    lineWidth = 5; % Whatever you want.
    annotation('line', [0, 0], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [1, 1], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [0, 1], [0, 0], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [1, 0], [1, 1], 'LineWidth', lineWidth, 'Color', 'k');

%% Save Figures
FolderName = ('C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Figures\Ex Vivo Tissues\Total Eyes');   % using my directory
FigList = findobj(allchild(0), 'flat', 'Type', 'figure');
for iFig = 1:length(FigList)
  FigHandle = FigList(iFig);
  FigName   = num2str(get(FigHandle, 'Name'));
  set(0, 'CurrentFigure', FigHandle);
  saveas(FigHandle, fullfile(FolderName,strcat(FigName, '.png'))); % specify the full path
end