// Good morning to All
// Composed in 1893 by Mildred J. Hill and Patty S. Hill
// This song is in the public domain

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

// run this command if you want to "freeze" the score:
// $ chuck morning.ck 2> frozen.ck

// patch
triosc s => dac;
.5 => s.gain;

// MIDI notes
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

// Melody 
[[g,4],[a,4],[g,4],[C,4],[b,2],
 [g,4],[a,4],[g,4],[D,4],[C,2],
 [g,4],[G,4],[E,4],[C,4],[b,4],[a,1],
 [F,4],[E,4],[C,4],[D,4],[C,3]] @=> int tune[][];

120 => int tempo;
fun dur duration(int d) {
    if ( d == 1 || d == 2 || d == 4 || d == 8 ) 
        return 240000::ms / ( d * tempo );
    else if ( d == 3 ) 
        return duration(2) + duration(4);
    else 
        return 0::ms;
}

0 => int transport;
float fr;
dur du;

<<< "triosc s => dac;","" >>>;
<<< ".5 => s.gain;","" >>>;
for( 0 => int i; i < tune.cap(); i++) {
    std.mtof( tune[i][0] + transport ) => fr =>s.freq;
    duration( tune[i][1] ) => du => now;
    <<< fr,"=> s.freq;",du,"::samp => now;" >>>;
}
