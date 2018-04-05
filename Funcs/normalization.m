function matrix = normalization(mat, flag)
% INPUT : 
%         flag:  1 denotes that the mat is a 3-d matrix;
%                0 denotes that the mat is a matrix;
%         
if flag ~= 0
    dim = size(mat,3);
    matrix = mat;
    for i = 1:dim
       matrix(:,:,i) = ( mat(:,:,i) - min(min(mat(:,:,i)))) / ( max(max(mat(:,:,i))) - min(min( mat(:,:,i))) + eps);
    end
else
    matrix = ( mat - min(min(mat)))/( max(max(mat)) - min(min(mat)) + eps);
end