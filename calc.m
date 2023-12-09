function out = calc(x, w, f)
out = zeros(1, size(w, 2));
for i=1:size(w, 2)
    w_aux = zeros(1, size(x, 2));
    for j=1:size(x, 2)
        w_aux(j) = w(j, i);
    end
    out(i) = layer(x, w_aux, f);
end
end