function e = evaluate(x, w, f, y)
y_estimated = zeros(size(x, 1), 1);

for i=1:size(x, 1)
    out = x(i, :);
    for l=1:size(x, 2)
        out = calc(out, w{l}, f);
    end
    y_estimated(i) = out;
end

diff_y = y' - y_estimated;
e = mean(abs(diff_y));

end