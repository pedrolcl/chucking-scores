\version "2.4.0"
\header {
    composer = "J. S. Bach"
    subtitle = "BWV 645"
    title = "Wachet auf, ruft uns die Stimme"
    tagline = "Exported by Rosegarden 4-1.2.3"
    footer = "Rosegarden 4-1.2.3"
}
#(set-global-staff-size 16)
\score {
    \context PianoStaff <<
        \time 4/4
        \context Staff = "right hand 1" << 
            \context Voice = "voice 0" {
                \clef treble
                \key ees \major
                \partial 8*1 bes 8 
                ees' 16 f' g' 8 g' f' aes' g' bes aes 
                g' 16 ees' f' 8 aes g d' ees' r bes 
                ees' 16 f' g' 8 g' f' aes' g' bes aes 
%% 5
                g' 16 ees' f' 8 aes g d' ees' r bes' 
                bes' 4 aes' 16 g' f' ees' f' ees' d' c' bes 8 c' 16 d' 
                ees' 16 f' g' f' aes' g' f' ees' g' 8 f' r bes 
                g' 8 a' 4 bes' 8 ees' 16 d' ees' 8 r c' 
                a' 8 bes' 4 c'' 8 ees' 16 d' ees' 8 r ees'' 
%% 10
                d'' 16 c'' bes' 8 bes' 16 a' bes' 8. a' 16 g' f' ees' d' c' bes 
                c' 16 d' ees' 8 ees' 16 d' ees' 8. a' 16 bes' c'' bes' a' g' f' 
                bes' 8 f' d' c' 16 bes bes ees' d' c' d' 8 bes 
                g 8. a 16 a 8. g 32 a bes 4 r8 bes 
                ees' 16 f' g' 8 g' f' aes' g' bes aes 
%% 15
                g' 16 ees' f' 8 aes g d' ees' r4 
                r4. bes' 8 bes' 4 aes' 16 g' f' ees' 
                f' 16 ees' d' c' bes 8 c' 16 d' ees' f' g' f' aes' g' f' ees' 
                g' 8 f' r f' c'' d'' 4 ees'' 8 
                aes' 16 g' aes' 8 r c'' d'' ees'' 4 f'' 8 
%% 20
                aes' 16 g' aes' 8 r f' g' 16 f' ees' 8. d' 16 ees' 8 
                r16 des'' 16 c'' bes' aes' g' f' ees' f' g' aes' 8. g' 16 aes' 8 
                r16 d' 16 ees' f' ees' d' c' bes bes' 8 ees' g' 16 f' ees' d' 
                ees' 16 aes' g' f' g' 8 ees' c' 8. d' 16 d' 8. ees' 16
                ees' 1 

                 \bar "|."
            } % Voice
        >> % Staff
        \context Staff = "left hand 2" << 
            \context Voice = "voice 1" {
                \clef bass
                \time 4/4
                \key ees \major
                \partial 8*1 r 8 
                ees, 4 ees, ees, g, 
                aes, 4 bes, ees, r 
                ees, 4 ees, ees, g, 
%% 5
                aes, 4 bes, ees, r 
                g, 4 c bes, aes, 
                g, 4 ees, bes, d 
                ees 4 d c ees 
                f 4 g a f 
%% 10
                bes 4 a g f 
                ees 4 d c ees 
                d 8 bes, f f, g, a, bes, d 
                ees 8 c f 4 bes, 8 c bes, aes, 
                g, 8 f, ees, d, c, 4 c 
%% 15
                aes, 4 bes, ees, ees 
                d 8 c bes, aes, g, 4 c 
                bes, 4 aes, g, ees, 
                bes, 4 d aes g 
                f 4 ees f bes, 
%% 20
                c 4 aes, bes, g, 
                aes, 8 g, f, ees, d, 4 f, 
                bes, 8 c bes, aes, g, c aes, bes, 
                c 8 d ees g aes f bes bes, 
                ees 1 

                 \bar "|."
            } % Voice
        >> % Staff (final)
    >> % PianoStaff
    \layout { papersize = "a4" }
} % score
