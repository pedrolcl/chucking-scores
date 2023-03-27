// Canon in D, by Johan Pachelbel

// ChucK program
// Copyright (C) 2007 Pedro López-Cabanillas <plcl@users.sourceforge.net>

// Based on a transcription by Werner Icking. Score available at
// http://icking-music-archive.org/ByComposer/Pachelbel.php

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

VoicForm s1 => JCRev reverb => dac;
0.03 => s1.vibratoGain;
0 => s1.phonemeNum;

VoicForm s2 => reverb;
0.03 => s2.vibratoGain;
1 => s2.phonemeNum;

VoicForm s3 => reverb;
0.03 => s3.vibratoGain;
1 => s3.phonemeNum; //3

VoicForm s4 => reverb;
0.03 => s4.vibratoGain;
1 => s4.phonemeNum; //5

0 => s1.noteOff;
0 => s2.noteOff;
0 => s3.noteOff;
0 => s4.noteOff;

.3 => s1.gain;
.5 => s2.gain;
.5 => s3.gain;
.5 => s4.gain;

.9 => reverb.gain;
.2 => reverb.mix;

// MIDI note constants
36 => int c2;     48 => int c3;     60 => int c4;     72 => int c5;     84 => int c6;
37 => int c2s;    49 => int c3s;    61 => int c4s;    73 => int c5s;    85 => int c6s;
38 => int d2;     50 => int d3;     62 => int d4;     74 => int d5;     86 => int d6;
39 => int d2s;    51 => int d3s;    63 => int d4s;    75 => int d5s;    87 => int d6s;
40 => int e2;     52 => int e3;     64 => int e4;     76 => int e5;     88 => int e6;
41 => int f2;     53 => int f3;     65 => int f4;     77 => int f5;     89 => int f6;
42 => int f2s;    54 => int f3s;    66 => int f4s;    78 => int f5s;    90 => int f6s;
43 => int g2;     55 => int g3;     67 => int g4;     79 => int g5;     91 => int g6;
44 => int g2s;    56 => int g3s;    68 => int g4s;    80 => int g5s;    92 => int g6s;
45 => int a2;     57 => int a3;     69 => int a4;     81 => int a5;     93 => int a6;
46 => int a2s;    58 => int a3s;    70 => int a4s;    82 => int a5s;    94 => int a6s;
47 => int b2;     59 => int b3;     71 => int b4;     83 => int b5;     95 => int b6;

// rest is music too
0  => int r;

// We use musical tempo, and symbolic durations
50.0 => float tempo;

1  => int t1;  // whole
2  => int t2;  // half
4  => int t4;  // quarter
8  => int t8;  // eighth
16 => int t16; // 16th
32 => int t32; // 32th
// dotted figures
3 => int t2d;  // dotted half
5 => int t4d;  // dotted quarter
7 => int t8d;  // dotted eigth

fun dur duration(int figure) {
    if (figure == t2d )
        return duration(t2) + duration(t4);
    else if (figure == t4d)
        return duration(t4) + duration(t8);
    else if (figure == t8d)
        return duration(t8) + duration(t16);
    else
        return 240::second / ( figure * tempo );
}

// basso
[[d3,t4],[a2,t4],[b2,t4],[f2s,t4],[g2,t4],[d2,t4],[g2,t4],[a2,t4]] @=> int basso[][];

// Theme
[[f5s,t4],[e5,t4],[d5,t4],[c5s,t4],[b4,t4],[a4,t4],[b4,t4],[c5s,t4],[d5,t4],[c5s,t4],
[b4,t4],[a4,t4],[g4,t4],[f4s,t4],[g4,t4],[e4,t4],[d4,t8],[f4s,t8],[a4,t8],[g4,t8],
[f4s,t8],[d4,t8],[f4s,t8],[e4,t8],[d4,t8],[b3,t8],[d4,t8],[a4,t8],[g4,t8],[b4,t8],
[a4,t8],[g4,t8],[f4s,t8],[d4,t8],[e4,t8],[c5s,t8],[d5,t8],[f5s,t8],[a5,t8],[a4,t8],
[b4,t8],[g4,t8],[a4,t8],[f4s,t8],[d4,t8],[d5,t8],[d5,t8d],[c5s,t16],[d5,t16],[c5s,t16],
[d5,t16],[d4,t16],[c4s,t16],[a4,t16],[e4,t16],[f4s,t16],[d4,t16],[d5,t16],[c5s,t16],
[b4,t16],[c5s,t16],[f5s,t16],[a5,t16],[b5,t16],[g5,t16],[f5s,t16],[e5,t16],[g5,t16],
[f5s,t16],[e5,t16],[d5,t16],[c5s,t16],[b4,t16],[a4,t16],[g4,t16],[f4s,t16],[e4,t16],
[g4,t16],[f4s,t16],[e4,t16],[d4,t16],[e4,t16],[f4s,t16],[g4,t16],[a4,t16],[e4,t16],
[a4,t16],[g4,t16],[f4s,t16],[b4,t16],[a4,t16],[g4,t16],[a4,t16],[g4,t16],[f4s,t16],
[e4,t16],[d4,t16],[b3,t16],[b4,t16],[c5s,t16],[d5,t16],[c5s,t16],[b4,t16],[a4,t16],
[g4,t16],[f4s,t16],[e4,t16],[b4,t16],[a4,t16],[b4,t16],[a4,t16],[g4,t16],[f4s,t8],
[f5s,t8],[e5,t4],[r,t8],[d5,t8],[f5s,t4],[b5,t4],[a5,t4],[b5,t4],[c6s,t4],[d6,t8],
[d5,t8],[c5s,t4],[r,t8],[b4,t8],[d5,t4],[d5,t4d],[d5,t8],[d5,t8],[g5,t8],[e5,t8],
[a5,t8],[a5,t16],[f5s,t32],[g5,t32],[a5,t16],[f5s,t32],[g5,t32],[a5,t32],[a4,t32],
[b4,t32],[c5s,t32],[d5,t32],[e5,t32],[f5s,t32],[g5,t32],[f5s,t16],[d5,t32],[e5,t32],
[f5s,t16],[f4s,t32],[g4,t32],[a4,t32],[b4,t32],[a4,t32],[g4,t32],[a4,t32],[f4s,t32],
[g4,t32],[a4,t32],[g4,t16],[b4,t32],[a4,t32],[g4,t16],[f4s,t32],[e4,t32],[f4s,t32],
[e4,t32],[d4,t32],[e4,t32],[f4s,t32],[g4,t32],[a4,t32],[b4,t32],[g4,t16],[b4,t32],
[a4,t32],[b4,t16],[c5s,t32],[d5,t32],[a4,t32],[b4,t32],[c5s,t32],[d5,t32],[e5,t32],
[f5s,t32],[g5,t32],[a5,t32],[f5s,t16],[d5,t32],[e5,t32],[f5s,t16],[e5,t32],[d5,t32],
[e5,t32],[c5s,t32],[d5,t32],[e5,t32],[f5s,t32],[e5,t32],[d5,t32],[c5s,t32],[d5,t16],
[b4,t32],[c5s,t32],[d5,t16],[d4,t32],[e4,t32],[f4s,t32],[g4,t32],[f4s,t32],[e4,t32],
[f4s,t32],[d5,t32],[c5s,t32],[d5,t32],[b4,t16],[d5,t32],[c5s,t32],[b4,t16],[a4,t32],
[g4,t32],[a4,t32],[g4,t32],[f4s,t32],[g4,t32],[a4,t32],[b4,t32],[c5s,t32],[d5,t32],
[b4,t16],[d5,t32],[c5s,t32],[d5,t16],[c5s,t32],[b4,t32],[c5s,t32],[d5,t32],[e5,t32],
[d5,t32],[c5s,t32],[d5,t32],[b4,t32],[c5s,t32],[d5,t8],[r,t8],[c5s,t8],[r,t8],[b4,t8],
[r,t8],[d5,t8],[r,t8],[d4,t8],[r,t8],[d4,t8],[r,t8],[d4,t8],[r,t8],[e4,t8],[r,t8],
[r,t8],[a4,t8],[r,t8],[a4,t8],[r,t8],[f4s,t8],[r,t8],[a4,t8],[r,t8],[g4,t8],[r,t8],
[f4s,t8],[r,t8],[g4,t8],[r,t8],[e5,t8],[f5s,t16],[f4s,t16],[g4,t16],[f4s,t16],[e4,t16],
[e5,t16],[f5s,t16],[e5,t16],[d5,t16],[f4s,t16],[d4,t16],[b4,t16],[a4,t16],[a3,t16],
[g3,t16],[a3,t16],[b3,t16],[b4,t16],[c5s,t16],[b4,t16],[a4,t16],[a3,t16],[g3,t16],
[a3,t16],[b3,t16],[b4,t16],[a4,t16],[b4,t16],[c5s,t16],[c4s,t16],[b3,t16],[c4s,t16],
[d4,t16],[d5,t16],[e5,t16],[d5,t16],[c5s,t16],[c4s,t16],[d4,t16],[c4s,t16],[b3,t16],
[b4,t16],[a4,t16],[b4,t16],[c5s,t16],[c4s,t16],[f4s,t16],[e4,t16],[d4,t16],[d5,t16],
[e5,t16],[g5,t16],[f5s,t16],[f4s,t16],[a4,t16],[f5s,t16],[d5,t16],[g5,t16],[f5s,t16],
[g5,t16],[e5,t16],[a4,t16],[g4,t16],[a4,t16],[f4s,t16],[a4,t16],[a4,t16],[a4,t16],
[a4,t16],[a4,t16],[a4,t16],[a4,t16],[f4s,t16],[f4s,t16],[f4s,t16],[f4s,t16],[f4s,t16],
[f4s,t16],[a4,t16],[a4,t16],[g4,t16],[g4,t16],[g4,t16],[d5,t16],[d5,t16],[d5,t16],
[d5,t16],[d5,t16],[d5,t16],[d5,t16],[b4,t16],[b4,t16],[a4,t16],[a4,t16],[e5,t16],
[c5s,t16],[a4,t16],[f5s,t16],[f5s,t16],[f5s,t16],[e5,t16],[e5,t16],[e5,t16],[e5,t16],
[d5,t16],[d5,t16],[d5,t16],[d5,t16],[a5,t16],[a5,t16],[a5,t16],[a5,t16],[b5,t16],
[b5,t16],[b5,t16],[b5,t16],[a5,t16],[a5,t16],[a5,t16],[a5,t16],[b5,t16],[b5,t16],
[b5,t16],[b5,t16],[c6s,t16],[c5s,t16],[c5s,t16],[c5s,t16],[d5,t16],[d4,t32],[e4,t32],
[f4s,t16],[d4,t16],[c4s,t16],[c5s,t32],[d5,t32],[e5,t16],[c5s,t16],[b4,t16],[b3,t32],
[c4s,t32],[d4,t16],[b3,t16],[c4s,t16],[a4,t32],[g4,t32],[f4s,t16],[e4,t16],[d4,t16],
[g4,t32],[f4s,t32],[e4,t16],[g4,t16],[f4s,t16],[d4,t32],[e4,t32],[f4s,t16],[a4,t16],
[g4,t16],[b4,t32],[a4,t32],[g4,t16],[f4s,t16],[e4,t16],[a4,t32],[g4,t32],[f4s,t16],
[e4,t16],[f4s,t16],[d5,t32],[c5s,t32],[d5,t16],[f4s,t16],[a4,t16],[a4,t32],[b4,t32],
[c5s,t16],[a4,t16],[f4s,t16],[d5,t32],[e5,t32],[f5s,t16],[d5,t16],[f5s,t16],[f5s,t32],
[e5,t32],[d5,t16],[c5s,t16],[b4,t16],[b4,t32],[a4,t32],[b4,t16],[c5s,t16],[d5,t16],
[f5s,t32],[e5,t32],[d5,t16],[f5s,t16],[g5,t16],[d5,t32],[c5s,t32],[b4,t16],[b4,t16],
[a4,t16],[e4,t16],[a4,t16],[a4,t16],[a4,t4d],[a4,t8],[d4,t4d],[a4,t8],[g4,t4],[a4,t4],
[g4,t8],[d4,t8],[d4,t8d],[c4s,t16],[d4,t8],[d5,t8],[c5s,t4],[b4,t4],[a4,t4],[d4,t8d],
[e4,t16],[f4s,t4],[b4,t4],[e4,t4],[f4s,t8d],[f5s,t16],[f5s,t16],[g5,t16],[f5s,t16],
[e5,t16],[d5,t8d],[d5,t16],[d5,t16],[e5,t16],[d5,t16],[c5s,t16],[b4,t4],[d5,t4],
[d5,t16],[c5,t16],[b4,t16],[c5,t16],[a4,t4],[a4,t8d],[a5,t16],[a5,t16],[b5,t16],
[a5,t16],[g5,t16],[f5s,t8d],[f5s,t16],[f5s,t16],[g5,t16],[f5s,t16],[e5,t16],[d5,t16],
[c5,t16],[b4,t16],[c5,t16],[a4,t8d],[a4,t16],[g4,t8],[d5,t8],[c5s,t8d],[c5s,t16],
[d5,t8],[d5,t4],[c5s,t4],[b4,t4],[a4,t8],[a4,t8],[g4,t4],[f4s,t4],[r,t16],[e4,t16],
[e4,t4],[f4s,t8],[f5s,t4],[e5,t8],[d5,t8],[d6,t4],[c6,t8],[b5,t4],[d6,t8],[a5,t8],
[b5,t4],[a5,t4],[a5,t4],[a4,t8d],[g4,t16],[f4s,t4],[f5s,t8d],[e5,t16],[d5,t4d],
[d5,t8],[d5,t4],[c5s,t4]] @=> int theme[][];

// Tail fragments
[[d5,t8],[d4,t8],[c4s,t8],[c5s,t8],[b4,t8],[b3,t8],[a3,t8],[a4,t8],
 [g4,t8],[g5,t8],[f5s,t8],[f4s,t8],[e4,t8],[b4,t8],[e4,t8],[e5,t8]] @=> int tail_a[][];

[[f5s,t8],[f4s,t8],[e4,t8],[e5,t8],[d5,t8],[d4,t8],[c4s,t8],[c5s,t8],
 [b4,t8],[b5,t8],[a5,t8],[a4,t8],[g4,t8d],[e5,t16],[a4,t8],[a4,t8]] @=> int tail_b[][];
 
fun void playNotes(StkInstrument gen, int notes[][]) {
    for( 0 => int i; i < notes.cap(); i++) {
        if ( notes[i][0] > 0 ) {
            Std.mtof( notes[i][0]) => gen.freq;
            1.0 => gen.noteOn;
        }
        duration( notes[i][1] ) => now;
        0.0 => gen.noteOff;
    }
}

fun void ostinato() {
    for(0 => int count; count < 28; count++) {
        playNotes(s1, basso);
    }
    playNotes(s1, [[d3,t4],[r,t2d]]);
}

Event finished;

fun void voice1() {
    playNotes(s2, theme);
    playNotes(s2, tail_a);
    playNotes(s2, tail_b);
    playNotes(s2, [[a4,t4],[r,t2d]]);
    finished.broadcast();
}

fun void voice2() {
    playNotes(s3, theme);
    playNotes(s3, tail_a);
    playNotes(s3, [[f4s,t4],[r,t2d]]);
}

fun void voice3() {
    playNotes(s4, theme);
    playNotes(s4, [[d4,t4],[r,t2d]]);
}

fun void pause() {
    duration(1) => now;
    duration(1) => now;
}

// Play the whole thing
spork ~ ostinato();
pause();
spork ~ voice1();
pause();
spork ~ voice2();
pause();
spork ~ voice3();

finished => now;
