function J = jacobian(g, w0, delta)
    num_outputs = length(g(w0));
    num_params = length(w0);
    J = zeros(num_outputs, num_params);
    
    for i = 1:length(w0)
        w = w0;
        w(i) = w0(i) * (1 + delta);
        J(:, i) = (g(w) - g(w0)) / (delta * w0(i));
    end
end
