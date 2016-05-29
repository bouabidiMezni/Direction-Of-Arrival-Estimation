# Direction-Of-Arrival-Estimation
We are Imen BOUABIDI and Ameni MEZNI, a telecommunication engineering students in the National Engineering School of Tunis.

The problem of estimating direction of arrivals of multiple plane waves impinging on an arbitrary array of sensors has paid a lot of attention. It has played an important role in many applications including wireless communication , radar and sonar, radio astronomy,etc.

This work is dedicated to every person who deals with direction of arrival estimation in his thesis.

We implement in here the code of several directions of arrival estimation techniques: subspace and non-subspace methods.
Subspace methods are MUSIC, Root-MUSIC and ESPRIT. Non-Subspace methods are Beamforming and Capon.
MATLAB is used for simulating the algorithms. 

To facilitate the analysis, it is necessary to make idealistic assumptions of the antennas and signals.
Assuming that:
The antenna array is linear. Its N elements are omni-directional.

The signals, whose number M is known, are uncorrelated narrowband signals. The signals, from far-field, received by the linear
array are plane waves.

The number of sources M is strictly less than the number of antennas (M<N). 
The noise is uncorrelated and is supposed to be a white gaussian noise.

