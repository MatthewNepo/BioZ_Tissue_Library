function [Sub,Sub_comp,Sub_sampleavgs,Sub_comp_sampleavgs,Sub_sampleavgs_avg,Sub_comp_sampleavgs_avg] = ExVivoData_opt(substance,date,sample_num)
    substance = num2str(substance);
    date = num2str(date);
    Substance = zeros(201,3*sample_num);
    Substance_comp = zeros(201,3*sample_num);

    for i = 1:sample_num
        i_string = num2str(i);
        S_T1 = ['C:\Users\nnmne\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\' date '\' substance '_S' i_string '_T1.csv'];
        Substance_T1 = readmatrix(S_T1);
        S_T2 = ['C:\Users\nnmne\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\' date '\' substance '_S' i_string '_T2.csv'];
        Substance_T2 = readmatrix(S_T2);
        S_T3 = ['C:\Users\nnmne\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\' date '\' substance '_S' i_string '_T3.csv'];
        Substance_T3 = readmatrix(S_T3);

        Substance(:,3*(i-1)+1) = Substance_T1(:,1);
        Substance_comp(:,3*(i-1)+1) = Substance_T1(:,2);
        Substance(:,3*(i-1)+2) = Substance_T2(:,1);
        Substance_comp(:,3*(i-1)+2) = Substance_T2(:,2);
        Substance(:,3*(i-1)+3) = Substance_T3(:,1);
        Substance_comp(:,3*(i-1)+3) = Substance_T3(:,2);
    end

    Substance = Substance./1000;
    Substance_avgs = zeros(sample_num,201);
    Substance_comp_avgs = zeros(sample_num,201);

    for i = 1:sample_num
        Substance_avg = mean(Substance(:,3*(i-1)+1:3*(i-1)+3)');
        Substance_avgs(i,:) = Substance_avg;

        Substance_comp_avg = mean(Substance_comp(:,3*(i-1)+1:3*(i-1)+3)');
        Substance_comp_avgs(i,:) = Substance_comp_avg;
    end

    Substance_avgs_avg = mean(Substance_avgs);
    Substance_comp_avgs_avg = mean(Substance_comp_avgs);

    Sub = Substance;
    Sub_comp = Substance_comp;
    Sub_sampleavgs = Substance_avgs;
    Sub_comp_sampleavgs = Substance_comp_avgs;
    Sub_sampleavgs_avg = Substance_avgs_avg;
    Sub_comp_sampleavgs_avg = Substance_comp_avgs_avg;
end