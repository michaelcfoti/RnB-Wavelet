function [data_epochs,fs,region] = make_status6(data_path)
data_epochs = [];
fs = 0;
region = 'my data';
    fprintf('\n    You can use your own data in a file ''My_Data''\n')
    fprintf('    to be placed %s:\n',data_path)
    fprintf('    This .mat file should contain:\n')
    fprintf('\t . data_epochs : matrix N x T of double (N epochs of T time samples)\n')
    fprintf('\t   Note: T should be a power of 2 (512, 1024, ...)\n');
    fprintf('\t . fs : samplig rate\n');

    dbs = dir([data_path filesep 'My_Data.mat']);
    if ~isempty(dbs)
        load([dbs.folder filesep dbs.name]);
        if isempty(data_epochs) || fs==0
            fprintf('    Sorry, wee found a file ...\n');
            fprintf('    but data are not compatible. Bye\n');
            return;
        else
            make_status('your data',data_epochs,fs);
        end
    end
end
