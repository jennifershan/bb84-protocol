function receiver_result = send_to_receive(sender_bases, receiver_bases, key_starter)
    % use with generic sender and receiver
    receiver_result = [];
    for i = 1:length(key_starter)
        qubit = key_starter(i);
        if key_starter(i) > 0
            qubit = pauli_x(qubit);
        end
        if sender_bases(i) > 0
            if qubit == 0
                qubit = hadamard([1; 0]);
            elseif qubit == 1
                qubit = hadamard([0; 1]);
            else
                qubit = hadamard(qubit);
            end
        %{
        else
            if qubit == 0
                qubit = pauli_z([1; 0]);
            elseif qubit == 1
                qubit = pauli_z([0; 1]);
            else
                qubit = pauli_z(qubit);
            end
        %}
        end
        if receiver_bases(i) > 0
            if qubit == 0
                qubit = hadamard([1; 0]);
            elseif qubit == 1
                qubit = hadamard([0; 1]);
            else
                qubit = hadamard(qubit);
            end
        %{
        else
            if qubit == 0
                qubit = pauli_z([1; 0]);
            elseif qubit == 1
                qubit = pauli_z([0; 1]);
            else
                qubit = pauli_z(qubit);
            end
        %}
        end
        receiver_result = [receiver_result measure(qubit)];
    end    
end