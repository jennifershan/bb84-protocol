function key_starter = create_key_starter(length)
    % generate random 0s and 1s
    key_starter = randi([0, 1], 1, length);
end