function adjMatrix = GetAdjMatrix(idxImg, spNum, prior)
% Get adjacent matrix of super-pixels
% idxImg is an integer image, values in [1..spNum]

% Code Author: Wangjiang Zhu
% Email: wangjiang88119@gmail.com
% Date: 3/24/2014
[h, w] = size(idxImg);
if (nargin < 3)
    prior = zeros(h,w);
end 
%Get edge pixel locations (4-neighbor)
topbotDiff = diff(idxImg, 1, 1) ~= 0;
topEdgeIdx = find( padarray(topbotDiff, [1 0], false, 'post') ); %those pixels on the top of an edge
botEdgeIdx = topEdgeIdx + 1;

leftrightDiff = diff(idxImg, 1, 2) ~= 0;
leftEdgeIdx = find( padarray(leftrightDiff, [0 1], false, 'post') ); %those pixels on the left of an edge
rightEdgeIdx = leftEdgeIdx + h;

%Get adjacent matrix of super-pixels
adjMatrix = zeros(spNum, spNum);
adjMatrix( sub2ind([spNum, spNum], idxImg(topEdgeIdx), idxImg(botEdgeIdx)) ) = 1;
adjMatrix( sub2ind([spNum, spNum], idxImg(leftEdgeIdx), idxImg(rightEdgeIdx)) ) = 1;
adjMatrix = adjMatrix + adjMatrix';
% th = mean(prior(:));
temp = prior(h,:);
bd = unique([idxImg(1,:),idxImg(h,:).*temp,idxImg(:,1)',idxImg(:,w)']);
bd = bd(2:end);
adjMatrix(bd, bd) = 1;
adjMatrix(1:spNum+1:end) = 0;%set diagonal elements to 0
end