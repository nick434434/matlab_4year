function [IM, boundaries] = process_boundaries(M, k)

IM = M;
R = size(IM);
N = R(2) / k;


BW = 1 - imfill(im2bw(IM), 'holes');
BW_filled = imfill(BW, 'holes');
boundaries = bwboundaries(BW_filled);
imshow(M);
hold on;
for i = 1:numel(boundaries)
    b = boundaries{i};
    r = size(b);
    if r(1) >= 100 && r(1) < 10000
        plot(b(:,2),b(:,1),'g','LineWidth',3);
        for j = 1:r(1)
            for m = 1:N
                if b(j, 2) + m*k <= R(2)
                    IM(b(j, 1), b(j, 2) + m*k) = IM(b(j, 1), b(j, 2) + m*k) - IM(b(j, 1), b(j, 2)) / 2;
                end
                if b(j, 2) - m*k > 0
                    IM(b(j, 1), b(j, 2) - m*k) = IM(b(j, 1), b(j, 2) - m*k) - IM(b(j, 1), b(j, 2)) / 2;
                end
            end
        end
    end
end

end