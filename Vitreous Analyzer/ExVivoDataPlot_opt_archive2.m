function f = ExVivoDataPlot_opt_archive2(substance_name,Substance,Substance_sampleavgs,Substance_sampleavgs_avg,freq,sample_num)
    substance_name = num2str(substance_name);
    
    legendCell = strcat('Sample',{' '},string(num2cell(1:sample_num)),{' '},'Trial Average');
    legendCell(sample_num+1) = 'Average of Samples';

    remainder = rem(sample_num,3);
    column_num = ((sample_num-remainder)/3)+1;

    Fig_x = column_num;
    Fig_y = 3;

    for i = 1:sample_num
        subplot(Fig_x,Fig_y,i)
        plot(freq,Substance(:,3*(i-1)+1))
        hold on
        plot(freq,Substance(:,3*(i-1)+2))
        plot(freq,Substance(:,3*(i-1)+3))
        plot(freq,Substance_sampleavgs(i,:))
        hold off
        xlabel('Frequency (kHz)')
        xticks([0,100,200,300,400,500,600,700,800,900,1000])
        ylabel('Impedance (kOhms)')
        Title = [substance_name ': Sample ' num2str(i)];
        title(Title)
        legend('Trial 1','Trial 2','Trial 3','Trial Average')
    end

    subplot(Fig_x,Fig_y,sample_num+1)
    plot(freq,Substance_sampleavgs(1,:))
    hold on
    for i = 2:sample_num
        plot(freq,Substance_sampleavgs(i,:))
    end
    plot(freq,Substance_sampleavgs_avg(:))
    hold off
    xlabel('Frequency (kHz)')
    xticks([0,100,200,300,400,500,600,700,800,900,1000])
    ylabel('Impedance (kOhms)')
    Title = [substance_name ': Sample Averages'];
    title(Title)
    legend(legendCell)
    x0 = 150; y0 = 35; width = 1000; height = 600;
    set(gcf,'position',[x0,y0,width,height])
    f.Units = 'normalized';
    lineWidth = 5; % Whatever you want.
    annotation('line', [0, 0], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [1, 1], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [0, 1], [0, 0], 'LineWidth', lineWidth, 'Color', 'k');
    annotation('line', [1, 0], [1, 1], 'LineWidth', lineWidth, 'Color', 'k');
end