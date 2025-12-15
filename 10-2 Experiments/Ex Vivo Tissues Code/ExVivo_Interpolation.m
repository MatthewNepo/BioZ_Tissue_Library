%% Initialize
format longG
clear variables; close all; clc; format short
freq(1:201) = linspace(5000,1000000,201); freq = freq./1000;

%% Load in Data
Date_num = "10-2-24";

%Conjunctive Tissue
Conj_num = "Conj";
Conj_Data = ExVivoData(Conj_num,Date_num);
Conj = cell2mat(Conj_Data(1));
Conj_comp = cell2mat(Conj_Data(2));
Conj_sampleavgs = cell2mat(Conj_Data(3))';
Conj_comp_sampleavgs = cell2mat(Conj_Data(4))';
Conj_sampleavgs_avg = cell2mat(Conj_Data(5))';
Conj_comp_sampleavgs_avg = cell2mat(Conj_Data(6))';

%Epithelial Cornea
EpCorn_num = "EpCorn";
EpCorn_Data = ExVivoData(EpCorn_num,Date_num);
EpCorn = cell2mat(EpCorn_Data(1));
EpCorn_comp = cell2mat(EpCorn_Data(2));
EpCorn_sampleavgs = cell2mat(EpCorn_Data(3))';
EpCorn_comp_sampleavgs = cell2mat(EpCorn_Data(4))';
EpCorn_sampleavgs_avg = cell2mat(EpCorn_Data(5))';
EpCorn_comp_sampleavgs_avg = cell2mat(EpCorn_Data(6))';

%Iris
Iris_num = "Iris";
Iris_Data = ExVivoData(Iris_num,Date_num);
Iris = cell2mat(Iris_Data(1));
Iris_comp = cell2mat(Iris_Data(2));
Iris_sampleavgs = cell2mat(Iris_Data(3))';
Iris_comp_sampleavgs = cell2mat(Iris_Data(4))';
Iris_sampleavgs_avg = cell2mat(Iris_Data(5))';
Iris_comp_sampleavgs_avg = cell2mat(Iris_Data(6))';

%Lens
Lens_num = "Lens";
Lens_Data = ExVivoData(Lens_num,Date_num);
Lens = cell2mat(Lens_Data(1));
Lens_comp = cell2mat(Lens_Data(2));
Lens_sampleavgs = cell2mat(Lens_Data(3))';
Lens_comp_sampleavgs = cell2mat(Lens_Data(4))';
Lens_sampleavgs_avg = cell2mat(Lens_Data(5))';
Lens_comp_sampleavgs_avg = cell2mat(Lens_Data(6))';

%Vitreous
Vit_num = "Vit";
Vit_Data = ExVivoData(Vit_num,Date_num);
Vit = cell2mat(Vit_Data(1));
Vit_comp = cell2mat(Vit_Data(2));
Vit_sampleavgs = cell2mat(Vit_Data(3))';
Vit_comp_sampleavgs = cell2mat(Vit_Data(4))';
Vit_sampleavgs_avg = cell2mat(Vit_Data(5))';
Vit_comp_sampleavgs_avg = cell2mat(Vit_Data(6))';

%Retina
Ret_num = "Ret";
Ret_Data = ExVivoData(Ret_num,Date_num);
Ret = cell2mat(Ret_Data(1));
Ret_comp = cell2mat(Ret_Data(2));
Ret_sampleavgs = cell2mat(Ret_Data(3))';
Ret_comp_sampleavgs = cell2mat(Ret_Data(4))';
Ret_sampleavgs_avg = cell2mat(Ret_Data(5))';
Ret_comp_sampleavgs_avg = cell2mat(Ret_Data(6))';

%% Data Stats
%Conjunctive Tissue
Conj_Stats = ExVivoDataStats(Conj);
Conj_min = Conj_Stats(1,:);
Conj_max = Conj_Stats(2,:);

%Epithelial Cornea
EpCorn_Stats = ExVivoDataStats(EpCorn);
EpCorn_min = EpCorn_Stats(1,:);
EpCorn_max = EpCorn_Stats(2,:);

%Iris
Iris_Stats = ExVivoDataStats(Iris);
Iris_min = Iris_Stats(1,:);
Iris_max = Iris_Stats(2,:);

%Lens
Lens_Stats = ExVivoDataStats(Lens);
Lens_min = Lens_Stats(1,:);
Lens_max = Lens_Stats(2,:);

%Vitreous
Vit_Stats = ExVivoDataStats(Vit);
Vit_min = Vit_Stats(1,:);
Vit_max = Vit_Stats(2,:);

%Retina
Ret_Stats = ExVivoDataStats(Ret);
Ret_min = Ret_Stats(1,:);
Ret_max = Ret_Stats(2,:);

%% Plot Data
%Conj
    Conj_fig = figure();
    Conj_name = 'Conjunctive Tissue';
    Conj_plot = ExVivoDataPlot(Conj_num,Conj_name,Conj,Conj_sampleavgs,Conj_sampleavgs_avg,freq);

%Epithelial Cornea
    EpCorn_fig = figure();
    EpCorn_name = 'Epithelial Cornea';
    EpCorn_plot = ExVivoDataPlot(EpCorn_num,EpCorn_name,EpCorn,EpCorn_sampleavgs,EpCorn_sampleavgs_avg,freq);

%Iris
    Iris_fig = figure();
    Iris_name = 'Iris';
    Iris_plot = ExVivoDataPlot(Iris_num,Iris_name,Iris,Iris_sampleavgs,Iris_sampleavgs_avg,freq);

%Lens
    Lens_fig = figure();
    Lens_name = 'Lens';
    Lens_plot = ExVivoDataPlot(Lens_num,Lens_name,Lens,Lens_sampleavgs,Lens_sampleavgs_avg,freq);

%Vitreous
    Vit_fig = figure();
    Vit_name = 'Vitreous';
    Vit_plot = ExVivoDataPlot(Vit_num,Vit_name,Vit,Vit_sampleavgs,Vit_sampleavgs_avg,freq);

%Retina
    Ret_fig = figure();
    Ret_name = 'Retina';
    Ret_plot = ExVivoDataPlot(Ret_num,Ret_name,Ret,Ret_sampleavgs,Ret_sampleavgs_avg,freq);

% %Cross Comparison
%     h3.fig = figure;
%     box on
%     h3.ax = gobjects(2);
%     for ii = 1:4
%         h3.ax(ii) = subplot(2,2,ii);
%     end
%     h3.ax = h3.ax';
%     h3.ax2 = gobjects(size(h3.ax));
%     hAx = findobj('type', 'axes');
%     h3.ax2(1,1) = copyobj(hAx(17), h3.fig);
%     h3.ax2(2,1) = copyobj(hAx(9), h3.fig);
%     h3.ax2(1,2) = copyobj(hAx(13), h3.fig);
%     h3.ax2(2,2) = copyobj(hAx(5), h3.fig);
%     for ii = 1:4
%         h3.ax2(ii).Position = h3.ax(ii).Position;
%     end
%     delete(h3.ax);
%     x0 = 250; y0 = 100; width = 800; height = 500;
%     set(gcf,'position',[x0,y0,width,height])
%     f.Units = 'normalized';
%     lineWidth = 5; % Whatever you want.
%     annotation('line', [0, 0], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
%     annotation('line', [1, 1], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
%     annotation('line', [0, 1], [0, 0], 'LineWidth', lineWidth, 'Color', 'k');
%     annotation('line', [1, 0], [1, 1], 'LineWidth', lineWidth, 'Color', 'k');

%Comparison of Averages
    Averages_fig = figure();
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
    legend('Conjunctive Tissue','Epithelial Cornea','Iris','Lens','Vitreous','Retina')
    x0 = 250; y0 = 100; width = 800; height = 500;
    set(gcf,'position',[x0,y0,width,height])
    f.Units = 'normalized';
    lineWidth = 5; % Whatever you want.
    annotation('line', [0, 0], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [1, 1], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [0, 1], [0, 0], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [1, 0], [1, 1], 'LineWidth', lineWidth, 'Color', 'k');

% %Min and Max
%     Min_Max_fig = figure();
%     hold all
%     plot(freq,BSS_100_min);
%     plot(freq,BSS_100_max);
%     patch([freq, fliplr(freq)], [BSS_100_min, fliplr(BSS_100_max)], 'b')
%     plot(freq,Vit_33_min);
%     plot(freq,Vit_33_max);
%     patch([freq, fliplr(freq)], [Vit_33_min, fliplr(Vit_33_max)], 'g')
%     plot(freq,Vit_66_min);
%     plot(freq,Vit_66_max);
%     patch([freq, fliplr(freq)], [Vit_66_min, fliplr(Vit_66_max)], 'y')
%     plot(freq,Vit_100_min);
%     plot(freq,Vit_100_max);
%     patch([freq, fliplr(freq)], [Vit_100_min, fliplr(Vit_100_max)], 'r')
%     hold off
%     xlabel('Frequency (kHz)')
%     xticks([0,100,200,300,400,500,600,700,800,900,1000])
%     ylabel('Impedance (kOhms)')
%     title('Ratio Class Ranges')
%     legend('1.5 mL BSS Max','1.5 mL BSS Min','1.5 mL BSS Range', ...
%         '0.5 mL Vitreous / 1.0 mL BSS Max','0.5 mL Vitreous / 1.0 mL BSS Min','0.5 mL Vitreous / 1.0 mL BSS Range', ...
%         '1.0 mL Vitreous / 0.5 mL BSS Max','1.0 mL Vitreous / 0.5 mL BSS Min','1.0 mL Vitreous / 0.5 mL BSS Range', ...
%         '1.5 mL Vitreous Max','1.5 mL Vitreous Min','1.5 mL Vitreous Range')
%     set(gcf,'position',[x0,y0,width,height])
%     f.Units = 'normalized';
%     lineWidth = 5; % Whatever you want.
%     annotation('line', [0, 0], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
%     annotation('line', [1, 1], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
%     annotation('line', [0, 1], [0, 0], 'LineWidth', lineWidth, 'Color', 'k');
%     annotation('line', [1, 0], [1, 1], 'LineWidth', lineWidth, 'Color', 'k');

%% Save Figures
FolderName = ('C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Figures\Ex Vivo Tissues');   % using my directory
FigList = findobj(allchild(0), 'flat', 'Type', 'figure');
for iFig = 1:length(FigList)
  FigHandle = FigList(iFig);
  FigName   = num2str(get(FigHandle, 'Number'));
  set(0, 'CurrentFigure', FigHandle);
  saveas(FigHandle, fullfile(FolderName,strcat(FigName, '.png'))); % specify the full path
end