function f = ExVivoDataPlot(substance,substance_name,Substance,Substance_sampleavgs,Substance_sampleavgs_avg,freq)
    substance = num2str(substance);
    substance_name = num2str(substance_name);
    % f = figure();
    box on
    subplot(4,2,1)
    plot(freq,Substance(:,1))
    hold on
    plot(freq,Substance(:,2))
    plot(freq,Substance(:,3))
    plot(freq,Substance_sampleavgs(:,1))
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    Title = [substance_name ': Sample 1'];
    title(Title)
    lgd = legend('Trial 1','Trial 2','Trial 3','Trial Average');
    lgd.FontSize = 4;

    subplot(4,2,2)
    plot(freq,Substance(:,4))
    hold on
    plot(freq,Substance(:,5))
    plot(freq,Substance(:,6))
    plot(freq,Substance_sampleavgs(:,2))
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    Title = [substance_name ': Sample 2'];
    title(Title)
    lgd = legend('Trial 1','Trial 2','Trial 3','Trial Average');
    lgd.FontSize = 4;

    subplot(4,2,3)
    plot(freq,Substance(:,7))
    hold on
    plot(freq,Substance(:,8))
    plot(freq,Substance(:,9))
    plot(freq,Substance_sampleavgs(:,3))
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    Title = [substance_name ': Sample 3'];
    title(Title)
    lgd = legend('Trial 1','Trial 2','Trial 3','Trial Average');
    lgd.FontSize = 4;

    subplot(4,2,4)
    plot(freq,Substance(:,10))
    hold on
    plot(freq,Substance(:,11))
    plot(freq,Substance(:,12))
    plot(freq,Substance_sampleavgs(:,4))
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    Title = [substance_name ': Sample 4'];
    title(Title)
    lgd = legend('Trial 1','Trial 2','Trial 3','Trial Average');
    lgd.FontSize = 4;

    subplot(4,2,5)
    plot(freq,Substance(:,13))
    hold on
    plot(freq,Substance(:,14))
    plot(freq,Substance(:,15))
    plot(freq,Substance_sampleavgs(:,5))
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    Title = [substance_name ': Sample 5'];
    title(Title)
    lgd = legend('Trial 1','Trial 2','Trial 3','Trial Average');
    lgd.FontSize = 4;

    subplot(4,2,6)
    plot(freq,Substance(:,16))
    hold on
    plot(freq,Substance(:,17))
    plot(freq,Substance(:,18))
    plot(freq,Substance_sampleavgs(:,6))
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    Title = [substance_name ': Sample 6'];
    title(Title)
    lgd = legend('Trial 1','Trial 2','Trial 3','Trial Average');
    lgd.FontSize = 4;

    subplot(4,2,7)
    plot(freq,Substance(:,19))
    hold on
    plot(freq,Substance(:,20))
    plot(freq,Substance(:,21))
    plot(freq,Substance_sampleavgs(:,7))
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    Title = [substance_name ': Sample 7'];
    title(Title)
    lgd = legend('Trial 1','Trial 2','Trial 3','Trial Average');
    lgd.FontSize = 4;

    subplot(4,2,8)
    plot(freq,Substance_sampleavgs(:,1))
    hold on
    plot(freq,Substance_sampleavgs(:,2))
    plot(freq,Substance_sampleavgs(:,3))
    plot(freq,Substance_sampleavgs(:,4))
    plot(freq,Substance_sampleavgs(:,5))
    plot(freq,Substance_sampleavgs(:,6))
    plot(freq,Substance_sampleavgs(:,7))
    plot(freq,Substance_sampleavgs_avg(:))
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    Title = [substance_name ': Sample Averages'];
    title(Title)
    lgd = legend('Sample 1','Sample 2','Sample 3','Sample 4','Sample 5','Sample 6','Sample 7','Sample Average');
    lgd.FontSize = 4;
    x0 = 50; y0 = 50; width = 1200; height = 600;
    set(gcf,'position',[x0,y0,width,height])
    f.Units = 'normalized';
    lineWidth = 5; % Whatever you want.
    annotation('line', [0, 0], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [1, 1], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [0, 1], [0, 0], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [1, 0], [1, 1], 'LineWidth', lineWidth, 'Color', 'k');
end