%% Initialize
format longG
clear variables; close all; clc; format short
% freq(1:201) = 0:5000:1000000; freq = freq./1000;
freq(1:201) = linspace(5000,1000000,201); freq = freq./1000;
% freq_interp = 0:5:1000;

%% Load in Data
Date_num = "8-12-24";

%BSS_100
BSS_100_num = "BSS_100";
BSS_100_Data = InVitroData(BSS_100_num,Date_num);
BSS_100 = cell2mat(BSS_100_Data(1));
BSS_100_comp = cell2mat(BSS_100_Data(2));
BSS_100_sampleavgs = cell2mat(BSS_100_Data(3))';
BSS_100_comp_sampleavgs = cell2mat(BSS_100_Data(4))';
BSS_100_sampleavgs_avg = cell2mat(BSS_100_Data(5))';
BSS_100_comp_sampleavgs_avg = cell2mat(BSS_100_Data(6))';

%Vit_33
Vit_33_num = "BSS_66";
Vit_33_Data = InVitroData(Vit_33_num,Date_num);
Vit_33 = cell2mat(Vit_33_Data(1));
Vit_33_comp = cell2mat(Vit_33_Data(2));
Vit_33_sampleavgs = cell2mat(Vit_33_Data(3))';
Vit_33_comp_sampleavgs = cell2mat(Vit_33_Data(4))';
Vit_33_sampleavgs_avg = cell2mat(Vit_33_Data(5))';
Vit_33_comp_sampleavgs_avg = cell2mat(Vit_33_Data(6))';

%Vit_66
Vit_66_num = "BSS_33";
Vit_66_Data = InVitroData(Vit_66_num,Date_num);
Vit_66 = cell2mat(Vit_66_Data(1));
Vit_66_comp = cell2mat(Vit_66_Data(2));
Vit_66_sampleavgs = cell2mat(Vit_66_Data(3))';
Vit_66_comp_sampleavgs = cell2mat(Vit_66_Data(4))';
Vit_66_sampleavgs_avg = cell2mat(Vit_66_Data(5))';
Vit_66_comp_sampleavgs_avg = cell2mat(Vit_66_Data(6))';

%Vit_100
Vit_100_num = "Vit_100";
Vit_100_Data = InVitroData(Vit_100_num,Date_num);
Vit_100 = cell2mat(Vit_100_Data(1));
Vit_100_comp = cell2mat(Vit_100_Data(2));
Vit_100_sampleavgs = cell2mat(Vit_100_Data(3))';
Vit_100_comp_sampleavgs = cell2mat(Vit_100_Data(4))';
Vit_100_sampleavgs_avg = cell2mat(Vit_100_Data(5))';
Vit_100_comp_sampleavgs_avg = cell2mat(Vit_100_Data(6))';

%% Data Stats
Vit_33_Stats = InVitroDataStats(Vit_33);
Vit_33_min = Vit_33_Stats(1,:);
Vit_33_max = Vit_33_Stats(2,:);
Vit_66_Stats = InVitroDataStats(Vit_66);
Vit_66_min = Vit_66_Stats(1,:);
Vit_66_max = Vit_66_Stats(2,:);
Vit_100_Stats = InVitroDataStats(Vit_100);
Vit_100_min = Vit_100_Stats(1,:);
Vit_100_max = Vit_100_Stats(2,:);
BSS_100_Stats = InVitroDataStats(BSS_100);
BSS_100_min = BSS_100_Stats(1,:);
BSS_100_max = BSS_100_Stats(2,:);

%% Plot Data

%1.5 mL BSS
    BSS_100_fig = figure();
    BSS_100_name = '1.5 mL BSS';
    BSS_100_plot = InVitroDataPlot(BSS_100_num,BSS_100_name,BSS_100,BSS_100_sampleavgs,BSS_100_sampleavgs_avg,freq);

%1.0 mL BSS / 0.5 mL Vitreous
    Vit_33_fig = figure();
    Vit33_name = '1.0 mL BSS / 0.5 mL Vitreous';
    Vit_33_plot = InVitroDataPlot(Vit_33_num,Vit33_name,Vit_33,Vit_33_sampleavgs,Vit_33_sampleavgs_avg,freq);
 
%0.5 mL BSS / 1.0 mL Vitreous
    Vit_66_fig = figure();
    Vit_66_name = '0.5 mL BSS / 1.0 mL Vitreous';
    Vit_66_plot = InVitroDataPlot(Vit_66_num,Vit_66_name,Vit_66,Vit_66_sampleavgs,Vit_66_sampleavgs_avg,freq);
  
%1.5 mL Vitreous
    Vit_100_fig = figure();
    Vit_100_name = '1.5 mL Vitreous';
    Vit_100_plot = InVitroDataPlot(Vit_100_num,Vit_100_name,Vit_100,Vit_100_sampleavgs,Vit_100_sampleavgs_avg,freq);
    
%Cross Comparison
    h3.fig = figure;
    box on
    h3.ax = gobjects(2);
    for ii = 1:4
        h3.ax(ii) = subplot(2,2,ii);
    end
    h3.ax = h3.ax';
    h3.ax2 = gobjects(size(h3.ax));
    hAx = findobj('type', 'axes');
    h3.ax2(1,1) = copyobj(hAx(17), h3.fig);
    h3.ax2(2,1) = copyobj(hAx(9), h3.fig);
    h3.ax2(1,2) = copyobj(hAx(13), h3.fig);
    h3.ax2(2,2) = copyobj(hAx(5), h3.fig);
    for ii = 1:4
        h3.ax2(ii).Position = h3.ax(ii).Position;
    end
    delete(h3.ax);
    x0 = 250; y0 = 100; width = 800; height = 500;
    set(gcf,'position',[x0,y0,width,height])
    f.Units = 'normalized';
    lineWidth = 5; % Whatever you want.
    annotation('line', [0, 0], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [1, 1], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [0, 1], [0, 0], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [1, 0], [1, 1], 'LineWidth', lineWidth, 'Color', 'k');

%Comparison of Averages
    Averages_fig = figure();
    plot(freq,BSS_100_sampleavgs_avg);
    hold on
    plot(freq,Vit_33_sampleavgs_avg);
    plot(freq,Vit_66_sampleavgs_avg);
    plot(freq,Vit_100_sampleavgs_avg);
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    title('Comparison of Vitreous/BSS Averages')
    legend('1.5 mL BSS','0.5 mL Vitreous / 1.0 mL BSS','1.0 mL Vitreous / 0.5 mL BSS','1.5 mL Vitreous')
    set(gcf,'position',[x0,y0,width,height])
    f.Units = 'normalized';
    lineWidth = 5; % Whatever you want.
    annotation('line', [0, 0], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [1, 1], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [0, 1], [0, 0], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [1, 0], [1, 1], 'LineWidth', lineWidth, 'Color', 'k');

%Min and Max
    Min_Max_fig = figure();
    hold all
    plot(freq,BSS_100_min);
    plot(freq,BSS_100_max);
    patch([freq, fliplr(freq)], [BSS_100_min, fliplr(BSS_100_max)], 'b')
    plot(freq,Vit_33_min);
    plot(freq,Vit_33_max);
    patch([freq, fliplr(freq)], [Vit_33_min, fliplr(Vit_33_max)], 'g')
    plot(freq,Vit_66_min);
    plot(freq,Vit_66_max);
    patch([freq, fliplr(freq)], [Vit_66_min, fliplr(Vit_66_max)], 'y')
    plot(freq,Vit_100_min);
    plot(freq,Vit_100_max);
    patch([freq, fliplr(freq)], [Vit_100_min, fliplr(Vit_100_max)], 'r')
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    title('Ratio Class Ranges')
    legend('1.5 mL BSS Max','1.5 mL BSS Min','1.5 mL BSS Range', ...
        '0.5 mL Vitreous / 1.0 mL BSS Max','0.5 mL Vitreous / 1.0 mL BSS Min','0.5 mL Vitreous / 1.0 mL BSS Range', ...
        '1.0 mL Vitreous / 0.5 mL BSS Max','1.0 mL Vitreous / 0.5 mL BSS Min','1.0 mL Vitreous / 0.5 mL BSS Range', ...
        '1.5 mL Vitreous Max','1.5 mL Vitreous Min','1.5 mL Vitreous Range')
    set(gcf,'position',[x0,y0,width,height])
    f.Units = 'normalized';
    lineWidth = 5; % Whatever you want.
    annotation('line', [0, 0], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [1, 1], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [0, 1], [0, 0], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [1, 0], [1, 1], 'LineWidth', lineWidth, 'Color', 'k');

%% Scatter Plots Format
    format rational
    Ratio_Titles = linspace(0/30,30/30,31);
    Ratios = zeros(4,201);
    Ratios(1,:) = 0;
    Ratios(2,:) = 1/3;
    Ratios(3,:) = 2/3;
    Ratios(4,:) = 3/3;

%% Interp
    % BSS_100_Interp = interp1(freq_interp,BSS_100);
    % Vit_100_Interp = interp1(freq_interp,Vit_100);
    % Vit_33_Interp = interp1(freq_interp,Vit_33);
    % Vit_66_Interp = interp1(freq_interp,Vit_66);

%% Polyfit
    poly_x = [0,1/3,2/3,1];
    poly_x_line = Ratio_Titles;
    format default
    poly_max = [max(max(BSS_100)),max(max(Vit_33)),max(max(Vit_66)),max(max(Vit_100))];
    poly_min = [min(min(BSS_100)),min(min(Vit_33)),min(min(Vit_66)),min(min(Vit_100))];
    % poly_50 = [mean(BSS_100_Interp(11,:)),mean(Vit_33_Interp(11,:)),mean(Vit_66_Interp(11,:)),mean(Vit_100_Interp(11,:))];
    % poly_100 = [mean(BSS_100_Interp(21,:)),mean(Vit_33_Interp(21,:)),mean(Vit_66_Interp(21,:)),mean(Vit_100_Interp(21,:))];
    % poly_500 = [mean(BSS_100_Interp(101,:)),mean(Vit_33_Interp(101,:)),mean(Vit_66_Interp(101,:)),mean(Vit_100_Interp(101,:))];
    % poly_900 = [mean(BSS_100_Interp(181,:)),mean(Vit_33_Interp(181,:)),mean(Vit_66_Interp(181,:)),mean(Vit_100_Interp(181,:))];
    poly_50 = [mean(BSS_100(11,:)),mean(Vit_33(11,:)),mean(Vit_66(11,:)),mean(Vit_100(11,:))];
    poly_100 = [mean(BSS_100(21,:)),mean(Vit_33(21,:)),mean(Vit_66(21,:)),mean(Vit_100(21,:))];
    poly_500 = [mean(BSS_100(101,:)),mean(Vit_33(101,:)),mean(Vit_66(101,:)),mean(Vit_100(101,:))];
    poly_900 = [mean(BSS_100(181,:)),mean(Vit_33(181,:)),mean(Vit_66(181,:)),mean(Vit_100(181,:))];
    poly_max_fit = polyfit(poly_x,poly_max,3);
    poly_min_fit = polyfit(poly_x,poly_min,3);
    poly_50_fit = polyfit(poly_x,poly_50,3);
    poly_100_fit = polyfit(poly_x,poly_100,3);
    poly_500_fit = polyfit(poly_x,poly_500,3);
    poly_900_fit = polyfit(poly_x,poly_900,3);
    poly_max_line = poly_max_fit(4)+(poly_max_fit(3)*poly_x_line)+(poly_max_fit(2)*(poly_x_line.^2))+(poly_max_fit(1)*(poly_x_line.^3));
    poly_min_line = poly_min_fit(4)+(poly_min_fit(3)*poly_x_line)+(poly_min_fit(2)*(poly_x_line.^2))+(poly_min_fit(1)*(poly_x_line.^3));
    poly_50_line = poly_50_fit(4)+(poly_50_fit(3)*poly_x_line)+(poly_50_fit(2)*(poly_x_line.^2))+(poly_50_fit(1)*(poly_x_line.^3));
    poly_100_line = poly_100_fit(4)+(poly_100_fit(3)*poly_x_line)+(poly_100_fit(2)*(poly_x_line.^2))+(poly_100_fit(1)*(poly_x_line.^3));
    poly_500_line = poly_500_fit(4)+(poly_500_fit(3)*poly_x_line)+(poly_500_fit(2)*(poly_x_line.^2))+(poly_500_fit(1)*(poly_x_line.^3));
    poly_900_line = poly_900_fit(4)+(poly_900_fit(3)*poly_x_line)+(poly_900_fit(2)*(poly_x_line.^2))+(poly_900_fit(1)*(poly_x_line.^3));

%% Scatter Plots and Fit Lines
    format rational
    figure()
    hold all
    scatter(Ratios(1,:),BSS_100)
    scatter(Ratios(2,:),Vit_33)
    scatter(Ratios(3,:),Vit_66)
    scatter(Ratios(4,:),Vit_100)
    plot(poly_x_line,poly_max_line)
    plot(poly_x_line,poly_min_line)
    plot(poly_x_line,poly_50_line)
    plot(poly_x_line,poly_100_line)
    plot(poly_x_line,poly_500_line)
    plot(poly_x_line,poly_900_line)
    xticks(Ratio_Titles)
    xticklabels((0 : 1 : 30) + "/30")
    title('Fraction of Vitreous in Mixture')
    xlabel('Vitreous Fraction')
    ylabel('Bioimpedance (kOhms)')
    legend('','','','','','','','','','','','','','','','','','','','','','','','', ...
        '','','','','','','','','','','','','Maximum Impedance','Minimum Impedance', ...
        '50 kHz','100 kHz','500 kHz','900 kHz')
    set(gcf,'position',[x0,y0,width,height])
    f.Units = 'normalized';
    lineWidth = 5; % Whatever you want.
    annotation('line', [0, 0], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [1, 1], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [0, 1], [0, 0], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [1, 0], [1, 1], 'LineWidth', lineWidth, 'Color', 'k');

%% Save Figures
FolderName = ('C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Figures\In Vitro Vitreous');   % using my directory
FigList = findobj(allchild(0), 'flat', 'Type', 'figure');
for iFig = 1:length(FigList)
  FigHandle = FigList(iFig);
  FigName   = num2str(get(FigHandle, 'Number'));
  set(0, 'CurrentFigure', FigHandle);
  saveas(FigHandle, fullfile(FolderName,strcat(FigName, '.png'))); % specify the full path
end