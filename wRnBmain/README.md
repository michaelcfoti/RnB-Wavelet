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
[sR, pW] = wRnB_extract_Rhythmic_signals(data_epochs,'alpha', 4,'J', 8, 'betaScales', [1,9]);
```
Three parameters can be modified: J, alpha and betaScales.

Here is their explanation (Also refer to eq.(4) of the article for further details ) : 

`betaScales`: This parameter specifies the scales used to compute the arhythmic slope.

In our example, the slope is calculated across scales 1 to 9.

Users should set this parameter based on their dataset's sampling frequency to ensure that the computation of the slope across scales avoids border effects and spurious signals across wavelet coefficients (e.g., 60Hz).

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

The scales can be set from scale 4 to 9 to optimize the slope computation by avoiding the 60Hz frequency and border effects.

`J` :  This parameter sets the number of wavelet scales for filtering the arrhythmic component.

In our example, we set 'J' = 8, meaning that the arrhythmic component will be filtered up to scale number 8. 

Users must set a 'J' value  lower than the logarithm base 2 of 'Nsample' of their dataset. If Nsample = 4096, then J must be lower than 12. 

`alpha`: This parameter controls for the amount of regularity (smoothness) in the signal. In this example, we set the value to 4. This parameter is unknown, but keeping it at 4 remains a suitable choice for users.

**3. Execute script**

a) Execute the `wRnBm.m` script.

b) A `wRnB_results.mat` file containing rhythmic signals (Nepochs X Nsamples) and corresponding scaling exponents (1 X Nepochs) will be saved in the current folder
  
  A figure illustrating the following will be generated:
  - Average rhythmic spectrum
  - Beta distribution of the dataset
