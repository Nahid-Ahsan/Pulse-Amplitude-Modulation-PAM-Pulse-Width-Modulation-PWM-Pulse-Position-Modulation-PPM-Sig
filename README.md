# Pulse-Amplitude-Modulation-PAM-Pulse-Width-Modulation-PWM-Pulse-Position-Modulation-PPM-Sig
To understand the basic principle of PAM, PWM &amp; PPM 2. And simulate PAM, PWM &amp; PPM signals on a given message signal and understand the properties &amp; applications of them.


# Theory:

PAM, PWM & PPM are some modulation schemes based on pulsed carriers. They are not that
typical carrier modulation techniques which involve shifting of the message spectrum to the nearby
of or into the carrier bands; rather they refer to such a scheme in which ‘sampled’ message signal
gets encoded into some of the properties (i.e. width, amplitude, position) of a rectangular periodic
pulse signal.

The basic difference between this pulse modulation and conventional modulation is that, pulse
modulation deals with ‘sampled’ message signal, where, the carrier modulation deals with pure
analog message signal; the second difference is, the BW of pulse modulation scheme is dependent
on the nature of pulse (the minimum allowable pulse width), not on the message signal, but in
typical carrier modulation, it depends on the message signal. It is more compatible to digital
signaling than the carrier modulation. Some popular pulse modulation techniques are – PWM,
PAM, PPM, PCM, DPCM, ADPCM etc.

# Pulse Amplitude Modulation (PAM):

When we sample message practically, ideal ‘impulse’ samples can’t be found as we have studied
in the sampling theory. Instead of impulses, we get some rectangular pulses as samples, which is
actually the PAM signals. The study of PAM signals is very important in order to handle the
practical samples and also to implement Line Coding on the digital bitstream of messages.

The message is encoded into the amplitude of the pulses. There are two types of PAM signals.

## 1. Flat Topped PAM:
The message is sampled and the pulse amplitude is kept same as the message sample
at that sampling instant until new sample comes. The top of the PAM signal is flat,
that’s why the nomenclature is done so. It is very easy to be implemented via switching
and hold capacitors, that’s why in most cases, PAM means flat topped PAM unless
otherwise mentioned. It is also called ‘Impulse sampling & hold’. It also allows
multilevel signaling i.e. M-ary PAM to reduce the transmission bandwidth.

## 2. Natural PAM:
The top of the pulses imitates the shape of the message as if we were giving window to
the message to flow, then cut it off, and again then let the message flow and so on. It
can be done via simple switching on the way of the message flow. But as the pulse
height has a time varying shape, the regeneration & error correction of this PAM signal
are quite complex than the flat topped one.

![alt text](https://github.com/Nahid-Ahsan/Pulse-Amplitude-Modulation-PAM-Pulse-Width-Modulation-PWM-Pulse-Position-Modulation-PPM-Sig/blob/master/PAM.png)


# Pulse Width Modulation (PWM):
Pulse-width modulation (PWM), or pulse-duration modulation (PDM) is a modulation technique
that conforms the width of the pulse, formally the pulse duration, based on a modulator signal
information. The message is encoded into the pulse widths of the signal.

Although this modulation technique can be used to encode information for transmission, its main
use is to allow the control of the power supply to electrical devices, especially to inertial loadssuch as motors. The average value of voltage (and current) fed to the load is controlled by turning
the switch between supply and load on and off at a fast pace. The longer the switch is on than the
off periods, the higher the power supplied to the load is.

The PWM switching frequency has to be much faster than what would affect the load. Typically,
switchings have to be done several times a minute in an electric stove, 120 Hz in a lamp dimmer,
from few kilohertz (kHz) to tens of kHz for a motor driver and well into the tens or hundreds of
kHz in audio amplifiers and computer power supplies.

The term ‘duty cycle’ describes the proportion of 'on' time to the 'period' of the pulse; a low duty
cycle corresponds to low power, because the power is off for most of the time. Duty cycle is
expressed in percent.

The main advantage of PWM is that power loss in the switching devices is very low. When a
switch is off there is practically no current, and when it is on, there is almost no voltage drop across
the switch. Power loss, being the product of voltage and current, is thus in both cases close to zero.


PWM also works well with digital controls, which, because of their on/off nature, can easily set
the needed duty cycle. PWM has also been used in certain communication systems where its duty
cycle has been used to convey information over a communications channel.


## How to generate PWM Signals:
Firstly, we need a sawtooth reference signal. Then compare the message signal with the sawtooth
signal using a comparator (i.e. op-amp w/o feedback), if the message value is higher, output
continuous pulse, as soon as message becomes lower than reference, output zeros. This is will
create a PWM output pulses for the message signal. 

![](https://github.com/Nahid-Ahsan/Pulse-Amplitude-Modulation-PAM-Pulse-Width-Modulation-PWM-Pulse-Position-Modulation-PPM-Sig/blob/master/PWM.png)



# Pulse Position Modulation (PPM):
Message is encoded into the pulse position. The
pulse position at null (when message is at
null/minima) is called the reference position. When
the message has some values, the pulse position
moves either left or right extend proportional to the
message signal value at that sampling instant.

PPM can be of unidirectional & bidirectional.
Unidirectional PPM has reference at the minima
and moves left (or right) as the signal grows from
the minima. Bidirectional PPM signal has reference
at zero, when positive, moves left (right) and when
negative, moves right (left).


## How to Generate PPM Signal:
Generation of PPM is easier if we previously generate PWM for the message signal. Firstly, we
need to define the rectangular pulse (say p(t)) which will be used for PPM signaling. Then we have
to check for the negative edges (NE) of the already generated PWM signal. Let the information of
where the negative edges are, be stored as a signal which is denoted by q(t). This q(t) is an impulse
at the NE points, and zero otherwise. So now, the half-period-shifted convolution of p(t) and q(t)
(i.e. p(t-T/2)*q(t)) yields the desired PPM Signal. In easier language, we have to put the left edge
of the pulse p(t) at the position the impulses of q(t).
The method of PWM’s negative edge detection can be electronically realized by setting an inverted
differentiator in series with a HW-rectifier. Then passing the outcome of the rectifier through a
filter of impulse response h(t) = p(t-T/2) will yield the PPM signal as output. (Think why it is so?)

![](https://github.com/Nahid-Ahsan/Pulse-Amplitude-Modulation-PAM-Pulse-Width-Modulation-PWM-Pulse-Position-Modulation-PPM-Sig/blob/master/PWM.png)
