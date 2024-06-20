
# RnB-Wavelet - EEG spectroscopy

## Description

Current methodologies (Wen & Liu,2016; Donoghue et al.,2020) rely on the Fourier analysis and are limited to disentangling the rhythmic and arrhythmic activities from the Fourier spectral power.

The RnB (rhythms and background)-Wavelet model shifts this paradigm by using discrete wavelet analysis, allowing the separation of these components at the temporal level of a signal. 

The algorithm extracts a ‘rhythmic signal’ by filtering out the arrhythmic components from the wavelet coefficients.

![Alt text](Figures/FigGitHub.png)


The following demo illustrates the RnB-Wavelet method.

   
## Usage

Run the main script ` wRnB.m `. In the command window, you will be asked to select the intracranial recordings of a specific region. The output will include a figure illustrating the following:

- Average rhythmic spectrum
- Beta distribution of the dataset

 Note: There is an alternative interactive live script available where users can add their own data. Download the wRnBLive repository. 
      

## File structure

- `wRnB.m`: Main script from which the model can be executed.
- RnB_v01: Folder containing functions called by the main script.
- data: Folder containing data:
   - `R16_N3.mat`: Data from Ant. Cingulate (350 epochs)
   - `R18_N3.mat`: Data from Sup. Motor Cortex (300 epochs)
   - `R37_N3.mat`: Data from Sup. Front. Gyrus (350 epochs)
   - `R37_N3.mat`: Data from Hippocampus (320 epochs)
- figures: Includes all the repositories required to generate figures from the article
- wRnBLive: Interactive live script repository
## References

Please cite as the following,

    'In progress(2024)'
    
Link:

## Contributions

Comments and contributions to this project are encouraged and welcomed.

## Contact

**Email**: jean-marc.lina@etsmtl.ca\
**Email**: michael-christopher.foti.1@ens.etsmtl.ca
