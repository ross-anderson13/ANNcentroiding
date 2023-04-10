% This function integrates an image over all angles to produce a velocity
% distribution.

% MPhys Research Project 2022/23
% Ross Anderson (H00295702)



function [integrated, integrated_interp, radii, radii_whole] = integrateim(input)

res = 96;  %200 for denoising network
x = linspace(-1,1,res);
[X, Y] = meshgrid(x);
R = sqrt(X.^2+Y.^2);

cos_theta = Y./R;
sin_theta = X./R;

%image sizes
x_dim = size(input,1);  
y_dim = size(input,2);

%centre of image
x_centre = x_dim/2;
y_centre = y_dim/2;

%multiply input by abs(R.*sin_theta) (or abs(X))
input = input.*abs(R.*sin_theta);

%make matrices with 0 in the centre row/column, increasing/decreasing as they move away
[X_centre0, Y_centre0] = meshgrid((1:x_dim)-x_centre, (1:y_dim)-y_centre);

%convert this to radial coords
R_centre0 = sqrt(X_centre0.^2+Y_centre0.^2);

%reshape this into an array
R_centre0_reshape = reshape(R_centre0, 1, []);

%sort from lowest radius to highest
[R_centre0_sorted, sorting] = sort(R_centre0_reshape);

%round this array
R_centre0_sorted_rounded = round(R_centre0_sorted);

%unique
R_centre0_sorted_unique = unique(R_centre0_sorted);

%equally reshape the intensity with the same sorting as radius
I_reshape = reshape(input, 1, []);
I_sorted = I_reshape(sorting);

%highest radius
rounded_max_radius = round(max(R_centre0_sorted));

%prepare an array to fill
integrated = zeros(1,max(rounded_max_radius)+1);

%whole numbers of radii
radii_whole = 0:max(R_centre0_sorted_rounded); 

%all radii
radii = R_centre0_sorted_unique;

%for each value of radii, find where radii are equal to this
%find the average of the values of intensity that correspond to the radii
for i = 0:max(R_centre0_sorted_rounded)
    all_same_radius = R_centre0_sorted_rounded==i;
    integrated(i+1) = mean(I_sorted(all_same_radius));
end

% for i = 1:length(R_centre0_sorted_unique)
%     radius = R_centre0_sorted_unique(i);
%     all_same_radius = R_centre0_sorted==radius;
%     integrated_long(i+1) = mean(I_sorted(all_same_radius));
% end

integrated_interp = interp1(radii_whole, integrated, radii);

end
