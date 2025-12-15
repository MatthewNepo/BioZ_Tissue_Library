function f = InVitroDataPlot(substance,substance_name,Substance,Substance_sampleavgs,Substance_sampleavgs_avg,freq)
    substance = num2str(substance);
    substance_name = num2str(substance_name);
    % f = figure();
    box on
    subplot(2,2,1)
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
    legend('Trial 1','Trial 2','Trial 3','Trial Average')
    subplot(2,2,2)
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
    legend('Trial 1','Trial 2','Trial 3','Trial Average')
    subplot(2,2,3)
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
    legend('Trial 1','Trial 2','Trial 3','Trial Average')
    subplot(2,2,4)
    plot(freq,Substance_sampleavgs(:,1))
    hold on
    plot(freq,Substance_sampleavgs(:,2))
    plot(freq,Substance_sampleavgs(:,3))
    plot(freq,Substance_sampleavgs_avg(:))
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    Title = [substance_name ': Sample Averages'];
    title(Title)
    legend('Sample 1','Sample 2','Sample 3','Sample Average')
    x0 = 250; y0 = 100; width = 800; height = 500;
    set(gcf,'position',[x0,y0,width,height])
    f.Units = 'normalized';
    lineWidth = 5; % Whatever you want.
    annotation('line', [0, 0], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [1, 1], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [0, 1], [0, 0], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [1, 0], [1, 1], 'LineWidth', lineWidth, 'Color', 'k');
end