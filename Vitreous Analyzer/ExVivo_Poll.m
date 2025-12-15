function [PollValues,PollValueAvgs,PollValueAvgs_avg,PollValueSTDs,PollValueSTDs_avg,Poll_max,Poll_min,Poll_75,Poll_25,H_values,P_values] = ExVivo_Poll(Substance,freq,poll)
    freq_interp = freq(1):5:freq(length(freq));
    Substance_interp = interp1(freq,Substance,freq_interp);

    poll_indx = zeros(1,length(poll));
    for i = 1:length(poll)
        poll_indx(i) = find(freq_interp==poll(i));
    end
    
    Pollvalues = zeros(length(poll),width(Substance));
    for i = 1:length(poll)
        Pollvalues(i,:) = Substance_interp(poll_indx(i),:);
    end
    PollValues = Pollvalues;

    PollValueavgs = zeros(length(poll),width(Substance)/3);
    PollValueSTDs = zeros(length(poll),width(Substance)/3);
    p_values = zeros(length(poll),1);
    h_values = zeros(length(poll),1);
    for i = 1:width(Substance)/3
        PollValue_avg = mean(Pollvalues(:,3*(i-1)+1:3*(i-1)+3),2);
        PollValueavgs(:,i) = PollValue_avg;

        PollValueVect = Pollvalues(:,3*(i-1)+1:3*(i-1)+3);
        PollValue_STD = std(PollValueVect,0,2);
        PollValueSTDs(:,i) = PollValue_STD;
    end
    PollValueavgs_avg = mean(PollValueavgs,2);
    PollValueSTDs_avg = mean(PollValueSTDs,2);
    for i = 1:length(poll)
        [h_values(i),p_values(i)] = ttest(Pollvalues(:,i));
    end

    % [h_values,p_values] = ttest

    PollValueAvgs = PollValueavgs;
    PollValueAvgs_avg = PollValueavgs_avg;
    Poll_max = max(PollValueAvgs,[],2);
    Poll_min = min(PollValueAvgs,[],2);
    Poll_75 = quantile(PollValueAvgs,.75,2);
    Poll_25 = quantile(PollValueAvgs,.25,2);
    H_values = h_values;
    P_values = p_values;
end