% This function bins the extracted beta2 value of each pixel into an averaged value over a 
% specified width of the image. The standard deviation over the averaging area is also extracted.

% MPhys Research Project 2022/23
% Ross Anderson (H00295702)



function [binned_beta2, error] = bin_beta2(input, bin_size)

binned_beta2 = zeros(1, floor(length(input)/bin_size));
error = zeros(1, floor(length(input)/bin_size));

start = 1;
finish = bin_size;

for i = 1:length(binned_beta2)

    if finish<length(input)
        binned_beta2(i) = mean(input(start:finish));
        error(i) = std(input(start:finish));
    else
    end
    
    start = start + bin_size;
    finish = finish + bin_size;

end
end