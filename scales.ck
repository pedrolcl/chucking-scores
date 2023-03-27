// scales: diatonic and chromatic

// ChucK program
// Copyright (C) 2006 Pedro López-Cabanillas <plcl@users.sourceforge.net>

// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software Foundation, Inc.
// 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

sinosc s => dac;
0.8 => s.gain;

// MIDI note constants
60 => int c;     72 => int C;
61 => int cs;    73 => int Cs;
62 => int d;     74 => int D;
63 => int ds;    75 => int Ds;
64 => int e;     76 => int E;
65 => int f;     77 => int F;
66 => int fs;    78 => int Fs;
67 => int g;     79 => int G;
68 => int gs;    80 => int Gs;
69 => int a;     81 => int A;
70 => int as;    82 => int As;
71 => int b;     83 => int B;

// We use musical tempo, and symbolic durations
120 => int tempo; // Maelzel Metronome units (quarters per minute)

// integers 1,2,4,8 mean musical figures
dur duration[9];
240000::ms / ( 1 * tempo )  => duration[1]; // whole
240000::ms / ( 2 * tempo )  => duration[2]; // half
240000::ms / ( 4 * tempo )  => duration[4]; // quarter (crotchet)
240000::ms / ( 8 * tempo )  => duration[8]; // eighth (quaver)
(duration[4] + duration[8]) => duration[5]; // dotted quarter
(duration[2] + duration[4]) => duration[3]; // dotted half

// Music fragments are defined as bidimensional integer arays.
// First dimension is a variable length series of elements (notes),
// and each note is a pair of [MIDI note, duration] integers.

// Diatonic scale of C major. Each note is a pair of [MIDI note,duration]
[[c,4],[d,4],[e,4],[f,4],[g,4],[a,4],[b,4],[C,2]] @=> int cMajScale[][];

// Chromatic scale
[[c,8],[cs,8],[d,8],[ds,8],[e,8],[f,8],[fs,8],[g,8],[gs,8],[a,8],[as,8],[b,8]]
@=> int chromScale[][];

// For transpose (pitch shift), if needed
0 => int trans;

// Play a single note
fun void playNote( int n, int d ) {
    std.mtof(n + trans) => s.freq;
    duration[d] => now;
}

// Main loops: play the scales.

for( 0 => int i; i < cMajScale.cap(); i++) {
    playNote(cMajScale[i][0], cMajScale[i][1]);
}

for( 0 => int i; i < chromScale.cap(); i++) {
    playNote(chromScale[i][0], chromScale[i][1]);
}

playNote(C, 2);

for( chromScale.cap()-1 => int i; i > 0; i--) {
    playNote(chromScale[i][0], chromScale[i][1]);
}

playNote(c, 1);

