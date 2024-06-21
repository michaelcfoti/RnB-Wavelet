
# RnB-Wavelet 

## Tutorial

## Usage
This demo requires the following:
- `Dataset.mat` (Nepocs X Nsamples)
- Sampling frequency (derived from dataset)
- Specified frequency range 

As an example, the folder data contains a dataset composed of 250 scale-free temporal signals with a neural-mass peak modulated at 10Hz and a sampling frequency of 256 Hz.

The main script `RandB_demo.m` can be executed and the output will include a figure illustrating the following:
- The average standard spectrum
- The average rhythmic spectrum
- The beta distribution of the dataset

Users can upload upload their own `.mat` dataset with the corresponding sampling frequency and change the frequency range according to their analysis.
This requires few changes to the main script `RandB_demo.m`

1) Replace the name of the `.mat` dataset you want to analyze:

```matlab
% load data
load data_neural_mass.mat
```
2) Set the frenquency range :
```matlab
% frequency range 
param.frange = [2 40];
```
3) Modify the input arguments:

In our example, 'data_neural_mass.mat' is a structure containing :
- the temporal signal (s) (Nepocs X Nsamples).
- sample frequency (fs)

The first argument is the name of the array containing the temporal signal and the second is the sampling frequency. 
Modify these inputs according to your data. 

```matlab
% rhytmic spectrum
rnb = compute_rythmic(s,fs,param);
```






Run the main script ` wRnB.m `. In the command window, you will be asked to select the intracranial recordings of a specific region. The output will include a figure illustrating the following:

- Average rhythmic spectrum
- Beta distribution of the dataset

 
## File structure

- RnB_v01 : function folder 

- data: Folder containing  example data:
   - `R16_N3.mat`: Data from Ant. Cingulate (350 epochs)
   - `R18_N3.mat`: Data from Sup. Motor Cortex (300 epochs)
   - `R37_N3.mat`: Data from Sup. Front. Gyrus (350 epochs)
   - `R37_N3.mat`: Data from Hippocampus (320 epochs)
   
  
## Parameters

You can modify the following parameters suited to your data:

J: 
Alpha:
 


