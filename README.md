# EE384 FA2017 Final Project
A digital audio synthesizer written in MATLAB for my final project in EE384 FA2017. Some of the features of this project include

* Parameter based audio synthesis
* Modular chain of audio effects & filters
* Plot of final waveform

## Details
### ASDR Envelope
This project uses a parameter based Attack Sustain Decay Release, or ADSR, Evenelope. This Evenelope defines the the shape and characteristics of the generated waveform. The user can control the duration of all four of these attributes.

### Audio Effects
* Overdrive
* Fuzz
* Tremolo
* Compressor
* Decompressor/Expander

### Modular Signal Chain
The audio effects from the previous sections can be applied in a modular fashion to the generated waveform. Up to three audio effects can be applied, in any order, to the generated waveform. Different combinations of the same effects will result in different waveforms.
