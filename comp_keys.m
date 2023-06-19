function keys_equal = comp_keys(alice_key, bob_key)
    % select random measured values given shared bases as eavesdropper check
    r = create_key_starter(length(alice_key));
    for i = 1:length(r)
        if r(i) == 1 && alice_key(i) ~= bob_key(i)
            keys_equal = 0;
            return;      
        end
    end
    keys_equal = 1;
end