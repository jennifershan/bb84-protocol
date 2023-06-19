clear;

eve_listening = 0;

% create what will become the key
key_length = 20;
key_starter = create_key_starter(key_length); 

% choose random measurement bases for alice and bob
alice_bases = create_key_starter(key_length);
bob_bases = create_key_starter(key_length);

if ~eve_listening
    % rotate alice's qubits when she sends
    % rotate bob's qubits when he receives
    bob_result = send_to_receive(alice_bases, bob_bases, key_starter);
    
    % alice and bob publicly compare to create key
    alice_key = comp_bases(alice_bases, bob_bases, key_starter);
    bob_key = comp_bases(alice_bases, bob_bases, bob_result);
    
    fprintf('%s', string(alice_key));
    fprintf('\n');
    fprintf('%s', string(bob_key));
    fprintf('\n');
    fprintf(string(isequal(alice_key, bob_key))); % they are the same
    fprintf('\n\n');

elseif eve_listening
    % choose random measurement basis for eve
    eve_bases = create_key_starter(key_length);

    % rotate alice's qubits when she sends
    % rotate eve's qubits when she receives
    eve_result = send_to_receive(alice_bases, eve_bases, key_starter);
    
    % eve passes on qubits to bob
    bob_result = receive_intercept_eve(bob_bases, eve_result);
    
    % alice and bob publicly compare to create key
    alice_key = comp_bases(alice_bases, bob_bases, key_starter);
    bob_key = comp_bases(alice_bases, bob_bases, bob_result);
    
    fprintf('%s', string(alice_key));
    fprintf('\n');
    fprintf('%s', string(bob_key));
    fprintf('\n');
    fprintf(string(isequal(alice_key, bob_key))); % they are not the same (depends)
    fprintf('\n\n');
end