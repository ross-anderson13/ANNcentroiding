# ANNcentroiding

This repository consists of codes produced for my MPhys research project for 2022/23

**Title:** Charged Particle Image Processing with Machine Learning

**Abstract:** An alternative means of increasing the spatial resolution in charged particle imaging experiments
is presented. The most popular method of currently performing this is known as centroiding. A typical
ion/electron strike will cover many pixels in an image; centroiding selects only the local maximum of
this distribution as the true strike point and ignores all neighbouring pixels. This method can be
incredibly effective, but it does experience some limitations. This project proposes the use of an
artificial neural network (ANN) to remove blurring effects from an image as an alternative strategy.
This approach is evaluated on images simulated as if they were obtained shot-by-shot (with very few
individual particle events present), as in traditional centroiding. Also assessed, however, is the ability
to perform this deblurring method on images with high signal levels (many individual particle events
present), outside of the required range for traditional centroiding. The results show that the use of a
suitably trained ANN can provide an excellent alternative means to conventional centroiding methods.
Additionally, the further capability of retrospective deblurring of images with high signal levels present
provides a way of fundamentally simplifying the acquisition of high-resolution images without data
processing in between laser shots. This incredibly successful initial demonstration further cements the
impact of incorporating ANNs into the toolbox for charged particle imaging data analysis. 


