## Tutorial

This tutorial explains how users can extract rhythmic signals using their data set. 

As an example, we use a dataset containing data from the hippocampus from the MNI-open EEG atlas (N. Ellenrieder et al., 2020).

**1. Load your dataset**

a) Set data format:

  Your data must be a `.mat` file containing the following variables, named accordingly:
  - `data_epochs`: Array in double of size: Nepochs X Nsamples
  - `fs` : sampling rate 

   The length of Nsample must be a power of 2.
   
b) Place your data in the `data` folder.

c) Open `wRnBm.m` and modify the following line of code according to the matfile you've added.

```matlab
load('***.mat');
```

**2. Parameters setting**

a) Open `wRnBm.m`

b) Modify input parameters  in the following function according to your data :

```matlab
[sR, pW] = wRnB_extract_Rhythmic_signals(data_epochs,'J', 8, 'betaScales', [1,9]);
```
Two parameters can be modified: betaScales and J, which refers to the arrhythmic signal estimation and whitening, respectively : 

`betaScales`: This parameter specifies the scales used to compute the arhythmic slope through the regression of the scales. This refers to the parameters j1 and j2 as described in article method (section 1.2).
J1 refers to the lowest scale (highest frequency), whereas j2 refers to the highest scale (lower frequency). 

Users should set this parameter based on their dataset's sampling frequency to ensure that the computation of the slope across scales avoids border effects and spurious signals across wavelet coefficients (e.g., 60Hz).

Please note that this should be determined notwhitstanding the presence of specific time-resolved oscillation, as the dominant scaling exponent is determined across all timescales (see article method for details). Nevertheless, if an oscillation is constantly present (such as a systematic artifact), it needs to be accounted for.

In our example, the slope is calculated across scales 1 to 9 with a sampling rate of 200 hz, which approximately corresponds to frequencies of 0.2-100 hz. This was chosen as our intracranial recordings were mostly free from the powerline artifact (60 Hz).

As an example, if your sampling frequency is 500 Hz, the approximate set of frequencies for different scales corresponds to the following table:

| Wavelet scales |    f1   |    f2   |
|----------------|---------|---------|
|       W1       |  125.00 |  250.00 |
|       W2       |   62.50 |  125.00 |
|       W3       |   31.25 |   62.50 |
|       W4       |   15.62 |   31.25 |
|       W5       |    7.81 |   15.62 |
|       W6       |    3.91 |    7.81 |
|       W7       |    1.95 |    3.91 |
|       W8       |    0.98 |    1.95 |
|       W9       |    0.49 |    0.98 |
|      W10       |    0.24 |    0.49 |
|      W11       |    0.12 |    0.24 |

In this case, the scales can be set from scale 4 to 9 to optimize the slope computation by avoiding the 60Hz frequency and border effects.
The only other consideration here is to choose a sufficient number of wavelet coefficients to allow a robust estimation of the beta (we recommend at least 4 scales).


`J` :  This parameter sets the highest wavelet scales for whitening the arrhythmic component starting at scale 1.

Users must set a 'J' value  lower than the logarithm base 2 of 'Nsample' of their dataset. If Nsample = 4096, then J must be lower than 12. We can avoid the highest scale (lowest frequency) as this scale contain a border effect. Indeed, in the previous table, a single epoch might contain a signle coefficient at scale 11 (0.12 to 0.24 hz)  which could also be biased by a border effect.

In our article, we set 'J' = 8, meaning that the arrhythmic component will be filtered from scale 1 up to scale number 8 (0.4 hz - 100 hz). 

**3. Execute script**

a) Execute the `wRnBm.m` script.

b) A `wRnB_results.mat` file containing rhythmic signals (Nepochs X Nsamples) and corresponding scaling exponents (1 X Nepochs) will be saved in the current folder
  
  A figure illustrating the following will be generated:
  - Average rhythmic spectrum
  - Beta distribution of the dataset
