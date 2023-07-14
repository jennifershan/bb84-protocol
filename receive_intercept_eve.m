function bob_result = receive_intercept_eve(bob_bases, eve_result)
    % use when bob receives qubits after they have been intercepted by eve
    bob_result = [];
    for i = 1:length(eve_result)
        qubit = eve_result(i); 
        if bob_bases(i) > 0
            if qubit == 0
                qubit = hadamard([1; 0]);
            elseif qubit == 1
                qubit = hadamard([0; 1]);
            else
                qubit = hadamard(qubit);
            end
        end
        bob_result = [bob_result measure(qubit)];
    end
end
