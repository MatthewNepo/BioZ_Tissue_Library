%% Initialize
format longG
clear variables; close all; clc;format short
BSS = zeros(201,3);
Vitreous = zeros(201,3);
Air = zeros(201,3);
Gel = zeros(201,3);
Goo = zeros(201,3);
Conjunctive = zeros(201,3);
Cornea = zeros(201,3);
Iris = zeros(201,3);
Lens = zeros(201,3);
Retina = zeros(201,3);
Retinal_Vein = zeros(201,3);
freq = zeros(201,1); freq(1) = 20; freq(2:201) = linspace(5000,1000000,200); freq = freq./1000;

%% Load in Data
%BSS
BSS1 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\V1\BSS_T1.csv");
BSS2 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\V1\BSS_T2.csv");
BSS3 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\V1\BSS_T3.csv");
BSS(:,1) = BSS1(:,1);
BSS_comp(:,1) = BSS1(:,2);
BSS(:,2) = BSS2(:,1);
BSS_comp(:,2) = BSS2(:,2);
BSS(:,3) = BSS3(:,1);
BSS_comp(:,3) = BSS3(:,2);
BSS = BSS./1000;
%Vitreous
Vitreous1 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\V1\Vit_T1.csv");
Vitreous2 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\V1\Vit_T2.csv");
Vitreous3 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\V1\Vit_T3.csv");
Vitreous(:,1) = Vitreous1(:,1);
Vitreous_comp(:,1) = Vitreous1(:,2);
Vitreous(:,2) = Vitreous2(:,1);
Vitreous_comp(:,2) = Vitreous2(:,2);
Vitreous(:,3) = Vitreous3(:,1);
Vitreous_comp(:,3) = Vitreous3(:,2);
Vitreous = Vitreous./1000;
%Air
Air1 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\V1\Air_T1.csv");
Air2 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\V1\Air_T2.csv");
Air3 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\V1\Air_T3.csv");
Air(:,1) = Air1(:,1);
Air_comp(:,1) = Air1(:,2);
Air(:,2) = Air2(:,1);
Air_comp(:,2) = Air2(:,2);
Air(:,3) = Air3(:,1);
Air_comp(:,3) = Air3(:,2);
Air = Air./1000;
%Gel
Gel1 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\V1\Gel_T1.csv");
Gel2 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\V1\Gel_T2.csv");
Gel3 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\V1\Gel_T3.csv");
Gel(:,1) = Gel1(:,1);
Gel_comp(:,1) = Gel1(:,2);
Gel(:,2) = Gel2(:,1);
Gel_comp(:,2) = Gel2(:,2);
Gel(:,3) = Gel3(:,1);
Gel_comp(:,3) = Gel3(:,2);
Gel = Gel./1000;
%Goo
Goo1 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\V1\Goo_T1.csv");
Goo2 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\V1\Goo_T2.csv");
Goo3 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\V1\Goo_T3.csv");
Goo(:,1) = Goo1(:,1);
Goo_comp(:,1) = Goo1(:,2);
Goo(:,2) = Goo2(:,1);
Goo_comp(:,2) = Goo2(:,2);
Goo(:,3) = Goo3(:,1);
Goo_comp(:,3) = Goo3(:,2);
Goo = Goo./1000;
%Conjunctive
Conjunctive1 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\V1\Conj_T1.csv");
Conjunctive2 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\V1\Conj_T2.csv");
Conjunctive3 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\V1\Conj_T3.csv");
Conjunctive(:,1) = Conjunctive1(:,1);
Conjunctive_comp(:,1) = Conjunctive1(:,2);
Conjunctive(:,2) = Conjunctive2(:,1);
Conjunctive_comp(:,2) = Conjunctive2(:,2);
Conjunctive(:,3) = Conjunctive3(:,1);
Conjunctive_comp(:,3) = Conjunctive3(:,2);
Conjunctive = Conjunctive./1000;
%Cornea
Cornea1 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\V1\Cornea_T1.csv");
Cornea2 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\V1\Cornea_T2.csv");
Cornea3 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\V1\Cornea_T3.csv");
Cornea(:,1) = Cornea1(:,1);
Cornea_comp(:,1) = Cornea1(:,2);
Cornea(:,2) = Cornea2(:,1);
Cornea_comp(:,2) = Cornea2(:,2);
Cornea(:,3) = Cornea3(:,1);
Cornea_comp(:,3) = Cornea3(:,2);
Cornea = Cornea./1000;
%Inner Cornea
Cornea_Inner1 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\V1\Cornea_Inner_T1.csv");
Cornea_Inner2 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\V1\Cornea_Inner_T2.csv");
Cornea_Inner3 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\V1\Cornea_Inner_T3.csv");
Cornea_Inner(:,1) = Cornea_Inner1(:,1);
Cornea_Inner_comp(:,1) = Cornea_Inner1(:,2);
Cornea_Inner(:,2) = Cornea_Inner2(:,1);
Cornea_Inner_comp(:,2) = Cornea_Inner2(:,2);
Cornea_Inner(:,3) = Cornea_Inner3(:,1);
Cornea_Inner_comp(:,3) = Cornea_Inner3(:,2);
Cornea_Inner = Cornea_Inner./1000;
%Iris
Iris1 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\V1\Iris_T1.csv");
Iris2 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\V1\Iris_T2.csv");
Iris3 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\V1\Iris_T3.csv");
Iris(:,1) = Iris1(:,1);
Iris_comp(:,1) = Iris1(:,2);
Iris(:,2) = Iris2(:,1);
Iris_comp(:,2) = Iris2(:,2);
Iris(:,3) = Iris3(:,1);
Iris_comp(:,3) = Iris3(:,2);
Iris = Iris./1000;
%Lens
Lens1 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\V1\Lens_T1.csv");
Lens2 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\V1\Lens_T2.csv");
Lens3 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\V1\Lens_T3.csv");
Lens(:,1) = Lens1(:,1);
Lens_comp(:,1) = Lens1(:,2);
Lens(:,2) = Lens2(:,1);
Lens_comp(:,2) = Lens2(:,2);
Lens(:,3) = Lens3(:,1);
Lens_comp(:,3) = Lens3(:,2);
Lens = Lens./1000;
%Retina
Retina1 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\V1\Retina_T1.csv");
Retina2 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\V1\Retina_T2.csv");
Retina3 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\V1\Retina_T3.csv");
Retina(:,1) = Retina1(:,1);
Retina_comp(:,1) = Retina1(:,2);
Retina(:,2) = Retina2(:,1);
Retina_comp(:,2) = Retina2(:,2);
Retina(:,3) = Retina3(:,1);
Retina_comp(:,3) = Retina3(:,2);
Retina = Retina./1000;
%Choroid
Choroid1 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\V1\Choroid_T1.csv");
Choroid2 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\V1\Choroid_T2.csv");
Choroid3 = readmatrix("C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\V1\Choroid_T3.csv");
Choroid(:,1) = Choroid1(:,1);
Choroid_comp(:,1) = Choroid1(:,2);
Choroid(:,2) = Choroid2(:,1);
Choroid_comp(:,2) = Choroid2(:,2);
Choroid(:,3) = Choroid3(:,1);
Choroid_comp(:,3) = Choroid3(:,2);
Choroid = Choroid./1000;

%% Process Data
%BSS
BSSavg = mean(BSS');
BSS_compavg = mean(BSS_comp');
%Vitreous
Vitreousavg= mean(Vitreous');
Vitreous_compavg= mean(Vitreous_comp');
%Air
Airavg = mean(Air');
Air_compavg = mean(Air_comp');
%Gel
Gelavg = mean(Gel');
Gelavg = smooth(Gelavg)';
Gel_compavg = mean(Gel_comp');
%Goo
Gooavg = mean(Goo');
Goo_compavg = mean(Goo_comp');
%Conjunctive
Conjunctiveavg = mean(Conjunctive');
Conjunctive_compavg = mean(Conjunctive_comp');
%Cornea
Corneaavg = mean(Cornea');
Cornea_compavg = mean(Cornea_comp');
%Inner Cornea
Cornea_Inneravg = mean(Cornea_Inner');
Cornea_Inner_compavg = mean(Cornea_Inner_comp');
%Iris
Irisavg = mean(Iris');
Iris_compavg = mean(Iris_comp');
%Lens
Lensavg = mean(Lens');
Lens_compavg = mean(Lens_comp');
%Retina
Retinaavg = mean(Retina');
Retina_compavg = mean(Retina_comp');
%Retina
Choroidavg = mean(Choroid');
Choroid_compavg = mean(Choroid_comp');

%% Calculate Deltas
%Conjunctive
Conjunctivedelta = Conjunctiveavg-BSSavg;
%Cornea
Corneadelta = Corneaavg-BSSavg;
%Inner Cornea
Cornea_Innerdelta = Cornea_Inneravg-BSSavg;
%Iris
Irisdelta = Irisavg-Gelavg;
%Lens
Lensdelta = Lensavg-Gelavg;
%Retina
Retinadelta = Retinaavg-Gooavg;
%Choroid
Choroiddelta = Choroidavg-Retinaavg;

%% Plot Data
%Conjunctive
    figure()
    box on
    subplot(2,2,1)
    plot(freq,Conjunctive(:,1))
    hold on
    plot(freq,BSSavg)
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    title('Sclera Trial 1')
    legend('Sclera','BSS')
    subplot(2,2,2)
    plot(freq,Conjunctive(:,2))
    hold on
    plot(freq,BSSavg)
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    title('Sclera Trial 2')
    legend('Sclera','BSS')
    subplot(2,2,3)
    plot(freq,Conjunctive(:,3))
    hold on
    plot(freq,BSSavg)
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    title('Sclera Trial 3')
    legend('Sclera','BSS')
    subplot(2,2,4)
    plot(freq,Conjunctiveavg)
    hold on
    plot(freq,BSSavg)
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    title('Sclera Trials Average')
    legend('Sclera','BSS')
    f.Units = 'normalized';
    lineWidth = 5; % Whatever you want.
    annotation('line', [0, 0], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [1, 1], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [0, 1], [0, 0], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [1, 0], [1, 1], 'LineWidth', lineWidth, 'Color', 'k');
   %Cornea
    figure()
    box on
    subplot(2,2,1)
    plot(freq,Cornea(:,1))
    hold on
    plot(freq,BSSavg)
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    title('Corneal Epithelial Surface Trial 1')
    legend('Corneal Epithelial Surface','BSS')
    subplot(2,2,2)
    plot(freq,Cornea(:,2))
    hold on
    plot(freq,BSSavg)
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    title('Corneal Epithelial Surface Trial 2')
    legend('Corneal Epithelial Surface','BSS')
    subplot(2,2,3)
    plot(freq,Cornea(:,3))
    hold on
    plot(freq,BSSavg)
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    title('Corneal Epithelial Surface Trial 3')
    legend('Corneal Epithelial Surface','BSS')
    subplot(2,2,4)
    plot(freq,Corneaavg)
    hold on
    plot(freq,BSSavg)
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    title('Corneal Epithelial Surface Trials Average')
    legend('Corneal Epithelial Surface','BSS')
%Inner Cornea
    figure()
    box on
    subplot(2,2,1)
    plot(freq,Cornea_Inner(:,1))
    hold on
    plot(freq,BSSavg)
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    title('Corneal Endothelial Surface Trial 1')
    legend('Corneal Endothelial Surface','BSS')
    subplot(2,2,2)
    plot(freq,Cornea_Inner(:,2))
    hold on
    plot(freq,BSSavg)
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    title('Corneal Endothelial Surface Trial 2')
    legend('Corneal Endothelial Surface','BSS')
    subplot(2,2,3)
    plot(freq,Cornea_Inner(:,3))
    hold on
    plot(freq,BSSavg)
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    title('Corneal Endothelial Surface Trial 3')
    legend('Corneal Endothelial Surface','BSS')
    subplot(2,2,4)
    plot(freq,Cornea_Inneravg)
    hold on
    plot(freq,BSSavg)
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    title('Corneal Endothelial Surface Trials Average')
    legend('Corneal Endothelial Surface','BSS')
%Iris
    figure()
    box on
    subplot(2,2,1)
    plot(freq,Iris(:,1))
    hold on
    plot(freq,Gelavg)
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    title('Iris Trial 1')
    legend('Iris','Gel')
    subplot(2,2,2)
    plot(freq,Iris(:,2))
    hold on
    plot(freq,Gelavg)
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    title('Iris Trial 2')
    legend('Iris','Gel')
    subplot(2,2,3)
    plot(freq,Iris(:,3))
    hold on
    plot(freq,Gelavg)
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    title('Iris Trial 3')
    legend('Iris','Gel')
    subplot(2,2,4)
    plot(freq,Irisavg)
    hold on
    plot(freq,Gelavg)
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    title('Iris Trials Average')
    legend('Iris','Gel')
%Lens
    figure()
    box on
    subplot(2,2,1)
    plot(freq,Lens(:,1))
    hold on
    plot(freq,Gelavg)
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    title('Lens Trial 1')
    legend('Lens','Gel')
    subplot(2,2,2)
    plot(freq,Lens(:,2))
    hold on
    plot(freq,Gelavg)
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    title('Lens Trial 2')
    legend('Lens','Gel')
    subplot(2,2,3)
    plot(freq,Lens(:,3))
    hold on
    plot(freq,Gelavg)
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    title('Lens Trial 3')
    legend('Lens','Gel')
    subplot(2,2,4)
    plot(freq,Lensavg)
    hold on
    plot(freq,Gelavg)
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    title('Lens Trials Average')
    legend('Lens','Gel')
%Retina
    figure()
    box on
    subplot(2,2,1)
    plot(freq,Retina(:,1))
    hold on
    plot(freq,Gooavg)
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    title('Retina Trial 1')
    legend('Retina','Goo')
    subplot(2,2,2)
    plot(freq,Retina(:,2))
    hold on
    plot(freq,Gooavg)
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    title('Retina Trial 2')
    legend('Retina','Goo')
    subplot(2,2,3)
    plot(freq,Retina(:,3))
    hold on
    plot(freq,Gooavg)
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    title('Retina Trial 3')
    legend('Retina','Goo')
    subplot(2,2,4)
    plot(freq,Retinaavg)
    hold on
    plot(freq,Gooavg)
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    title('Retina Trials Average')
    legend('Retina','Goo')
%Choroid
    figure()
    box on
    subplot(2,2,1)
    plot(freq,Choroid(:,1))
    hold on
    plot(freq,Retinaavg)
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    title('Choroid Trial 1')
    legend('Choroid','Retina')
    subplot(2,2,2)
    plot(freq,Choroid(:,2))
    hold on
    plot(freq,Retinaavg)
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    title('Choroid Trial 2')
    legend('Choroid','Retina')
    subplot(2,2,3)
    plot(freq,Choroid(:,3))
    hold on
    plot(freq,Retinaavg)
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    title('Choroid Trial 3')
    legend('Choroid','Retina')
    subplot(2,2,4)
    plot(freq,Choroidavg)
    hold on
    plot(freq,Retinaavg)
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    title('Choroid Trials Average')
    legend('Choroid','Retina')
%Deltas
    figure()
    box on
    % set(gcf, 'Position', [100, 100, 1000, 500])
    % subplot(2,2,1)
    plot(freq,Conjunctivedelta,'LineWidth',2)
    hold on
    plot(freq,Corneadelta,'LineWidth',2)
    plot(freq,Cornea_Innerdelta,'LineWidth',2)
    xline(5,'--','LineWidth',1)
    xline(50,'--','LineWidth',1)
    xline(100,'--','LineWidth',1)
    xline(900,'--','LineWidth',1)
    hold off
    title('BSS Baseline')
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    legend('Sclera','Corneal Epithelial Surface','Corneal Endothelial Surface','5 kHz','50 kHz','100 kHz','900 kHz')
    lineWidth = 2; % Whatever you want.
    annotation('line', [0, 0], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [1, 1], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [0, 1], [0, 0], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [1, 0], [1, 1], 'LineWidth', lineWidth, 'Color', 'k');
    % legend('Sclera','Cornea','Inner Cornea','50 kHz','100 kHz','900 kHz')
    % subplot(2,2,2)
    figure()
    box on
    plot(freq,Irisdelta,'LineWidth',2)
    hold on
    plot(freq,Lensdelta,'LineWidth',2)
    xline(5,'--','LineWidth',1)
    xline(50,'--','LineWidth',1)
    xline(100,'--','LineWidth',1)
    xline(900,'--','LineWidth',1)
    hold off
    title('Gel Baseline')
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    legend('Iris','Lens','5 kHz','50 kHz','100 kHz','900 kHz')
    % legend('Iris','Lens','50 kHz','100 kHz','900 kHz')
    % subplot(2,2,3)
    figure()
    box on
    plot(freq,Retinadelta,'LineWidth',2)
    xline(5,'--','LineWidth',1)
    xline(50,'--','LineWidth',1)
    xline(100,'--','LineWidth',1)
    xline(900,'--','LineWidth',1)
    xlabel('Frequency (kHz)')
    ylabel('Impedance (kOhms)')
    title('Goo Baseline')
    legend('Retina','5 kHz','50 kHz','100 kHz','900 kHz')
    % legend('Retina','50 kHz','100 kHz','900 kHz')
    % subplot(2,2,4)
    figure()
    box on
    plot(freq,Choroiddelta,'LineWidth',2)
    xline(5,'--','LineWidth',1)
    xline(50,'--','LineWidth',1)
    xline(100,'--','LineWidth',1)
    xline(900,'--','LineWidth',1)
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    title('Retina Baseline')
    legend('Choroid','5 kHz','50 kHz','100 kHz','900 kHz')
    % legend('Choroid','50 kHz','100 kHz','900 kHz')

%% Table
%Interpolate
    %Sample Points
    sample = [5,50,100,900];
    % sample = [50,100,900];
    %BSS
    % Conjunctivesamp = interp1(freq,Conjunctivedelta,sample)';
    % Corneasamp = interp1(freq,Corneadelta,sample)';
    % Cornea_Innersamp = interp1(freq,Cornea_Innerdelta,sample)';
    Conjunctivesamp = interp1(freq,Conjunctiveavg,sample)';
    Corneasamp = interp1(freq,Corneaavg,sample)';
    Cornea_Innersamp = interp1(freq,Cornea_Inneravg,sample)';
    %Gel
    % Irissamp = interp1(freq,Irisdelta,sample)';
    % Lenssamp = interp1(freq,Lensdelta,sample)';
    Irissamp = interp1(freq,Irisavg,sample)';
    Lenssamp = interp1(freq,Lensavg,sample)';
    %Goo
    % Retinasamp = interp1(freq,Retinadelta,sample)';
    Retinasamp = interp1(freq,Retinaavg,sample)';
    %Retina
    % Choroidsamp = interp1(freq,Choroiddelta,sample)';
    Choroidsamp = interp1(freq,Choroidavg,sample)';
%Entabultate
    BSSSamples = table(categorical({'5';'50';'100';'900'}),Conjunctivesamp,Corneasamp,Cornea_Innersamp,'VariableNames',{'Sample Frequency (kHz)','Conjunctiva (kOhms)','Corneal Epithelial Surface (kOhms)','Corneal Endothelial Surface (kOhms)'});
    % BSSSamples = table(categorical({'50';'100';'900'}),Conjunctivesamp,Corneasamp,Cornea_Innersamp,'VariableNames',{'Sample Frequency (kHz)','Conjunctiva (kOhms)','Outer Cornea (kOhms)','Inner Cornea (kOhms)'});
    BSSBase = table(BSSSamples,'VariableNames',{'BSS Baseline'});
    GelSamples = table(categorical({'5';'50';'100';'900'}),Irissamp,Lenssamp,'VariableNames',{'Sample Frequency (kHz)','Iris (kOhms)','Lens (kOhms)'});
    % GelSamples = table(categorical({'50';'100';'900'}),Irissamp,Lenssamp,'VariableNames',{'Sample Frequency (kHz)','Iris (kOhms)','Lens (kOhms)'});
    GelBase = table(GelSamples,'VariableNames',{'Gel Baseline'});
    GooSamples = table(categorical({'5';'50';'100';'900'}),Retinasamp,'VariableNames',{'Sample Frequency (kHz)','Retina (kOhms)'});
    % GooSamples = table(categorical({'50';'100';'900'}),Retinasamp,'VariableNames',{'Sample Frequency (kHz)','Retina (kOhms)'});
    GooBase = table(GooSamples,'VariableNames',{'Goo Baseline'});
    RetinaSamples = table(categorical({'5';'50';'100';'900'}),Choroidsamp,'VariableNames',{'Sample Frequency (kHz)','Choroid (kOhms)'});
    % RetinaSamples = table(categorical({'50';'100';'900'}),Choroidsamp,'VariableNames',{'Sample Frequency (kHz)','Choroid (kOhms)'});
    RetinaBase = table(RetinaSamples,'VariableNames',{'Retina Baseline'});
% %Plot Tables
%     figure()
%     set(gcf, 'Position', [100, 100, 1000, 500])
%     subplot(2,2,1)
%     plot(BSSSamples,"Sample Frequency (kHz)",["Conjunctiva (kOhms)","Outer Cornea (kOhms)","Inner Cornea (kOhms)"])
%     legend

%% Create Bandgaps

freqline = [5,900];
% Cornealine = [Corneasamp(1),Corneasamp(4)];
% Cornea_Innerline = [Cornea_Innersamp(1),Cornea_Innersamp(4)];
% Irisline = [Irissamp(1)-3*var(Irissamp),Irissamp(4)+3*var(Irissamp)];
% Lensline = [Lenssamp(1)+3*var(Lenssamp),Lenssamp(4)-3*var(Lenssamp)];
% Retinaline = [Retinasamp(1)+3*var(Retinasamp),Retinasamp(4)-3*var(Retinasamp)];
% Choroidline = [Choroidsamp(1)+3*var(Choroidsamp),Choroidsamp(4)-3*var(Choroidsamp)];
Corneafit = fitdist(Corneasamp,'Normal');
Corneaci = paramci(Corneafit);
Corneaerr = Corneaci(:,2)'
Corneamu = Corneaci(:,1)'
Cornealine = [Corneamu(1)-2*var(Corneasamp),Corneamu(2)+2*var(Corneasamp)]
% Cornealine = [Corneamu(1)-2*Corneaerr(2),Corneamu(2)+2*Corneaerr(2)]
Cornea_Innerfit = fitdist(Cornea_Innersamp,'Normal');
Cornea_Innerci = paramci(Cornea_Innerfit);
Cornea_Innererr = Cornea_Innerci(:,2)'
Cornea_Innermu = Cornea_Innerci(:,1)'
Cornea_Innerline = [Cornea_Innermu(1)-2*var(Cornea_Innersamp),Cornea_Innermu(2)+2*var(Cornea_Innersamp)]
% Cornea_Innerline = [Cornea_Innermu(1)-2*Cornea_Innererr(2),Cornea_Innermu(2)+2*Cornea_Innererr(2)]
Irisfit = fitdist(Irissamp,'Normal');
Irisci = paramci(Irisfit);
Iriserr = Irisci(:,2)'
Irismu = Irisci(:,1)'
Irisline = [Irismu(1)-2*var(Irissamp),Irismu(2)+2*var(Irissamp)]
% Irisline = [Irismu(1)-2*Iriserr(2),Irismu(2)+2*Iriserr(2)]
Lensfit = fitdist(Lenssamp,'Normal');
Lensci = paramci(Lensfit);
Lenserr = Lensci(:,2)'
Lensmu = Lensci(:,1)'
Lensline = [Lensmu(1)-2*var(Lenssamp),Lensmu(2)+2*var(Lenssamp)]
% Lensline = [Lensmu(1)-2*Lenserr(2),Lensmu(2)+2*Lenserr(2)]
Retinafit = fitdist(Retinasamp,'Normal');
Retinaci = paramci(Retinafit);
Retinaerr = Retinaci(:,2)'
Retinamu = Retinaci(:,1)'
Retinaline = [Retinamu(1)-2*var(Retinasamp),Retinamu(2)+2*var(Retinasamp)]
% Retinaline = [Retinamu(1)-2*Retinaerr(2),Retinamu(2)+2*Retinaerr(2)]
Choroidfit = fitdist(Choroidsamp,'Normal');
Choroidci = paramci(Choroidfit);
Choroiderr = Choroidci(:,2)'
Choroidmu = Choroidci(:,1)'
Choroidline = [Choroidmu(1)-2*var(Choroidsamp),Choroidmu(2)+2*var(Choroidsamp)]
% Choroidline = [Choroidmu(1)-2*Choroiderr(2),Choroidmu(2)+2*Choroiderr(2)]
Conjfit = fitdist(Conjunctivesamp,'Normal');
Conjci = paramci(Conjfit);
Conjerr = Conjci(:,2)'
Conjmu = Conjci(:,1)'
Conjline = [Conjmu(1)-2*var(Conjunctivesamp),Conjmu(2)+2*var(Conjunctivesamp)]
Conjline = [Conjmu(1)-2*Conjerr(2),Conjmu(2)+2*Conjerr(2)]

figure()
box on
plot(freqline,Cornealine)
hold on
plot(freqline,Irisline)
% plot(freqline,Lensline)
plot(freqline,Retinaline)
plot(freqline,Choroidline)
% plot(freqline,Conjline)
hold off
title("Expected Tissue Bio-Impedance Bandgaps")
xlabel("Frequency (kHz)")
ylabel("Bio-Impedance (kOhms)")
legend("Cornea","Iris","Retina","Choroid")
lineWidth = 2; % Whatever you want.
annotation('line', [0, 0], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
annotation('line', [1, 1], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
annotation('line', [0, 1], [0, 0], 'LineWidth', lineWidth, 'Color', 'k');
annotation('line', [1, 0], [1, 1], 'LineWidth', lineWidth, 'Color', 'k');

%% Save Figures
FolderName = ('C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Figures');   % using my directory
FigList = findobj(allchild(0), 'flat', 'Type', 'figure');
for iFig = 1:length(FigList)
  FigHandle = FigList(iFig);
  FigName   = num2str(get(FigHandle, 'Number'));
  set(0, 'CurrentFigure', FigHandle);
  saveas(FigHandle, fullfile(FolderName,strcat(FigName, '.png'))); % specify the full path
end