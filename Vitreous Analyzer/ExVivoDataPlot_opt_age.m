function [fig1,fig2] = ExVivoDataPlot_opt_age(Substance_name,Substance,Substance_sampleavgs,Substance_sampleavgs_avg,freq,poll,sample_num,age,row_num,column_num,lgd_size1,lgd_size2)
    if sample_num > row_num*column_num
        fprintf('Sample number is larger than chosen sublot grid\n\n')
    else
        substance_name = num2str(Substance_name);
        
        legendCell = strcat('Sample Eye',{' '},string(num2cell(1:sample_num)),{' '},'Average');
        legendCell(sample_num+1) = 'Average of Samples';
    
        Fig_x = row_num;
        Fig_y = column_num;
    
        Title3 = [substance_name ' Sample Averages'];
    
        x0 = 150; y0 = 35; width = 1000; height = 600;
    
        fig1 = figure('Name',Substance_name);
        for i = 1:sample_num
            subplot(Fig_x,Fig_y,i)
            plot(freq,Substance(:,3*(i-1)+1))
            hold on
            plot(freq,Substance(:,3*(i-1)+2))
            plot(freq,Substance(:,3*(i-1)+3))
            plot(freq,Substance_sampleavgs(i,:))
            hold off
            xlabel('Frequency (kHz)', 'FontSize', 18)
            xticks([0,100,200,300,400,500,600,700,800,900,1000])
            ylabel('Impedance (kOhms)', 'FontSize', 18)
            Title1 = [substance_name ': Sample ' num2str(i) ' (Age: ' age(i,:) ')'];
            title(Title1, 'FontSize', 16)
            lgd1 = legend('Trial 1','Trial 2','Trial 3','Trial Average');
            lgd1.FontSize = lgd_size1;
        end
        set(gcf,'position',[x0,y0,width,height])
        fig1.Units = 'normalized';
        lineWidth = 5; % Whatever you want.
        annotation('line', [0, 0], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
        annotation('line', [1, 1], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
        annotation('line', [0, 1], [0, 0], 'LineWidth', lineWidth, 'Color', 'k');
        annotation('line', [1, 0], [1, 1], 'LineWidth', lineWidth, 'Color', 'k');
        ax = gca;
        ax.FontSize = 14;
    
        fig2 = figure('Name',Title3);
        plot(freq,Substance_sampleavgs(1,:), 'Color', 'black')
        hold on
        for i = 2:sample_num
            plot(freq,Substance_sampleavgs(i,:), 'Color', 'black')
        end
        plot(freq,Substance_sampleavgs_avg(:), 'Color', 'red')
        for i = 1:length(poll)
            xline(poll(i))
        end
        hold off
        xlabel('Frequency (kHz)', 'FontSize', 18)
        xticks([0,100,200,300,400,500,600,700,800,900,1000])
        ylabel('Impedance (kOhms)', 'FontSize', 18)
        Title2 = [substance_name ': Sample Averages'];
        title(Title2, 'FontSize', 16)
        lgd2 = legend(legendCell);
        lgd2.FontSize = lgd_size2;
        set(gcf,'position',[x0,y0,width,height])
        fig2.Units = 'normalized';
        lineWidth = 5; % Whatever you want.
        annotation('line', [0, 0], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
        annotation('line', [1, 1], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
        annotation('line', [0, 1], [0, 0], 'LineWidth', lineWidth, 'Color', 'k');
        annotation('line', [1, 0], [1, 1], 'LineWidth', lineWidth, 'Color', 'k');
        ax = gca;
        ax.FontSize = 14;
    end
end