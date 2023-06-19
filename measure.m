function m = measure(qubit)
    if ~isequal(qubit, 0) && ~isequal(qubit, 1)
        m = randsrc(1, 1, [0 1; qubit(1)^2 qubit(2)^2]);
    else
        m = qubit;
    end
end