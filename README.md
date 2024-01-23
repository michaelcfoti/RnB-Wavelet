# RnB-Wavelet - EEG spectroscopy

## Description

Current methodologies [1,2] rely on the Fourier analysis and are limited to disentangle the rhythmic and arrhythmic activities from the Fourier spectral power.

The RnB (rhythms and background)-Wavelet model shifts this paradigm by using discrete wavelet analysis, allowing the separation of these components at the temporal level of a signal. 

The algorithm extracts a ‘rhythmic signal’ by filtering out the arrhythmic components from the wavelet coefficients.

The following demo illustrates the RnB-Wavelet method.

1. Wen H, Liu Z. Separating Fractal and Oscillatory Components in the Power Spectrum of Neurophysiological Signal. Brain Topogr. 2016 Jan;29(1):13-26. doi: 10.1007/s10548-015-0448-0. Epub 2015 Aug 29. PMID: 26318848; PMCID: PMC4706469.
2. Donoghue T, Haller M, Peterson EJ, Varma P, Sebastian P, Gao R, Noto T, Lara AH, Wallis JD, Knight RT, Shestyuk A, Voytek B (2020). Parameterizing neural power spectra into periodic and aperiodic components. Nature Neuroscience, 23, 1655-1665. DOI: 10.1038/s41593-020-00744-x
   
## Usage

Run the main script ` RnB_wavelet_main.m `. In the command window, you will asked to select the intracranial recordings of a specific region. The output will include a figure illustrating the following:

- Average rhythmic spectrum
- Beta distribution of the dataset

In the supplementary demo folder, two additional demos can be executed:

- `Spectral_filtering.m`: Fourier spectral method computing the arrythmic spectrum
 
- `Rhythmic_neural_mass.m`:  RnB-wavelet applied on a single epoch, illustrating :

    - Original signal vs. resulting rhythmic signal 
    - Rhythmic spectrum derived from the rhythmic signal

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

Comments and contribution to this project are encouraged and welcomed.

## Contact

**Email**: jean-marc.lina@etsmtl.ca\
**Email**: michael-christopher.foti.1@ens.etsmtl.ca
