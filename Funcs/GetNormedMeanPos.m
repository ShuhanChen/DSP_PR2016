function meanPos = GetNormedMeanPos(pixelList, height, width)
% averaged x(y) coordinates of each superpixel, normalized with respect to
% image dimension
% return N*2 vector, row i is superpixel i's coordinate [y x]

% Code Author: Wangjiang Zhu
% Email: wangjiang88119@gmail.com
% Date: 3/24/2014

spNum = length(pixelList);
meanPos = zeros(spNum, 2);
% quaterList = cell(spNum, 4);
for n = 1 : spNum
    [rows, cols] = ind2sub([height, width], pixelList{n});
    meanR = mean(rows);
    meanC = mean(cols);
    meanPos(n,1) = meanR / height;
    meanPos(n,2) = meanC / width;
    
%     temp1 = (rows <= meanR).*(cols <= meanC);
%     quaterList{n,1} = find(temp1 == 1);
%     
%     temp2 = (rows <= meanR).*(cols >= meanC);
%     quaterList{n,2} = find(temp2 == 1);
%     
%     temp3 = (rows >= meanR).*(cols <= meanC);
%     quaterList{n,3} = find(temp3 == 1);
%     
%     temp4 = (rows >= meanR).*(cols >= meanC);
%     quaterList{n,4} = find(temp4 == 1);

end