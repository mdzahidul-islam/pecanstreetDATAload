% to load pecanstreet data from csv file to matlab
%% data extract 3months
% this code extract three months data from three different CSV file stored
% the matlab path. The name of the file is 1min_real_june2019, 1min_real_july2019, 1min_real_aug2019 and so on.
% this code extract three colomn from pecanstreet data, 'dataid', 'localminute', 'grid'.
% I will work on the 'grid' consumption colomn.

mnth_str={'june','july','aug'};
n=0;
for i=1:length(mnth_str)
	csv_file=insertAfter('1min_real_2019','1min_real_',mnth_str{i});
	opts = detectImportOptions(csv_file);
    	preview(csv_file,opts)
	opts.SelectedVariableNames={'dataid','localminute','grid'};
	A = readtable(csv_file,opts);
	B=A;
	B.localminute=cellfun(@(x) x(1:19),B.localminute,'UniformOutput',false);
	B.localminute=datetime(B.localminute);
	m=n+1;
	n=n+size(B(:,1),1);
	act_data_19(m:n,:)=B;
end
