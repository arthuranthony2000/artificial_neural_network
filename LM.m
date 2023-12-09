function w = LM(g, w0, y, lambda, itermax)
    y_estimated = g(w0);
    delta = 0.1;
    for i=1:itermax
        J = jacobian(g, w0, delta);
        dt = y - y_estimated';
        deltam=(inv(J*J' + lambda*eye(size(J*J'))))*(J*dt');
        w0 = w0 + deltam';
        y_estimated = g(w0);
    end
    w = w0;
end
