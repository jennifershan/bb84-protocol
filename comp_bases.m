function key = comp_bases(alice_bases, bob_bases, reference)
    key = [];
    for i = 1:length(alice_bases)
        if alice_bases(i) == bob_bases(i)
            key = [key reference(i)];
        end
    end
end