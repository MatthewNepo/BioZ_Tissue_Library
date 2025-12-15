function f = ExVivoDataStats(Substance)
    sub_max = zeros(1,length(Substance));
    sub_min = zeros(1,length(Substance));
    for i = 1:length(Substance)
        sub_max(i) = max(Substance(i,:));
        sub_min(i) = min(Substance(i,:));
    end
    f = [sub_min;sub_max];
end