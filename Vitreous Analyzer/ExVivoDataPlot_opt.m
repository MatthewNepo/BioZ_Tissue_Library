function [fig1,fig2] = ExVivoDataPlot_opt(Substance_name,Substance,Substance_sampleavgs,Substance_sampleavgs_avg,freq,sample_num,row_num,column_num)
    if sample_num > row_num*column_num
        fprintf('Sample number is larger than chosen sublot grid\n\n')
    else
        substance_name = num2str(Substance_name);
        
        legendCell = strcat('Sample',{' '},string(num2cell(1:sample_num)),{' '},'Trial Average');
        legendCell(sample_num+1) = 'Average of Samples';
    
        Fig_x = row_num;
        Fig_y = column_num;
    
        Title3 = [substance_name ' Sample Averages'];
    
        x0 = 150; y0 = 35; width = 1000; height = 600;
    
        fig1 = figure('Name',Substance_name);
        for i = 1:sample_num
            subplot(Fig_x,Fig_y,i)
            plot(freq,Substance(:,3*(i-1)+1),'k')
            hold on
            plot(freq,Substance(:,3*(i-1)+2),'k')
            plot(freq,Substance(:,3*(i-1)+3),'k')
            plot(freq,Substance_sampleavgs(i,:),'r')
            hold off
            xlabel('Frequency (kHz)')
            xticks([0,100,200,300,400,500,600,700,800,900,1000])
            ylabel('Impedance (kOhms)')
            Title1 = [substance_name ': Sample ' num2str(i)];
            title(Title1)
            legend('Trial 1','Trial 2','Trial 3','Trial Average')
        end
        set(gcf,'position',[x0,y0,width,height])
        fig1.Units = 'normalized';
        lineWidth = 5; % Whatever you want.
        annotation('line', [0, 0], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
        annotation('line', [1, 1], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
        annotation('line', [0, 1], [0, 0], 'LineWidth', lineWidth, 'Color', 'k');
        annotation('line', [1, 0], [1, 1], 'LineWidth', lineWidth, 'Color', 'k');
    
        fig2 = figure('Name',Title3);
        plot(freq,Substance_sampleavgs(1,:))
        hold on
        for i = 2:sample_num
            plot(freq,Substance_sampleavgs(i,:),'k')
        end
        plot(freq,Substance_sampleavgs_avg(:),'r')
        hold off
        xlabel('Frequency (kHz)')
        xticks([0,100,200,300,400,500,600,700,800,900,1000])
        ylabel('Impedance (kOhms)')
        Title2 = [substance_name ': Sample Averages'];
        title(Title2)
        legend(legendCell)
        set(gcf,'position',[x0,y0,width,height])
        fig2.Units = 'normalized';
        lineWidth = 5; % Whatever you want.
        annotation('line', [0, 0], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
        annotation('line', [1, 1], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
        annotation('line', [0, 1], [0, 0], 'LineWidth', lineWidth, 'Color', 'k');
        annotation('line', [1, 0], [1, 1], 'LineWidth', lineWidth, 'Color', 'k');
    end
end