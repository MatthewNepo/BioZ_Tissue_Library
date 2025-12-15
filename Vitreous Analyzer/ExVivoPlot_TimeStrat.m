function [fig1,fig2,p_values] = ExVivoPlot_TimeStrat(Substance_name,Substance,Substance_sampleavgs,age_num,sample_num)
    Age_Titles = linspace(0,120,25); Ages = zeros(3*sample_num,201); Substance_x_line = Age_Titles; Substance_for_p_1 = zeros(3*sample_num,201); Substance_for_p_2 = zeros(3*sample_num,201); Substance_for_p_3 = zeros(3*sample_num,201); Substance_for_p_4 = zeros(3*sample_num,201);
    ages = age_num; h_values = zeros(1,1); p_values = zeros(1,1);

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
            xlabel('Time (Hours)')
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
        if age_num(i) < 49
           Substance_for_p_1(3*(i-1)+1,:) = Substance(:,3*(i-1)+1);
           Substance_for_p_1(3*(i-1)+2,:) = Substance(:,3*(i-1)+2);
           Substance_for_p_1(3*(i-1)+3,:) = Substance(:,3*(i-1)+3);
        end
        %if 49 > age_num(i) >= 25
           %Substance_for_p_2(3*(i-1)+1,:) = Substance(:,3*(i-1)+1);
           %Substance_for_p_2(3*(i-1)+2,:) = Substance(:,3*(i-1)+2);
           %Substance_for_p_2(3*(i-1)+3,:) = Substance(:,3*(i-1)+3);
        %end
        %if 73 > age_num(i) >= 49
        %   Substance_for_p_3(3*(i-1)+1,:) = Substance(:,3*(i-1)+1);
         %  Substance_for_p_3(3*(i-1)+2,:) = Substance(:,3*(i-1)+2);
        %   Substance_for_p_3(3*(i-1)+3,:) = Substance(:,3*(i-1)+3);
        %end
        if age_num(i) >= 49
           Substance_for_p_4(3*(i-1)+1,:) = Substance(:,3*(i-1)+1);
           Substance_for_p_4(3*(i-1)+2,:) = Substance(:,3*(i-1)+2);
           Substance_for_p_4(3*(i-1)+3,:) = Substance(:,3*(i-1)+3);
        end
    end
    
    Substance_for_p_1_NonZeroRows = any(Substance_for_p_1,2);
    Substance_for_p_1_clean = Substance_for_p_1(Substance_for_p_1_NonZeroRows,:);
    Substance_for_p_4_NonZeroRows = any(Substance_for_p_4,2);
    Substance_for_p_4_clean = Substance_for_p_4(Substance_for_p_4_NonZeroRows,:);
    

    Substance_for_p_1_ave = mean(Substance_for_p_1_clean);
    Substance_for_p_1_ave_ave = mean(Substance_for_p_1_ave)
    %for i = 1:length(Substance_for_p_1_ave)
    %    if sqrt(abs(Substance_for_p_1_ave(i)-Substance_for_p_1_ave_ave)) > std(Substance_for_p_1_ave)
    %        Substance_for_p_1_ave(i) = Substance_for_p_1_ave_ave;
    %    end
    %end
    %Substance_for_p_1_ave_ave = mean(Substance_for_p_1_ave)
    %Substance_for_p_2_ave = mean(Substance_for_p_2);
    %Substance_for_p_3_ave = mean(Substance_for_p_3);
    Substance_for_p_4_ave = mean(Substance_for_p_4_clean);
    Substance_for_p_4_ave_ave = mean(Substance_for_p_4_ave)
    %for i = 1:length(Substance_for_p_4_ave)
    %    if sqrt(abs(Substance_for_p_4_ave(i)-Substance_for_p_4_ave_ave)) > std(Substance_for_p_4_ave)
    %        Substance_for_p_4_ave(i) = Substance_for_p_4_ave_ave;
    %    end
    %end
    %Substance_for_p_4_ave_ave = mean(Substance_for_p_4_ave)
    
    %[h_values(1), p_values(1)] = ttest2(Substance_for_p_1_ave,Substance_for_p_2_ave);
    %[h_values(2), p_values(2)] = ttest2(Substance_for_p_1_ave,Substance_for_p_3_ave);
    [h_values, p_values, ci, stats] = ttest2(Substance_for_p_1_ave,Substance_for_p_4_ave);
    %[h_values(4), p_values(4)] = ttest2(Substance_for_p_2_ave,Substance_for_p_3_ave);
    %[h_values(5), p_values(5)] = ttest2(Substance_for_p_2_ave,Substance_for_p_4_ave);
    %[h_values(6), p_values(6)] = ttest2(Substance_for_p_3_ave,Substance_for_p_4_ave);


end