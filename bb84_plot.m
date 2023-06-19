clear;

detected = 0;
max_key_length = 50;
trials_per_length = 1000;
for i = 1:max_key_length
    d = 0;
    for j = 1:trials_per_length
        key_starter = create_key_starter(i);
        alice_bases = create_key_starter(i);
        bob_bases = create_key_starter(i);
        eve_bases = create_key_starter(i);
        
        eve_result = send_to_receive(alice_bases, eve_bases, key_starter);
        bob_result = receive_intercept_eve(bob_bases, eve_result);
        
        alice_key = comp_bases(alice_bases, bob_bases, key_starter);
        bob_key = comp_bases(alice_bases, bob_bases, bob_result);
        
        if ~comp_keys(alice_key, bob_key)
            d = d + 1;
        end
    end
    d = 100 * (d / trials_per_length); % number of detections is averaged
    detected = [detected d]; 
end

% plot likelihood eve is detected
plot(0:max_key_length, detected)
xlabel('Key Starter Length')
ylabel('Probability of Getting Detected (%)')