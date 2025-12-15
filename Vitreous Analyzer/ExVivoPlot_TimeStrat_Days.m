function [fig1,fig2,p_values,h_values] = ExVivoPlot_TimeStrat(Substance_name,Substance,Substance_sampleavgs,age_num,sample_num)
    Age_Titles = linspace(0,4,5); Ages = zeros(3*sample_num,201); Substance_x_line = Age_Titles; 
    Substance_for_p_1 = zeros(3*sample_num,201); Substance_for_p_2 = zeros(3*sample_num,201); 
    Substance_for_p_3 = zeros(3*sample_num,201); Substance_for_p_4 = zeros(3*sample_num,201);
    Substance_for_p_5 = zeros(3*sample_num,201);
    ages = age_num; h_values = zeros(1,6); p_values = zeros(1,10);

    [Substance_max_line,Substance_min_line,Substance_50_line,Substance_100_line,Substance_500_line,Substance_900_line] = ExVivo_Polyfit(Substance,Age_Titles,ages);

    for i = 1:length(age_num)
        Ages(3*(i-1)+1,:) = age_num(i);
        Ages(3*(i-1)+2,:) = age_num(i);
        Ages(3*(i-1)+3,:) = age_num(i);
    end


        substance_name = num2str(Substance_name);
        
        legendCell = strcat('Sample',{' '},string(num2cell(1:sample_num)),{' '},'Trial Average');
    
    
        Title3 = [substance_name ' Sample Averages'];
    
        x0 = 150; y0 = 35; width = 1000; height = 600;
    
        fig1 = figure('Name',Substance_name);
        hold on
        for i = 1:sample_num
            scatter(Ages(3*(i-1)+1,:),Substance(:,3*(i-1)+1))
            scatter(Ages(3*(i-1)+2,:),Substance(:,3*(i-1)+2))
            scatter(Ages(3*(i-1)+3,:),Substance(:,3*(i-1)+3))
            xlabel('Time (Days)')
            xticks(Age_Titles)
            ylabel('Impedance (kOhms)')
            Title1 = substance_name;
            title(Title1)
        end
        hold off
        set(gcf,'position',[x0,y0,width,height])
        legend(legendCell)
        fig1.Units = 'normalized';
        lineWidth = 5; % Whatever you want.
        annotation('line', [0, 0], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
        annotation('line', [1, 1], [0, 1], 'LineWidth', lineWidth, 'Color', 'k');
        annotation('line', [0, 1], [0, 0], 'LineWidth', lineWidth, 'Color', 'k');
        annotation('line', [1, 0], [1, 1], 'LineWidth', lineWidth, 'Color', 'k');
    
        fig2 = figure('Name',Title3);
        hold on
        for i = 1:sample_num
            scatter(ages(i),Substance_sampleavgs(i,:))
        end
        plot(Substance_x_line,Substance_max_line)
        plot(Substance_x_line,Substance_min_line)
        plot(Substance_x_line,Substance_50_line)
        plot(Substance_x_line,Substance_100_line)
        plot(Substance_x_line,Substance_500_line)
        plot(Substance_x_line,Substance_900_line)
        hold off
        xlabel('Time (Hours)')
        xticks(Age_Titles)
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

        %Ages

    for i = 1:length(age_num)
        if age_num(i) == 0
           Substance_for_p_1(3*(i-1)+1,:) = Substance(:,3*(i-1)+1);
           Substance_for_p_1(3*(i-1)+2,:) = Substance(:,3*(i-1)+2);
           Substance_for_p_1(3*(i-1)+3,:) = Substance(:,3*(i-1)+3);
        end
        if age_num(i) == 1
           Substance_for_p_2(3*(i-1)+1,:) = Substance(:,3*(i-1)+1);
           Substance_for_p_2(3*(i-1)+2,:) = Substance(:,3*(i-1)+2);
           Substance_for_p_2(3*(i-1)+3,:) = Substance(:,3*(i-1)+3);
        end
        if age_num(i) == 2
           Substance_for_p_3(3*(i-1)+1,:) = Substance(:,3*(i-1)+1);
           Substance_for_p_3(3*(i-1)+2,:) = Substance(:,3*(i-1)+2);
           Substance_for_p_3(3*(i-1)+3,:) = Substance(:,3*(i-1)+3);
        end
        if age_num(i) == 3
           Substance_for_p_4(3*(i-1)+1,:) = Substance(:,3*(i-1)+1);
           Substance_for_p_4(3*(i-1)+2,:) = Substance(:,3*(i-1)+2);
           Substance_for_p_4(3*(i-1)+3,:) = Substance(:,3*(i-1)+3);
        end
        if age_num(i) == 4
           Substance_for_p_5(3*(i-1)+1,:) = Substance(:,3*(i-1)+1);
           Substance_for_p_5(3*(i-1)+2,:) = Substance(:,3*(i-1)+2);
           Substance_for_p_5(3*(i-1)+3,:) = Substance(:,3*(i-1)+3);
        end
    end
    
    Substance_for_p_1_NonZeroRows = any(Substance_for_p_1,2);
    Substance_for_p_1_clean = Substance_for_p_1(Substance_for_p_1_NonZeroRows,:);
    Substance_for_p_2_NonZeroRows = any(Substance_for_p_2,2);
    Substance_for_p_2_clean = Substance_for_p_2(Substance_for_p_2_NonZeroRows,:);
    Substance_for_p_3_NonZeroRows = any(Substance_for_p_3,2);
    Substance_for_p_3_clean = Substance_for_p_3(Substance_for_p_3_NonZeroRows,:);
    Substance_for_p_4_NonZeroRows = any(Substance_for_p_4,2);
    Substance_for_p_4_clean = Substance_for_p_4(Substance_for_p_4_NonZeroRows,:);
    Substance_for_p_5_NonZeroRows = any(Substance_for_p_5,2);
    Substance_for_p_5_clean = Substance_for_p_5(Substance_for_p_5_NonZeroRows,:);
    

    Substance_for_p_1_ave = mean(Substance_for_p_1_clean);
    Substance_for_p_1_ave_ave = mean(Substance_for_p_1_ave)
    Substance_for_p_2_ave = mean(Substance_for_p_2_clean);
    Substance_for_p_2_ave_ave = mean(Substance_for_p_2_ave)
    Substance_for_p_3_ave = mean(Substance_for_p_3_clean);
    Substance_for_p_3_ave_ave = mean(Substance_for_p_3_ave)
    Substance_for_p_4_ave = mean(Substance_for_p_4_clean);
    Substance_for_p_4_ave_ave = mean(Substance_for_p_4_ave)
    Substance_for_p_5_ave = mean(Substance_for_p_5_clean);
    Substance_for_p_5_ave_ave = mean(Substance_for_p_5_ave)
    
    
    [h_values(1), p_values(1), ci, stats] = ttest2(Substance_for_p_1_ave,Substance_for_p_2_ave);
    [h_values(2), p_values(2), ci, stats] = ttest2(Substance_for_p_1_ave,Substance_for_p_3_ave);
    [h_values(3), p_values(3), ci, stats] = ttest2(Substance_for_p_1_ave,Substance_for_p_4_ave);
    [h_values(4), p_values(4), ci, stats] = ttest2(Substance_for_p_1_ave,Substance_for_p_5_ave);
    [h_values(5), p_values(5), ci, stats] = ttest2(Substance_for_p_2_ave,Substance_for_p_3_ave);
    [h_values(6), p_values(6), ci, stats] = ttest2(Substance_for_p_2_ave,Substance_for_p_4_ave);
    [h_values(7), p_values(7), ci, stats] = ttest2(Substance_for_p_2_ave,Substance_for_p_5_ave);
    [h_values(8), p_values(8), ci, stats] = ttest2(Substance_for_p_3_ave,Substance_for_p_4_ave);
    [h_values(9), p_values(9), ci, stats] = ttest2(Substance_for_p_3_ave,Substance_for_p_5_ave);
    [h_values(10), p_values(10), ci, stats] = ttest2(Substance_for_p_4_ave,Substance_for_p_5_ave);


end