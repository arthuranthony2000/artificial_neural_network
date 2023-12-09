function w = gradient_descent(g, w0, y, learning_rate, itermax)
    epsilon = 1e-6; 
    for i = 1:itermax
        y_estimated = g(w0);
        J = jacobian(g, w0, epsilon);
        r = y - y_estimated';
        gradient = -J' * r';
        w0 = w0 - learning_rate * gradient';
        
        if norm(gradient) < epsilon
            break;
        end
    end
    w = w0;
end
