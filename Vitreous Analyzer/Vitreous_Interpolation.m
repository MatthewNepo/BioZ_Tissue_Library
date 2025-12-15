%% Initialize
format longG
clear variables; close all; clc;format short
BSS = zeros(201,3);
Vitreous_100 = zeros(201,3);
Air = zeros(201,3);
Vitreous_75 = zeros(201,3);
Vitreous_50 = zeros(201,3);
Vitreous_25 = zeros(201,3);
freq(1:201) = linspace(5000,1000000,201); freq = freq./1000;

%% Load in Data
%BSS
BSS1 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\BSS_T1.csv");
BSS2 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\BSS_T2.csv");
BSS3 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\BSS_T3.csv");
BSS(:,1) = BSS1(:,1);
BSS_comp(:,1) = BSS1(:,2);
BSS(:,2) = BSS2(:,1);
BSS_comp(:,2) = BSS2(:,2);
BSS(:,3) = BSS3(:,1);
BSS_comp(:,3) = BSS3(:,2);
BSS = BSS./1000;
%Vitreous
Vitreous_100_1 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\8-2-24\Vit_100_1.csv");
Vitreous_100_2 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\8-2-24\Vit_100_2.csv");
Vitreous_100_3 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\8-2-24\Vit_100_3.csv");
Vitreous_100(:,1) = Vitreous_100_1(:,1);
Vitreous_100_comp(:,1) = Vitreous_100_1(:,2);
Vitreous_100(:,2) = Vitreous_100_2(:,1);
Vitreous_100_comp(:,2) = Vitreous_100_2(:,2);
Vitreous_100(:,3) = Vitreous_100_3(:,1);
Vitreous_100_comp(:,3) = Vitreous_100_3(:,2);
Vitreous_100 = Vitreous_100./1000;
%Air
Air1 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\Air_T1.csv");
Air2 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\Air_T2.csv");
Air3 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\Air_T3.csv");
Air(:,1) = Air1(:,1);
Air_comp(:,1) = Air1(:,2);
Air(:,2) = Air2(:,1);
Air_comp(:,2) = Air2(:,2);
Air(:,3) = Air3(:,1);
Air_comp(:,3) = Air3(:,2);
Air = Air./1000;
%Gel
Vitreous_75_1 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\8-2-24\Vit_75_1.csv");
Vitreous_75_2 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\8-2-24\Vit_75_2.csv");
Vitreous_75_3 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\8-2-24\Vit_75_3.csv");
Vitreous_75(:,1) = Vitreous_75_1(:,1);
Vitreous_75_comp(:,1) = Vitreous_75_1(:,2);
Vitreous_75(:,2) = Vitreous_75_2(:,1);
Vitreous_75_comp(:,2) = Vitreous_75_2(:,2);
Vitreous_75(:,3) = Vitreous_75_3(:,1);
Vitreous_75_comp(:,3) = Vitreous_75_3(:,2);
Vitreous_75 = Vitreous_75./1000;
%Goo
Vitreous_50_1 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\8-2-24\Vit_50_1.csv");
Vitreous_50_2 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\8-2-24\Vit_50_2.csv");
Vitreous_50_3 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\8-2-24\Vit_50_3.csv");
Vitreous_50(:,1) = Vitreous_50_1(:,1);
Vitreous_50_comp(:,1) = Vitreous_50_1(:,2);
Vitreous_50(:,2) = Vitreous_50_2(:,1);
Vitreous_50_comp(:,2) = Vitreous_50_2(:,2);
Vitreous_50(:,3) = Vitreous_50_3(:,1);
Vitreous_50_comp(:,3) = Vitreous_50_3(:,2);
Vitreous_50 = Vitreous_50./1000;
%Conjunctive
Vitreous_25_1 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\8-2-24\Vit_25_1.csv");
Vitreous_25_2 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\8-2-24\Vit_25_2.csv");
Vitreous_25_3 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\8-2-24\Vit_25_3.csv");
Vitreous_25(:,1) = Vitreous_25_1(:,1);
Vitreous_25_comp(:,1) = Vitreous_25_1(:,2);
Vitreous_25(:,2) = Vitreous_25_2(:,1);
Vitreous_25_comp(:,2) = Vitreous_25_2(:,2);
Vitreous_25(:,3) = Vitreous_25_3(:,1);
Vitreous_25_comp(:,3) = Vitreous_25_3(:,2);
Vitreous_25 = Vitreous_25./1000;

%% Process Data
%BSS
BSSavg = mean(BSS');
BSS_compavg = mean(BSS_comp');
%Vitreous
Vitreous_100avg= mean(Vitreous_100');
Vitreous_100_compavg= mean(Vitreous_100_comp');
%Air
Airavg = mean(Air');
Air_compavg = mean(Air_comp');
%Gel
Vitreous_75avg = mean(Vitreous_75');
Vitreous_75avg = smooth(Vitreous_75avg)';
Vitreous_75_compavg = mean(Vitreous_75_comp');
%Goo
Vitreous_50avg = mean(Vitreous_50');
Vitreous_50_compavg = mean(Vitreous_50_comp');
%Conjunctive
Vitreous_25avg = mean(Vitreous_25');
Vitreous_25_compavg = mean(Vitreous_25_comp');

%% Plot Data
    figure(1)
    box on
    subplot(3,2,1)
    plot(freq,Air(:,1))
    hold on
    plot(freq,Air(:,2))
    plot(freq,Air(:,3))
    plot(freq,Airavg)
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    title('Air')
    legend('Trial 1','Trial 2','Trial 3','Trial Average')
    subplot(3,2,2)
    plot(freq,BSS(:,1))
    hold on
    plot(freq,BSS(:,2))
    plot(freq,BSS(:,3))
    plot(freq,BSSavg)
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    title('100% BSS')
    legend('Trial 1','Trial 2','Trial 3','Trial Average')
    subplot(3,2,3)
    plot(freq,Vitreous_25(:,1))
    hold on
    plot(freq,Vitreous_25(:,2))
    plot(freq,Vitreous_25(:,3))
    plot(freq,Vitreous_25avg)
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    title('25% Vitreous / 75% BSS')
    legend('Trial 1','Trial 2','Trial 3','Trial Average')
    subplot(3,2,4)
    plot(freq,Vitreous_50(:,1))
    hold on
    plot(freq,Vitreous_50(:,2))
    plot(freq,Vitreous_50(:,3))
    plot(freq,Vitreous_50avg)
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    title('50% Vitreous / 50% BSS')
    legend('Trial 1','Trial 2','Trial 3','Trial Average')
    subplot(3,2,5)
    plot(freq,Vitreous_75(:,3))
    hold on
    plot(freq,Vitreous_75(:,2))
    plot(freq,Vitreous_75(:,3))
    plot(freq,Vitreous_75avg)
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    title('75% Vitreous / 25% BSS')
    legend('Trial 1','Trial 2','Trial 3','Trial Average')
    subplot(3,2,6)
    plot(freq,Vitreous_100avg)
    hold on
    plot(freq,Vitreous_100(:,2))
    plot(freq,Vitreous_100(:,3))
    plot(freq,Vitreous_100avg)
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    title('100% Vitreous')
    legend('Trial 1','Trial 2','Trial 3','Trial Average')
    x0 = 350; y0 = 100; width = 600; height = 500;
    set(gcf,'position',[x0,y0,width,height])
    f.Units = 'normalized';
    lineWidth = 5; % Whatever you want.
    annotation('line', [0, 0], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [1, 1], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [0, 1], [0, 0], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [1, 0], [1, 1], 'LineWidth', lineWidth, 'Color', 'k');
    
    figure(2)
    box on
    plot(freq,BSS(:,1))
    hold on
    plot(freq,Vitreous_25avg)
    plot(freq,Vitreous_50avg)
    plot(freq,Vitreous_75avg)
    plot(freq,Vitreous_100avg)
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    title('Vitreous/BSS Ratio Averages')
    legend('BSS Average','25% Vitreous Average','50% Vitreous Average','75% Vitreous Average','100% Vitreous Average')
    set(gcf,'position',[x0,y0,width,height])
    f.Units = 'normalized';
    lineWidth = 5; % Whatever you want.
    annotation('line', [0, 0], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [1, 1], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [0, 1], [0, 0], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [1, 0], [1, 1], 'LineWidth', lineWidth, 'Color', 'k');
   
% %% Table
% %Interpolate
%     %Sample Points
%     sample = [5,50,100,900];
%     %BSS
%     Conjunctivesamp = interp1(freq,Vitreous_25avg,sample)';
%     Corneasamp = interp1(freq,Corneaavg,sample)';
%     Cornea_Innersamp = interp1(freq,Cornea_Inneravg,sample)';
%     %Gel
%     % Irissamp = interp1(freq,Irisdelta,sample)';
%     % Lenssamp = interp1(freq,Lensdelta,sample)';
%     Irissamp = interp1(freq,Irisavg,sample)';
%     Lenssamp = interp1(freq,Lensavg,sample)';
%     %Goo
%     % Retinasamp = interp1(freq,Retinadelta,sample)';
%     Retinasamp = interp1(freq,Retinaavg,sample)';
%     %Retina
%     % Choroidsamp = interp1(freq,Choroiddelta,sample)';
%     Choroidsamp = interp1(freq,Choroidavg,sample)';
% %Entabultate
%     BSSSamples = table(categorical({'5';'50';'100';'900'}),Conjunctivesamp,Corneasamp,Cornea_Innersamp,'VariableNames',{'Sample Frequency (kHz)','Conjunctiva (kOhms)','Corneal Epithelial Surface (kOhms)','Corneal Endothelial Surface (kOhms)'});
%     % BSSSamples = table(categorical({'50';'100';'900'}),Conjunctivesamp,Corneasamp,Cornea_Innersamp,'VariableNames',{'Sample Frequency (kHz)','Conjunctiva (kOhms)','Outer Cornea (kOhms)','Inner Cornea (kOhms)'});
%     BSSBase = table(BSSSamples,'VariableNames',{'BSS Baseline'});
%     GelSamples = table(categorical({'5';'50';'100';'900'}),Irissamp,Lenssamp,'VariableNames',{'Sample Frequency (kHz)','Iris (kOhms)','Lens (kOhms)'});
%     % GelSamples = table(categorical({'50';'100';'900'}),Irissamp,Lenssamp,'VariableNames',{'Sample Frequency (kHz)','Iris (kOhms)','Lens (kOhms)'});
%     GelBase = table(GelSamples,'VariableNames',{'Gel Baseline'});
%     GooSamples = table(categorical({'5';'50';'100';'900'}),Retinasamp,'VariableNames',{'Sample Frequency (kHz)','Retina (kOhms)'});
%     % GooSamples = table(categorical({'50';'100';'900'}),Retinasamp,'VariableNames',{'Sample Frequency (kHz)','Retina (kOhms)'});
%     GooBase = table(GooSamples,'VariableNames',{'Goo Baseline'});
%     RetinaSamples = table(categorical({'5';'50';'100';'900'}),Choroidsamp,'VariableNames',{'Sample Frequency (kHz)','Choroid (kOhms)'});
%     % RetinaSamples = table(categorical({'50';'100';'900'}),Choroidsamp,'VariableNames',{'Sample Frequency (kHz)','Choroid (kOhms)'});
%     RetinaBase = table(RetinaSamples,'VariableNames',{'Retina Baseline'});
% 
% %% Create Bandgaps
% 
% freqline = [5,900];
% % Cornealine = [Corneasamp(1),Corneasamp(4)];
% % Cornea_Innerline = [Cornea_Innersamp(1),Cornea_Innersamp(4)];
% % Irisline = [Irissamp(1)-3*var(Irissamp),Irissamp(4)+3*var(Irissamp)];
% % Lensline = [Lenssamp(1)+3*var(Lenssamp),Lenssamp(4)-3*var(Lenssamp)];
% % Retinaline = [Retinasamp(1)+3*var(Retinasamp),Retinasamp(4)-3*var(Retinasamp)];
% % Choroidline = [Choroidsamp(1)+3*var(Choroidsamp),Choroidsamp(4)-3*var(Choroidsamp)];
% Corneafit = fitdist(Corneasamp,'Normal');
% Corneaci = paramci(Corneafit);
% Corneaerr = Corneaci(:,2)'
% Corneamu = Corneaci(:,1)'
% Cornealine = [Corneamu(1)-2*var(Corneasamp),Corneamu(2)+2*var(Corneasamp)]
% % Cornealine = [Corneamu(1)-2*Corneaerr(2),Corneamu(2)+2*Corneaerr(2)]
% Cornea_Innerfit = fitdist(Cornea_Innersamp,'Normal');
% Cornea_Innerci = paramci(Cornea_Innerfit);
% Cornea_Innererr = Cornea_Innerci(:,2)'
% Cornea_Innermu = Cornea_Innerci(:,1)'
% Cornea_Innerline = [Cornea_Innermu(1)-2*var(Cornea_Innersamp),Cornea_Innermu(2)+2*var(Cornea_Innersamp)]
% % Cornea_Innerline = [Cornea_Innermu(1)-2*Cornea_Innererr(2),Cornea_Innermu(2)+2*Cornea_Innererr(2)]
% Irisfit = fitdist(Irissamp,'Normal');
% Irisci = paramci(Irisfit);
% Iriserr = Irisci(:,2)'
% Irismu = Irisci(:,1)'
% Irisline = [Irismu(1)-2*var(Irissamp),Irismu(2)+2*var(Irissamp)]
% % Irisline = [Irismu(1)-2*Iriserr(2),Irismu(2)+2*Iriserr(2)]
% Lensfit = fitdist(Lenssamp,'Normal');
% Lensci = paramci(Lensfit);
% Lenserr = Lensci(:,2)'
% Lensmu = Lensci(:,1)'
% Lensline = [Lensmu(1)-2*var(Lenssamp),Lensmu(2)+2*var(Lenssamp)]
% % Lensline = [Lensmu(1)-2*Lenserr(2),Lensmu(2)+2*Lenserr(2)]
% Retinafit = fitdist(Retinasamp,'Normal');
% Retinaci = paramci(Retinafit);
% Retinaerr = Retinaci(:,2)'
% Retinamu = Retinaci(:,1)'
% Retinaline = [Retinamu(1)-2*var(Retinasamp),Retinamu(2)+2*var(Retinasamp)]
% % Retinaline = [Retinamu(1)-2*Retinaerr(2),Retinamu(2)+2*Retinaerr(2)]
% Choroidfit = fitdist(Choroidsamp,'Normal');
% Choroidci = paramci(Choroidfit);
% Choroiderr = Choroidci(:,2)'
% Choroidmu = Choroidci(:,1)'
% Choroidline = [Choroidmu(1)-2*var(Choroidsamp),Choroidmu(2)+2*var(Choroidsamp)]
% % Choroidline = [Choroidmu(1)-2*Choroiderr(2),Choroidmu(2)+2*Choroiderr(2)]
% Conjfit = fitdist(Conjunctivesamp,'Normal');
% Conjci = paramci(Conjfit);
% Conjerr = Conjci(:,2)'
% Conjmu = Conjci(:,1)'
% Conjline = [Conjmu(1)-2*var(Conjunctivesamp),Conjmu(2)+2*var(Conjunctivesamp)]
% Conjline = [Conjmu(1)-2*Conjerr(2),Conjmu(2)+2*Conjerr(2)]
% 
% figure()
% box on
% plot(freqline,Cornealine)
% hold on
% plot(freqline,Irisline)
% % plot(freqline,Lensline)
% plot(freqline,Retinaline)
% plot(freqline,Choroidline)
% % plot(freqline,Conjline)
% hold off
% title("Expected Tissue Bio-Impedance Bandgaps")
% xlabel("Frequency (kHz)")
% ylabel("Bio-Impedance (kOhms)")
% legend("Cornea","Iris","Retina","Choroid")
% lineWidth = 2; % Whatever you want.
% annotation('line', [0, 0], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
% annotation('line', [1, 1], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
% annotation('line', [0, 1], [0, 0], 'LineWidth', lineWidth, 'Color', 'k');
% annotation('line', [1, 0], [1, 1], 'LineWidth', lineWidth, 'Color', 'k');

%% Save Figures
FolderName = ('C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Figures\Vitreous');   % using my directory
FigList = findobj(allchild(0), 'flat', 'Type', 'figure');
for iFig = 1:length(FigList)
  FigHandle = FigList(iFig);
  FigName   = num2str(get(FigHandle, 'Number'));
  set(0, 'CurrentFigure', FigHandle);
  saveas(FigHandle, fullfile(FolderName,strcat(FigName, '.png'))); % specify the full path
end