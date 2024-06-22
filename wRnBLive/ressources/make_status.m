function make_status(region,data_epochs,fs)
fprintf('\n    You selected %s:\n',region)
fprintf('\t . %d epochs\n',size(data_epochs,1))
fprintf('\t . %d samples (%4.2f seconds @ %4.2f Hz)\n',size(data_epochs,2),size(data_epochs,2)/fs,fs);
fprintf('\t . The wRnB will take max. %2.1f minutes.\n',size(data_epochs,1)/180);
fprintf('\t . To proceed, press the next button ''wavelet-RnB'' ... and be patient ...');
end
