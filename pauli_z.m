function p_z = pauli_z(qubit)
    % makes no relevant change to |0> and |1> states
    p_z = [1 0; 0 -1] * qubit;
end