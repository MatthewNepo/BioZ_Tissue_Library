function [p_values,h_values] = ExVivoPlot_TimeStrat(Substance_name,Substance,Substance_sampleavgs,age_num,sample_num)
    Age_Titles = linspace(0,4,5); Ages = zeros(3*sample_num,1); Substance_x_line = Age_Titles; 
    Substance_for_p_1 = zeros(3*sample_num,1); Substance_for_p_2 = zeros(3*sample_num,1); 
    Substance_for_p_3 = zeros(3*sample_num,1); Substance_for_p_4 = zeros(3*sample_num,1);
    Substance_for_p_5 = zeros(3*sample_num,1);
    ages = age_num; h_values = zeros(1,10); p_values = zeros(1,10);

    for i = 1:length(age_num)
        Ages(3*(i-1)+1,:) = age_num(i);
        Ages(3*(i-1)+2,:) = age_num(i);
        Ages(3*(i-1)+3,:) = age_num(i);
    end

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
    
    [h_values(1), p_values(1), ci, stats] = ttest2(Substance_for_p_1_clean,Substance_for_p_2_clean,'Alpha',0.01);
    [h_values(2), p_values(2), ci, stats] = ttest2(Substance_for_p_1_clean,Substance_for_p_3_clean,'Alpha',0.01);
    [h_values(3), p_values(3), ci, stats] = ttest2(Substance_for_p_1_clean,Substance_for_p_4_clean,'Alpha',0.01);
    [h_values(4), p_values(4), ci, stats] = ttest2(Substance_for_p_1_clean,Substance_for_p_5_clean,'Alpha',0.01);
    [h_values(5), p_values(5), ci, stats] = ttest2(Substance_for_p_2_clean,Substance_for_p_3_clean,'Alpha',0.01);
    [h_values(6), p_values(6), ci, stats] = ttest2(Substance_for_p_2_clean,Substance_for_p_4_clean,'Alpha',0.01);
    [h_values(7), p_values(7), ci, stats] = ttest2(Substance_for_p_2_clean,Substance_for_p_5_clean,'Alpha',0.01);
    [h_values(8), p_values(8), ci, stats] = ttest2(Substance_for_p_3_clean,Substance_for_p_4_clean,'Alpha',0.01);
    [h_values(9), p_values(9), ci, stats] = ttest2(Substance_for_p_3_clean,Substance_for_p_5_clean,'Alpha',0.01);
    [h_values(10), p_values(10), ci, stats] = ttest2(Substance_for_p_4_clean,Substance_for_p_5_clean,'Alpha',0.01);


end