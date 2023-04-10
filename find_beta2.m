% This function extracts the beta2 value of each pixel in an image. A
% selection cone is implemented which extends over 6 degrees to 175
% degrees. This is due to negative values arising due to the use of a fast
% and simple Abel inversion method. 


% MPhys Research Project 2022/23
% Ross Anderson (H00295702)



function beta2 = find_beta2(input, min, max)

theta_new = 6:175;
theta_new = theta_new';

I_pol = cart_2_polar(input', [48, 360]);

I_pol = I_pol(6:175, min:max);

I_pol(I_pol<0) = 0;

length_I_pol = size(I_pol, 2);
beta2 = zeros(1, length_I_pol);

for i = 1:length_I_pol

    ft = fittype('A*(1 + (1/2)*B*(3*cosd(x).^2 - 1))', 'independent', 'x', 'dependent', 'y' );
    opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
    warning off
    [fitresult, ~] = fit(theta_new, I_pol(:,i), ft, opts);
    warning on
    coeffvals = coeffvalues(fitresult);
    beta2(i) = coeffvals(2);
    
end

end