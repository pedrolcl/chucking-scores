\version "2.5"
\score {
    <<
        \context Staff << 
            \context Voice {
                \clef treble
                \cadenzaOn
                c'4 d' e' f' g' a' b' c''2
                \cadenzaOff
            }
        >>
    >>
    \layout {
        papersize = "a4"
        \context {
          \Staff
            whichBar = #""
            \remove "Time_signature_engraver"
        }
    }
}
