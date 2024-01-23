
# RnB-Wavelet - EEG spectroscopy

## Description

Current methodologies (Wen & Liu,2016; Donoghue et al.,2020) rely on the Fourier analysis and are limited to disentangling the rhythmic and arrhythmic activities from the Fourier spectral power.

The RnB (rhythms and background)-Wavelet model shifts this paradigm by using discrete wavelet analysis, allowing the separation of these components at the temporal level of a signal. 

The algorithm extracts a ‘rhythmic signal’ by filtering out the arrhythmic components from the wavelet coefficients.

![Alt text](img/FigGitHub.png)


The following demo illustrates the RnB-Wavelet method.

   
## Usage

Run the main script ` RnB_wavelet_main.m `. In the command window, you will be asked to select the intracranial recordings of a specific region. The output will include a figure illustrating the following:

- Average rhythmic spectrum
- Beta distribution of the dataset

In the supplementary demo folder, two additional demos can be executed:

- `Spectral_filtering.m`: Fourier spectral method computing the arrhythmic spectrum
 
- `Rhythmic_neural_mass.m`:  RnB-wavelet applied on a single epoch, illustrating :

    - Original signal vs. resulting rhythmic signal 
    - Rhythmic spectrum derived from the rhythmic signal

## File structure

- `RnB_wavelet_main.m`: Main script from which the model can be executed.
- RnB_v01: Folder containing functions called by the main script.
- Supplementary demo: 
   - `Spectral_filtering.m`
   - `Rhytmic_neural_mass.m` 
- data: Folder containing data:
   - `R16_N3.mat`: Data from Ant. Cingulate (350 epochs)
   - `R18_N3.mat`: Data from Sup. Motor Cortex (300 epochs)
   - `R37_N3.mat`: Data from Sup. Front. Gyrus (350 epochs)
   - `R37_N3.mat`: Data from Hippocampus (320 epochs)
   - `data_simul.mat` : Scale-free + neural mass (single epoch)

## References

Please cite as the following,

    'In progress(2024)'
    
Link:

## Contributions

Comments and contributions to this project are encouraged and welcomed.

## Contact

**Email**: jean-marc.lina@etsmtl.ca\
**Email**: michael-christopher.foti.1@ens.etsmtl.ca
