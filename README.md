# Direction-Of-Arrival-Estimation
We are Imen BOUABIDI and Ameni MEZNI telecommunication enginners students.We study in the National Engineering School of Tunis.


The problem of estimating direction-of-arrivals of multiple plane waves impinging on an arbitrary array of sensors has paid a lot of attention.It has played an important role in many applications including wireless communication , radar and sonar, radio astronomy etc .

This work is dedicated for person who deal with Direction Of Arrival Estimation in their thesis.

We implement in here directions of arrival estimation techniques:Subspace and the Non-Subspace methods . MATLAB is used for simulating the algorithms.Subspace methods are MUSIC , Root-MUSIC and ESPRIT . Non-Subspace methods are Beamforming and capon.

To facilitate the analysis, it is necessary to make idealistic assumptions of the antennas and signals.
Assuming that:

The antenna array is linear array,the N elements of which is omni-directional,the gain is equal and there isn't inconsistent, mutual coupling or other factors.

The signal, whose number M is known , is non-associated narrowband signal, and that the signals from far-field received by the linear
 array are plane waves.

The number of sources M is strictly less than the number of antennas (M<N).

The noise is white Gaussian noise, which is zero mean and (sigma^2) variance, and the noise independent of each other,and is not relevant with signals.

