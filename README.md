# RnB-Wavelet

## Description

Current methodologies rely on the Fourier transform and are limited to separating the rhythmic and arrhythmic components from the power spectrum.

The RnB (rhythms and background)-Wavelet model shifts this paradigm by utilizing wavelet analysis, allowing the separation of these components at the temporal level of a signal.  
The algorithm extracts a ‘rhythmic signal’ by filtering out the arrhythmic components from the wavelet coefficients.

The following demo illustrates the RnB- wavelet method.

## Usage

Run the main script ` RnB_wavelet_main.m `. The output will include a figure illustrating the following:

- Average rhythmic spectrum
- Beta distribution of the dataset

In the supplementary demo folder, two additional demos can be executed:

- `Spectral_filtering.m`: Spectral method computing the arrythmic spectrum
 
- `Rhythmic_neural_mass.m`:  RnB-wavelet applied on a single epoch, illustrating :
- 
    - Original signal vs. resulting rhythmic signal 
    - Rhythmic spectrum derived  the rhythmic signal

## File structure

- `RnB_wavelet_main.m`: Main script from which the model can be executed.
- RnB_v01: Folder containing functions called by the main script.
- Supplementary demo: 
   - `Spectral_filtering.m`
   - `Rhytmic_neural_mass.m` 
- data: Folder containing dataset.
   - `R37_N3.mat`: Data from Hippocampus (320 epochs)
   - `data_simul.mat` : Scale free + neural mass (single epoch)

## References

Please cite as the following,

    'In progress(2024)'
    
Link:

## Contributions

We welcome contributions to this project.

## Contact

**Email**: jean-marc.lina@etsmtl.ca\
**Email**: michael-christopher.foti.1@ens.etsmtl.ca# RnB-Wavelet