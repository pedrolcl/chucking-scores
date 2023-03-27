// Minuet in G. No.4 from "A Little Notebook for Anna Magdalena Bach"
// Johan Sebastian Bach (1685-1750) BWV Anh.114 
// Score from http://www.mutopiaproject.org 

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

// patch
Mandolin s1 => JCRev r => dac;
Mandolin s2 => r;

// initial settings
.6 => s1.gain;
.4 => s2.gain;
.9 => r.gain;
.2 => r.mix;

// MIDI note constants.
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
120 => int tempo;
// integers 1,2,4,8 mean musical figures
dur duration[9];
240000::ms / ( 1 * tempo )  => duration[1]; // whole
240000::ms / ( 2 * tempo )  => duration[2]; // half
240000::ms / ( 4 * tempo )  => duration[4]; // quarter
240000::ms / ( 8 * tempo )  => duration[8]; // eighth
(duration[4] + duration[8]) => duration[5]; // dotted quarter
(duration[2] + duration[4]) => duration[3]; // dotted half

// Tune fragments. Each note is a pair of [MIDI note,duration]
//--- voice 1 ---

[[D,4],[g,8],[a,8],[b,8],[C,8],
 [D,4],[g,4],[g,4],
 [E,4],[C,8],[D,8],[E,8],[Fs,8],
 [G,4],[g,4],[g,4],
 [C,4],[D,8],[C,8],[b,8],[a,8],
 [b,4],[C,8],[b,8],[a,8],[g,8],
 [fs,4],[g,8],[a,8],[b,8],[g,8],
 [a,3],
 [D,4],[g,8],[a,8],[b,8],[C,8],
 [D,4],[g,4],[g,4],
 [E,4],[C,8],[D,8],[E,8],[Fs,8],
 [G,4],[g,4],[g,4],
 [C,4],[D,8],[C,8],[b,8],[a,8],
 [b,4],[C,8],[b,8],[a,8],[g,8],
 [a,4],[b,8],[a,8],[g,8],[fs,8],
 [g,3]] @=> int v1a[][];

[[B,4],[G,8],[A,8],[B,8],[G,8 ],
 [A,4],[D,8],[E,8],[Fs,8],[D,8],
 [G,4],[E,8],[Fs,8],[G,8],[D,8],
 [Cs,4],[b,8],[Cs,8],[a,4],
 [a,8],[b,8],[Cs,8],[D,8],[E,8],[Fs,8],
 [G,4],[Fs,4],[E,4],
 [Fs,4],[a,4],[Cs,4],
 [D,3],
 [D,4],[g,8],[fs,8],[g,4],
 [E,4],[g,8],[fs,8],[g,4],
 [D,4],[C,4],[b,4],
 [a,8],[g,8],[fs,8],[g,8],[a,4],
 [d,8],[e,8],[fs,8],[g,8],[a,8],[b,8],
 [C,4],[b,4],[a,4],
 [b,8],[D,8],[g,4],[fs,4],
 [g,3]] @=> int v1b[][];

//--- voice 2 ---

[[g,2],[a,4],
 [b,3],[C,3],[b,3],
 [a,3],[g,3],
 [D,4],[b,4],[g,4],
 [D,4],[d,8],[C,8],[b,8],[a,8],
 [b,2],[a,4],
 [g,4],[b,4],[g,4],
 [C,3],
 [b,4],[C,8],[b,8],[a,8],[g,8],
 [a,2],[fs,4],
 [g,2],[b,4],
 [C,4],[D,4],[d,4],
 [g,2],[g-12,4]] @=> int v2a[][];

[[G,3],[fs,3],
 [e,4],[g,4],[e,4],
 [a,2],[a-12,4],
 [a,3],
 [b,4],[D,4],[Cs,4],
 [D,4],[fs,4],[a,4],
 [D,4],[d,4],[C,4],
 [b,4],[D,4],[b,4],
 [C,4],[E,4],[C,4],
 [b,4],[a,4],[g,4],
 [D,3],
 [d,2],[f,4],
 [e,4],[g,4],[fs,4],
 [g,4],[b-12,4],[d,4],
 [g,4],[d,4],[g-12,4]] @=> int v2b[][];

// Play a fragment
fun void playVoice(Mandolin m, int voice[][], int transport) {
    for( 0 => int i; i < voice.cap(); i++) {
        if ( voice[i][0] > 0 ) {
            std.mtof( voice[i][0] + transport ) => m.freq;
            1.0 => m.pluck;
        }
        duration[voice[i][1]] => now;
    }
}

Event finished;

fun void playv1() {
    playVoice(s1, v1a, 0);
    playVoice(s1, v1a, 0);
    playVoice(s1, v1b, 0);
    playVoice(s1, v1b, 0);
}

fun void playv2() {
    playVoice(s2, v2a, -12);
    playVoice(s2, v2a, -12);
    playVoice(s2, v2b, -12);
    playVoice(s2, v2b, -12);
    finished.broadcast();
}

// Main: play the whole song
spork ~ playv1();
spork ~ playv2();
finished => now;

