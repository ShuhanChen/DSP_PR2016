function sal = Refinement(y, dim)
    th_2 = graythresh(y);
    if dim == 1
        sal = y;
        sal(y<th_2) = 10*(y(y < th_2))/th_2 - 10;
        sal(y>=th_2) = 10*(y(y >= th_2) - th_2)/(1-th_2);
        sal = 1 ./ (1 + exp(-sal)) + y;
        sal = normalization(sal, 0);
    elseif dim == 2
        [r, c] = size(y);
        y_col = reshape(y,[1 r*c]);
        sal_col = y_col;
        sal_col(y_col<th_2) = 10*(y_col(y_col < th_2))/th_2 - 10;
        sal_col(y_col>=th_2) = 10*(y_col(y_col >= th_2) - th_2)/(1-th_2);
        sal_col = 1 ./ (1 + exp(-sal_col)) + y_col;
        sal = reshape(sal_col, [r c]);
    end
end

