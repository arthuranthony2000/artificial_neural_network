function J = jacobian(g, w0, delta)
    J = zeros(length(g(w0)), length(w0));
    for i = 1:length(w0)
        w = w0;
        w(i) = w0(i) * (1 + delta);
        J(:, i) = (g(w) - g(w0)) / (delta * w0(i));
    end
end
