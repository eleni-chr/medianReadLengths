function meadianReadLengths
%% Function written by Eleni Christoforidou in MATLAB R2019b.

%This function creates a histogram of read lengths before filtering out low
%basecall quality reads. The x-axis scale is logarithmic.

%The function requires a TXT file for each sample, containing basecall
%quality scores in column 1 and read lengths in column 2. The data must be
%tab-delimited. No headers are allowed.

%Run this function from inside the folder containing the TXT files. No
%subfolders are allowed.

%IMPORTANT: This function creates a plot for 6 samples. A lot of things are
%hardcoded so this code will need to be modified for use with new samples.

%INPUT ARGUMENTS: None.

%OUTPUT ARGUMENTS: The median read length and the (rounded) mean read 
%length for each sample is printed.

%%
%Find files to work with.
D=dir('NanoPlot*.txt');

%Load data.
for ii=1:length(D)
    fname=D(ii).name;
    data=readmatrix(fname); %load data.
    lengths=data(:,4); %get read lengths (column 4 if alignment was with minimap2, or column 2 if alignment was with Guppy).
    med=median(lengths); %calculate the median read length for the current sample.
    m=round(mean(lengths)); %calculate the mean read length for the current sample.
    fprintf('Sample %d: median = %d, mean (rounded) = %d\n',ii,med,m);
end
end