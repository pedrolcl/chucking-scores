// Westminster chimes

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
TubeBell s => JCRev r => dac;

.9 => s.gain;
.8 => r.gain;
.2 => r.mix;

// MIDI notes
67 => int g;
72 => int C;
74 => int D;
76 => int E;

// Melody 
[[C,4],[E,4],[D,4],[g,2],[C,4],[D,4],[E,4],[C,2],
 [E,4],[C,4],[D,4],[g,2],[g,4],[D,4],[E,4],[C,2]] @=> int tune[][];

-6 => int transport;
80 => int tempo;

// Play 
for( 0 => int i; i < tune.cap(); i++) {
    std.mtof( tune[i][0] + transport ) => s.freq;
    1.0 => s.noteOn;
    240000::ms / ( tune[i][1] * tempo ) => now;
}
