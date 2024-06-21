## Tutorial

This tutorial explain how users can extract rhytmic signals using their own data set. 

**1. Load your data set**

a) Set data format:

  Your data must be a '.mat' file contain the following variables, named accordingly:
  - data_epochs: Array in double of size : Nepochs X Nsamples
  - fs : sampling rate 

   The length of Nsample must be a power of 2.
   
b) Place your data in the data folder.

**2. Parameters setting**

a) Open `wRnBm.m`

b) Modify input paramaters in the following function according to your data :

```matlab
[sR, pW] = wRnB_extract_Rhythmic_signals(data_epochs,'alpha', 4,'J', 8, 'betaScales', [1,9]);
```
`J` :  Set the number of wavelet scales where the arhytmic component is filtered out

'J' must be lower than the logarithm base 2 of 'Nsample'

`alpha`: Controls for the amount of regularity in the signal 

`betaScales`: According to the sample frequency of your dataset, the beta slope needs to be computed within a set specific scales avoiding border effects. 

**3. Execute script**

a) Execute the `wRnBm.m` script.

b) A 'rhythmic_signal.mat' file containing rhytmic signals (Nepochs X Nsamples) and the betas for each epochs will be saved in a folder names results

  A figure illustrating the following will be generated:
  - Average rhythmic spectrum
  - Beta distribution of the dataset
