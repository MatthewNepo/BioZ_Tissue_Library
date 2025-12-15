function [Sub,Sub_sampleavgs,Sub_sampleavgs_avg,Sub_excluded,Sub_excluded_count,Sub_included,Sub_included_count,Sub_sampleavgs_included,Sub_sampleavgs_avg_included,Sub_mean,Sub_std,Age_filtered,Age_filtered_num] = ExVivoData_opt_filter(substance,date,sample_num,age,age_num)
    substance = num2str(substance);
    date = num2str(date);
    Substance = zeros(201,3*sample_num);
    Substance_check = zeros(1,sample_num);

    for i = 1:sample_num
        i_string = num2str(i);
        S_T1 = ['C:\Users\nnmne\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\' date '\' substance '_S' i_string '_T1.csv'];
        Substance_T1 = readmatrix(S_T1);
        S_T2 = ['C:\Users\nnmne\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\' date '\' substance '_S' i_string '_T2.csv'];
        Substance_T2 = readmatrix(S_T2);
        S_T3 = ['C:\Users\nnmne\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\' date '\' substance '_S' i_string '_T3.csv'];
        Substance_T3 = readmatrix(S_T3);

        Substance(:,3*(i-1)+1) = Substance_T1(:,1);
        Substance(:,3*(i-1)+2) = Substance_T2(:,1);
        Substance(:,3*(i-1)+3) = Substance_T3(:,1);
    end

    Substance = Substance./1000;

    %Beginning of Filter
    for i = 1:sample_num
        Substance_check(i) =  mean(Substance(1,3*(i-1)+1:3*(i-1)+3));
    end
    Substance_check_std = std(Substance_check);
    Substance_Outlier_Indx1 = Substance_check>(mean(Substance_check)+(2*Substance_check_std));
    Substance_Outlier_Indx2 = Substance_check<(mean(Substance_check)-(2*Substance_check_std));
    Substance_Outlier_Indx = or(Substance_Outlier_Indx1,Substance_Outlier_Indx2);
    Substance_Inlier_Check1 = Substance_check<(mean(Substance_check)+(2*Substance_check_std));
    Substance_Inlier_Check2 = Substance_check>(mean(Substance_check)-(2*Substance_check_std));
    Substance_Inlier_Check = and(Substance_Inlier_Check1,Substance_Inlier_Check2);
    Substance_Inlier_Indx = find(Substance_Inlier_Check);
    ExcludedSamples = find(Substance_Outlier_Indx);
    ExcludedSamples_count = sum(Substance_Outlier_Indx(:) == 1);
    IncludedSamples_count = sample_num - ExcludedSamples_count;
    IncludedSamples = zeros(201,3*IncludedSamples_count);
    age_filter = zeros(IncludedSamples_count,6);
    age_filter_num = zeros(1,IncludedSamples_count);
    for i = 1:IncludedSamples_count
        IncludedSamples(:,3*(i-1)+1) = Substance(:,3*(Substance_Inlier_Indx(i)-1)+1);
        IncludedSamples(:,3*(i-1)+2) = Substance(:,3*(Substance_Inlier_Indx(i)-1)+2);
        IncludedSamples(:,3*(i-1)+3) = Substance(:,3*(Substance_Inlier_Indx(i)-1)+3);
        Substance_Inlier_Indx(i)
        age_filter(i,:) = age(Substance_Inlier_Indx(i),:);
        age_filter_num(i) = age_num(Substance_Inlier_Indx(i));
    end
    %End of Filter

    Substance_avgs = zeros(sample_num,201);
    Substance_avgs_included = zeros(IncludedSamples_count,201);

    for i = 1:sample_num
        Substance_avg = mean(Substance(:,3*(i-1)+1:3*(i-1)+3),2);
        Substance_avgs(i,:) = Substance_avg;
    end

    Substance_avgs_avg = mean(Substance_avgs);

    for i = 1:IncludedSamples_count
        Substance_avg_included = mean(IncludedSamples(:,3*(i-1)+1:3*(i-1)+3),2);
        Substance_avgs_included(i,:) = Substance_avg_included;
    end

    Substance_avgs_avg_included = mean(Substance_avgs_included);

    Sub = Substance;
    Sub_included = IncludedSamples;
    Sub_included_count = IncludedSamples_count;
    Sub_sampleavgs_included = Substance_avgs_included;
    Sub_sampleavgs_avg_included = Substance_avgs_avg_included;
    Sub_sampleavgs = Substance_avgs;
    Sub_sampleavgs_avg = Substance_avgs_avg;
    Sub_excluded = ExcludedSamples;
    Sub_excluded_count = ExcludedSamples_count;
    Sub_mean = mean(Substance_check);
    Sub_std = Substance_check_std;
    Age_filtered = age_filter;
    Age_filtered_num = age_filter_num;
end