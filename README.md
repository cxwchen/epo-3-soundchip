# Epo 3 : Sound chip

University project involving the implementation of a GameBoy-like soundchip capable of turning MIDI signals into sound over 4 parallel sound-generators.

The design is split up into 3 main modules, with an extra semi-peripheral module and one fully external optional module. Below is a short explanation of the functionalities of the different modules.

## MIDI Interpreter
This module is responsible for decoding the serial MIDI input signal into a parallel bit-vector in a format that the other modules can interact with.

## Sound Generator
The sound generator module is responsible for producing a PWM waveform for every sound channel. The fourth channel is a special type of sound generator, as it only produces noise.

## Output
The output module combines the four separate sound generated waves into one audio output signal. This is mostly done through signal addition and multiplication.

## Waveform Selector
The waveform selector is a semi-peripheral module which allows for the user to select what kind of waveform should be generated on each individual sound channel.
