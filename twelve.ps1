# This script recites the lyrics to the song
# The Twelve Days of Christmas
# Script copyright 2020 by James K. Lawless (MIT/X11)
# See github repo for full license info
# https://github.com/jimlawless/TwelveDays

Add-Type -AssemblyName System.speech
$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
$days=@(("first", "a partridge in a pear tree." ),
   ("second","two turtle doves,"),
   ("third","three French hens,"),
   ("fourth","four calling birds,"),
   ("fifth","five golden rings,"),
   ("sixth","six geese a laying"),
   ("seventh","seven swans a swimming,"),
   ("eighth","eight maids a milking,"),
   ("ninth","nine ladies dancing"),
   ("tenth","ten lords a leaping,"),
   ("elevnth","eleven pipers piping,"),
   ("twelfth","twelve drummers drumming,")
)

for($i=0;$i -lt 12;$i++) {
    $speak.Speak("On the " + $days[$i][0] + " day of Christmas, my true love gave to me")
    for($j=$i;$j -ge 0;$j--) {
        if(($j -eq 0) -and ($i -ne 0)) {
           $speak.Speak("and " + $days[$j][1])
        }
        else {
            $speak.Speak($days[$j][1])
        }
    }
}

