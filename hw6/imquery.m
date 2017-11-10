function [ score ] = imquery( qHist, dbHist )

[row, col] = size(qHist);
qSize = row * col;

[row, col] = size(dbHist);
dbSize = row * col;

s = 0;
for i = 1:col
    s = s + min(qHist(i) * qSize, dbHist(i) * dbSize);
end

score = s / min(qSize, dbSize);
score = score / 256;

end

