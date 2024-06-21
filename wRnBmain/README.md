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

a) Open 'wRnBmain.m'

b) Modify input paramaters in the following function according to your data :

```matlab
[sR, pW] = wRnB_extract_Rhythmic_signals(data_epochs,'alpha', 4,'J', 8);
```
J :  number of wavelet decomposition scale
'J' must be lower than the logarithm base 2 of 'Nsample'

alpha: Controls for the amount of regularity in the signal 

scale: According to sample frequency of your dataset, the beta slope

**3. Excute script**

a) Excture the script.
b) A '.mat' file containing rhytmic signals be saved

The output will include a figure illustrating the following:
- Average rhythmic spectrum
- Beta distribution of the dataset
