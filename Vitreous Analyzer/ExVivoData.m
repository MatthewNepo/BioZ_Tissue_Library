function Data = ExVivoData(substance,date)
    substance = num2str(substance);
    date = num2str(date);
    Substance = zeros(201,21);
    Substance_comp = zeros(201,21);

    S1_T1 = ['C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\' date '\' substance '_S1_T1.csv'];
    Substance_S1_T1 = readmatrix(S1_T1);
    S1_T2 = ['C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\' date '\' substance '_S1_T2.csv'];
    Substance_S1_T2 = readmatrix(S1_T2);
    S1_T3 = ['C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\' date '\' substance '_S1_T3.csv'];
    Substance_S1_T3 = readmatrix(S1_T3);

    S2_T1 = ['C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\' date '\' substance '_S2_T1.csv'];
    Substance_S2_T1 = readmatrix(S2_T1);
    S2_T2 = ['C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\' date '\' substance '_S2_T2.csv'];
    Substance_S2_T2 = readmatrix(S2_T2);
    S2_T3 = ['C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\' date '\' substance '_S2_T3.csv'];
    Substance_S2_T3 = readmatrix(S2_T3);

    S3_T1 = ['C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\' date '\' substance '_S3_T1.csv'];
    Substance_S3_T1 = readmatrix(S3_T1);
    S3_T2 = ['C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\' date '\' substance '_S3_T2.csv'];
    Substance_S3_T2 = readmatrix(S3_T2);
    S3_T3 = ['C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\' date '\' substance '_S3_T3.csv'];
    Substance_S3_T3 = readmatrix(S3_T3);

    S4_T1 = ['C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\' date '\' substance '_S4_T1.csv'];
    Substance_S4_T1 = readmatrix(S4_T1);
    S4_T2 = ['C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\' date '\' substance '_S4_T2.csv'];
    Substance_S4_T2 = readmatrix(S4_T2);
    S4_T3 = ['C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\' date '\' substance '_S4_T3.csv'];
    Substance_S4_T3 = readmatrix(S4_T3);

    S5_T1 = ['C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\' date '\' substance '_S5_T1.csv'];
    Substance_S5_T1 = readmatrix(S5_T1);
    S5_T2 = ['C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\' date '\' substance '_S5_T2.csv'];
    Substance_S5_T2 = readmatrix(S5_T2);
    S5_T3 = ['C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\' date '\' substance '_S5_T3.csv'];
    Substance_S5_T3 = readmatrix(S5_T3);

    S6_T1 = ['C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\' date '\' substance '_S6_T1.csv'];
    Substance_S6_T1 = readmatrix(S6_T1);
    S6_T2 = ['C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\' date '\' substance '_S6_T2.csv'];
    Substance_S6_T2 = readmatrix(S6_T2);
    S6_T3 = ['C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\' date '\' substance '_S6_T3.csv'];
    Substance_S6_T3 = readmatrix(S6_T3);

    S7_T1 = ['C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\' date '\' substance '_S7_T1.csv'];
    Substance_S7_T1 = readmatrix(S7_T1);
    S7_T2 = ['C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\' date '\' substance '_S7_T2.csv'];
    Substance_S7_T2 = readmatrix(S7_T2);
    S7_T3 = ['C:\Users\Matthew\OneDrive\Documents\Academics\Graduate School\Lab\IRISS\Biompedance\Keysight\Data\' date '\' substance '_S7_T3.csv'];
    Substance_S7_T3 = readmatrix(S7_T3);

    Substance(:,1) = Substance_S1_T1(:,1);
    Substance_comp(:,1) = Substance_S1_T1(:,2);
    Substance(:,2) = Substance_S1_T2(:,1);
    Substance_comp(:,2) = Substance_S1_T2(:,2);
    Substance(:,3) = Substance_S1_T3(:,1);
    Substance_comp(:,3) = Substance_S1_T3(:,2);

    Substance(:,4) = Substance_S2_T1(:,1);
    Substance_comp(:,4) = Substance_S2_T1(:,2);
    Substance(:,5) = Substance_S2_T2(:,1);
    Substance_comp(:,5) = Substance_S2_T2(:,2);
    Substance(:,6) = Substance_S2_T3(:,1);
    Substance_comp(:,6) = Substance_S2_T3(:,2);

    Substance(:,7) = Substance_S3_T1(:,1);
    Substance_comp(:,7) = Substance_S3_T1(:,2);
    Substance(:,8) = Substance_S3_T2(:,1);
    Substance_comp(:,8) = Substance_S3_T2(:,2);
    Substance(:,9) = Substance_S3_T3(:,1);
    Substance_comp(:,9) = Substance_S3_T3(:,2);

    Substance(:,10) = Substance_S4_T1(:,1);
    Substance_comp(:,10) = Substance_S4_T1(:,2);
    Substance(:,11) = Substance_S4_T2(:,1);
    Substance_comp(:,11) = Substance_S4_T2(:,2);
    Substance(:,12) = Substance_S4_T3(:,1);
    Substance_comp(:,12) = Substance_S4_T3(:,2);

    Substance(:,13) = Substance_S5_T1(:,1);
    Substance_comp(:,13) = Substance_S5_T1(:,2);
    Substance(:,14) = Substance_S5_T2(:,1);
    Substance_comp(:,14) = Substance_S5_T2(:,2);
    Substance(:,15) = Substance_S5_T3(:,1);
    Substance_comp(:,15) = Substance_S5_T3(:,2);

    Substance(:,16) = Substance_S6_T1(:,1);
    Substance_comp(:,16) = Substance_S6_T1(:,2);
    Substance(:,17) = Substance_S6_T2(:,1);
    Substance_comp(:,17) = Substance_S6_T2(:,2);
    Substance(:,18) = Substance_S6_T3(:,1);
    Substance_comp(:,18) = Substance_S6_T3(:,2);

    Substance(:,19) = Substance_S7_T1(:,1);
    Substance_comp(:,19) = Substance_S7_T1(:,2);
    Substance(:,20) = Substance_S7_T2(:,1);
    Substance_comp(:,20) = Substance_S7_T2(:,2);
    Substance(:,21) = Substance_S7_T3(:,1);
    Substance_comp(:,21) = Substance_S7_T3(:,2);
    
    Substance = Substance./1000;
    Substance_S1_avg = mean(Substance(:,1:3)');
    Substance_S2_avg = mean(Substance(:,4:6)');
    Substance_S3_avg = mean(Substance(:,7:9)');
    Substance_S4_avg = mean(Substance(:,10:12)');
    Substance_S5_avg = mean(Substance(:,13:15)');
    Substance_S6_avg = mean(Substance(:,16:18)');
    Substance_S7_avg = mean(Substance(:,19:21)');
    Substance_avgs = [Substance_S1_avg;Substance_S2_avg;Substance_S3_avg;Substance_S4_avg;Substance_S5_avg;Substance_S6_avg;Substance_S7_avg];
    Substance_avgs_avg = mean(Substance_avgs);
    Substance_comp_S1_avg = mean(Substance_comp(:,1:3)');
    Substance_comp_S2_avg = mean(Substance_comp(:,4:6)');
    Substance_comp_S3_avg = mean(Substance_comp(:,7:9)');
    Substance_comp_S4_avg = mean(Substance_comp(:,10:12)');
    Substance_comp_S5_avg = mean(Substance_comp(:,13:15)');
    Substance_comp_S6_avg = mean(Substance_comp(:,16:18)');
    Substance_comp_S7_avg = mean(Substance_comp(:,19:21)');
    Substance_comp_avgs = [Substance_comp_S1_avg;Substance_comp_S2_avg;Substance_comp_S3_avg;Substance_comp_S4_avg;Substance_comp_S5_avg;Substance_comp_S6_avg;Substance_comp_S7_avg];
    Substance_comp_avgs_avg = mean(Substance_comp_avgs);
    Data = {Substance,Substance_comp,Substance_avgs,Substance_comp_avgs,Substance_avgs_avg,Substance_comp_avgs_avg};
end