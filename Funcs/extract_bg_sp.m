function boundary_sp = extract_bg_sp0(prior,sulabel,r,c)
% function bg_sp = extract_bg_sp(sulabel,r,c) can find the label 
% for each boundary superpixels.
%
% Input: sulabel - the superpixel label for all pixels
%        r - the number of pixel rows
%        c - the number of pixel columns
%
% Output:boundary_sp - the labels for boundary superpixels
r1=unique(sulabel(1,:));

rend = prior(r,:) .* sulabel(r,:);
rend = unique(rend);

c1 = sulabel(1:end,1);
c1 = unique(c1);

cend = sulabel(1:end,c);
cend = unique(cend);

boundary_sp=[r1 rend c1' cend'];
boundary_sp = unique(boundary_sp);