$location = Read-Host "
On stream où ?

1 - Perso
2 - Consolefun
"

$game = Read-Host "
On joue à quoi ?

1 - Guitar Hero
2 - Taiko
3 - Project Diva
4 - Rocksmith
5 - Autre
"

$talk = Read-Host "
On talk musique ? (y/n)
"
if ($talk -eq 'y') {
  $talkmsg = "Talk Music +"
  }
else {   
  $talkmsg = "" 
  }

Function Ask-Manette { 
Read-Host "
  T'as allumé la manette ? (y/n)"
  if ($manette -eq 'y') {
   Write-Host "
   Ok fais pas le malin..."
   }
}

if ($location -eq '1') {
  $loctweet = "Sur la chaine perso : https://www.twitch.tv/undead_woody"
  $profile = "Chaine Perso"
  $scenes = "Chaine Perso"
  }

if ($location -eq '2') {
  $loctweet = "Chez @Consolefun : https://www.twitch.tv/consolefunlive"
  $profile = "Consolefun"
  $scenes = "Consolefun"
  $panel = Read-Host "
  T'as activé le panel admin ? (y/n)"
  if ($panel -eq 'y') {
   Write-Host "
   Ok fais pas le malin..."
   }
  }

if ($game -eq '1') {
  Remove-Item 'E:\Games\Phase Shift\data\backgrounds\2d\*.png'
  Get-ChildItem 'E:\Games\Phase Shift\data\backgrounds\2d-stock\' | Get-Random -Count 70 | Copy-Item -Destination 'E:\Games\Phase Shift\data\backgrounds\2d\'
  Start-Process 'E:\Games\Phase Shift\phase_shift.exe' -WorkingDirectory "E:\Games\Phase Shift\"
  Start-Process "C:\Users\Undead Woody\Desktop\start chrome.bat" 
  $tweet = "'Live Guitar Hero. Maintenant. $loctweet Rock and Roll.'"
  $title = "!title $talkmsg Guitar Hero - Vous décidez de la playlist !songlist"
  $gamename = "!game Guitar Hero"
  }

if ($game -eq '2') {
  $tweet = "'Live Taiko. Maintenant. $loctweet Boum Boum.'"
  $title = "!title $talkmsg Taiko - Pincesse Tam Tam"
  $gamename = "!game Taiko no Tatsujin: Session de Dodon ga Don!"
  }

if ($game -eq '3') {
  $tweet = "'Live Project Diva. Maintenant. $loctweet Miku Miku.'"
  $title = "!title $talkmsg Project Diva - L'homme weaboo vs the world"
  $gamename = "!game Hatsune Miku: Project Diva Future Tone"
  }

if ($game -eq '4') {
  $tweet = "'Live Rocksmith. Maintenant. $loctweet On passe aux choses sérieuses.'"
  $title = "!title $talkmsg Rocksmith - On sort les vrais instrus"
  $gamename = "!game Rocksmith 2014"
  Start-Process 'E:\Games\Rocksmith 2014\Rocksmith2014.exe' -WorkingDirectory "E:\Games\Rocksmith 2014"
  }

if ($game -eq '5') {
  $askname = Read-Host "
    C'est quoi le nom du jeu ?
  "
  $asktitle = Read-Host "
    C'est quoi le titre du stream ?
  "
  $tweet = "'Live $askname. Maintenant. $loctweet Go go go.'"
  $title = "!title $talkmsg $asktitle"
  $gamename = "!game $askname"
  }

$confirmation = Read-Host "
On envoie un tweet ? (y/n)"
if ($confirmation -eq 'y') {
   Send-Tweet -Message $tweet
   Write-Host "
   Done !
   "
}
elseif ($confirmation -eq 'n'){ "
OK mec
" }
else { "
On a dit y ou n...
" }

Write-Host $title
Write-Host $gamename

$obspath = "C:\Program Files (x86)\obs-studio\bin\64bit\obs64.exe"
Start-Process -FilePath "$obspath" -ArgumentList "--profile `"$profile`" --collection `"$scenes`"" -WorkingDirectory "C:\Program Files (x86)\obs-studio\bin\64bit"

if ($location -eq '1') {
  start microsoft-edge:https://www.twitch.tv/popout/undead_woody/chat?popout=
  }

if ($location -eq '2') {
  start microsoft-edge:https://www.twitch.tv/popout/consolefunlive/chat?popout=
  start microsoft-edge:https://www.twitch.tv/popout/undead_woody/chat?popout=
  }

