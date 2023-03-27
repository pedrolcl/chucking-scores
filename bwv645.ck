// Wachet auf, ruft uns die Stimme (fragment)
// Johan Sebastian Bach (1685-1750), BWV 645

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
Rhodey s1 => JCRev reverb => dac;
Rhodey s2 => reverb;

// initial settings
.6 => s1.gain;
.4 => s2.gain;
.9 => reverb.gain;
.2 => reverb.mix;

// MIDI note constants
48 => int c3;     60 => int c4;     72 => int c5;     84 => int c6;
49 => int d3b;    61 => int d4b;    73 => int d5b;    85 => int d6b;
50 => int d3;     62 => int d4;     74 => int d5;     86 => int d6;
51 => int e3b;    63 => int e4b;    75 => int e5b;    87 => int e6b;
52 => int e3;     64 => int e4;     76 => int e5;     88 => int e6;
53 => int f3;     65 => int f4;     77 => int f5;     89 => int f6;
54 => int g3b;    66 => int g4b;    78 => int g5b;    90 => int g6b;
55 => int g3;     67 => int g4;     79 => int g5;     91 => int g6;
56 => int a3b;    68 => int a4b;    80 => int a5b;    92 => int a6b;
57 => int a3;     69 => int a4;     81 => int a5;     93 => int a6;
58 => int b3b;    70 => int b4b;    82 => int b5b;    94 => int b6b;
59 => int b3;     71 => int b4;     83 => int b5;     95 => int b6;

// rest is music too
0  => int r;

// We use musical tempo, and symbolic durations
70 => int tempo;

1  => int t1;   // whole
2  => int t2;   // half
4  => int t4;   // quarter
8  => int t8;   // eighth
16 => int t16;  // 16th
32 => int t32;  // 32th

// arbitrary values for dotted figures
3  => int t2d;  // dotted half
5  => int t4d;  // dotted quarter
9  => int t8d;  // dotted eigth

fun dur duration(int figure) {
    if (figure == t2d )
        return duration(t2) + duration(t4);
    else if (figure == t4d)
        return duration(t4) + duration(t8);
    else if (figure == t8d)
        return duration(t8) + duration(t16);
    else
        return 240000::ms / ( figure * tempo );
}

//right hand
[[b4b,t8],
 [e5b,t16],[f4,t16],[g5,t8],[g5,t8],[f5,t8],[a5b,t8],[g5,t8],[b4b,t8],[a4b,t8],
 [g5,t16],[e5b,t16],[f5,t8],[a4b,t8],[g4,t8],[d5,t8],[e5b,t8],[r,t8],[b4b,t8],
 [e5b,t16],[f5,t16],[g5,t8],[g5,t8],[f5,t8],[a5b,t8],[g5,t8],[b4b,t8],[a4b,t8],
// 4
 [g5,t16],[e5b,t16],[f5,t8],[a4b,t8],[g4,t8],[d5,t8],[e5b,t8],[r,t8],[b5b,t8],
 [b5b,t4],[a5b,t16],[g5,t16],[f5,t16],[e5b,t16],[f5,t16],[e5b,t16],[d5,t16],
    [c5,t16],[b4b,t8],[c5,t16],[d5,t16],
 [e5b,t16],[f5,t16],[g5,t16],[f5,t16],[a5b,t16],[g5,t16],[f5,t16],[e5b,t16],
    [g5,t8],[f5,t8],[r,t8],[b4b,t8],
 [g5,t8],[a5,t4],[b5b,t8],[e5b,t16],[d5,t16],[e5b,t8],[r,t8],[c5,t8],
 [a5,t8],[b5b,t4],[c6,t8],[e5b,t16],[d5,t16],[e5b,t8],[r,t8],[e6b,t8],
// 9
 [d6,t16],[c6,t16],[b5b,t8],[b5b,t16],[a5,t16],[b5b,t8d],[a5,t16],[g5,t16],
    [f5,t16],[e5b,t16],[d5,t16],[c5,t16],[b4b,t16],
 [c5,t16],[d5,t16],[e5b,t8],[e5b,t16],[d5,t16],[e5b,t8d],[a5,t16],[b5b,t16],
    [c6,t16],[b5b,t16],[a5,t16],[g5,t16],[f5,t16],
 [b5b,t8],[f5,t8],[d5,t8],[c5,t16],[b4b,t16],[b4b,t16],[e5b,t16],[d5,t16],
    [c5,t16],[d5,t8],[b4b,t8],
 [g4,t8d],[a4,t16],[a4,t8d],[g4,t32],[a4,t32],[b4b,t4],[r,t8],[b4b,t8],
 [e5b,t16],[f5,t16],[g5,t8],[g5,t8],[f5,t8],[a5b,t8],[g5,t8],[b4b,t8],[a4b,t8],
// 14
 [g5,t16],[e5b,t16],[f5,t8],[a4b,t8],[g4,t8],[d5,t8],[e5b,t8],[r,t4],
 [r,t4d],[b5b,t8],[b5b,t4],[a5b,t16],[g5,t16],[f5,t16],[e5b,t16],
 [f5,t16],[e5b,t16],[d5,t16],[c5,t16],[b4b,t8],[c5,t16],[d5,t16],[e5b,t16],
    [f5,t16],[g5,t16],[f5,t16],[a5b,t16],[g5,t16],[f5,t16],[e5b,t16],
 [g5,t8],[f5,t8],[r,t8],[f5,t8],[c6,t8],[d6,t4],[e6b,t8],
 [a5b,t16],[g5,t16],[a5b,t8],[r,t8],[c6,t8],[d6,t8],[e6b,t4],[f6,t8],
// 19
 [a5b,t16],[g5,t16],[a5b,t8],[r,t8],[f5,t8],[g5,t16],[f5,t16],[e5b,t8d],
    [d5,t16],[e5b,t8],
 [r,t16],[d6b,t16],[c6,t16],[b5b,t16],[a5b,t16],[g5,t16],[f5,t16],[e5b,t16],
    [f5,t16],[g5,t16],[a5b,t8d],[g5,t16],[a5b,t8],
 [r,t16],[d5,t16],[e5b,t16],[f5,t16],[e5b,t16],[d5,t16],[c5,t16],[b4b,t16],
    [b5b,t8],[e5b,t8],[g5,t16],[f5,t16],[e5b,t16],[d5,t16],
 [e5b,t16],[a5b,t16],[g5,t16],[f5,t16],[g5,t8],[e5b,t8],[c5,t8d],[d5,t16],
    [d5,t8d],[e5b,t16],
 [e5b,t1]] @=> int voice1[][];

//left hand
[[r,t8],
 [e3b,t4],[e3b,t4],[e3b,t4],[g3,t4],
 [a3b,t4],[b3b,t4],[e3b,t4],[r,t4],
 [e3b,t4],[e3b,t4],[e3b,t4],[g3,t4],
// 4
 [a3b,t4],[b3b,t4],[e3b,t4],[r,t4],
 [g3,t4],[c4,t4],[b3b,t4],[a3b,t4],
 [g3,t4],[e3b,t4],[b3b,t4],[d4,t4],
 [e4b,t4],[d4,t4],[c4,t4],[e4b,t4],
 [f4,t4],[g4,t4],[a4,t4],[f4,t4],
// 9
 [b4b,t4],[a4,t4],[g4,t4],[f4,t4],
 [e4b,t4],[d4,t4],[c4,t4],[e4b,t4],
 [d4,t8],[b3b,t8],[f4,t8],[f3,t8],[g3,t8],[a3,t8],[b3b,t8],[d4,t8],
 [e4b,t8],[c4,t8],[f4,t4],[b3b,t8],[c4,t8],[b3b,t8],[a3b,t8],
 [g3,t8],[f3,t8],[e3b,t8],[d3,t8],[c3,t4],[c4,t4],
// 14
 [a3b,t4],[b3b,t4],[e3b,t4],[e4b,t4],
 [d4,t8],[c4,t8],[b3b,t8],[a3b,t8],[g3,t4],[c4,t4],
 [b3b,t4],[a3b,t4],[g3,t4],[e3b,t4],
 [b3b,t4],[d4,t4],[a4b,t4],[g4,t4],
 [f4,t4],[e4b,t4],[f4,t4],[b3b,t4],
// 19
 [c4,t4],[a3b,t4],[b3b,t4],[g3,t4],
 [a3b,t8],[g3,t8],[f3,t8],[e3b,t8],[d3,t4],[f3,t4],
 [b3b,t8],[c4,t8],[b3b,t8],[a3b,t8],[g3,t8],[c4,t8],[a3b,t8],[b3b,t8],
 [c4,t8],[d4,t8],[e4b,t8],[g4,t8],[a4b,t8],[f4,t8],[b4b,t8],[b3b,t8],
 [e4b,t1]] @=> int voice2[][];

// Play a fragment
Event finished;
fun void playVoice(Rhodey m, int voice[][]) {
    for( 0 => int i; i < voice.cap(); i++) {
        if ( voice[i][0] > 0 ) {
            std.mtof( voice[i][0]) => m.freq;
            1.0 => m.noteOn;
        }
        duration( voice[i][1] ) => now;
    }
    finished.broadcast();
}

// Play the whole song
spork ~ playVoice(s1, voice1);
spork ~ playVoice(s2, voice2);
finished => now;
