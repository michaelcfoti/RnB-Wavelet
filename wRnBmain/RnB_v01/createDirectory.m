function ensureDirectoryExists(directory)
    if isfolder(directory)
        fprintf('Directory "%s" already exists.\n', directory);
    else
        mkdir(directory);
    end
end