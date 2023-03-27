// We wish you a merry christmas (Traditional song).

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
Wurley s => JCRev r => dac;

// initial settings
.9 => s.gain;
.8 => r.gain;
.2 => r.mix;

// constants for each MIDI note.
67 => int g;
69 => int a;
71 => int b;
72 => int C;
74 => int D;
76 => int E;
77 => int F;
79 => int G;

160 => int tempo;

// Tune fragments. Each note is a pair of [MIDI note,duration]

[[g,4],
 [C,4],[C,8],[D,8],[C,8],[b,8],
 [a,4],[a,4],[a,4],
 [D,4],[D,8],[E,8],[D,8],[C,8],
 [b,4],[g,4],[g,4], 
 [E,4],[E,8],[F,8],[E,8],[D,8],
 [C,4],[a,4],[g,8],[g,8],
 [a,4],[D,4],[b,4],
 [C,2]] @=> int t1[][];

[[g,4],
 [C,4],[C,4],[C,4],
 [b,2],[b,4],
 [C,4],[b,4],[a,4],
 [g,2],[D,4],
 [E,4],[D,8],[D,8],[C,8],[C,8],
 [G,4],[g,4],[g,8],[g,8],
 [a,4],[D,4],[b,4],
 [C,2]] @=> int t2[][];

// Play a fragment
fun void playTune(int aTune[][]) {
    for( 0 => int i; i < aTune.cap(); i++) {
        std.mtof( aTune[i][0] ) => s.freq;
        1.0 => s.noteOn;
        240000::ms / ( aTune[i][1] * tempo ) => now;
    }
}

// Main: play the whole song
playTune(t1);
playTune(t1);
playTune(t2);
playTune(t2);
playTune(t1);
playTune(t1);
