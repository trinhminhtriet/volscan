Output images/demo.gif

Set FontSize 16
Set Width 1440
Set Height 768
Set TypingSpeed 400ms

Type@100ms "echo 'https://trinhminhtriet.com'"
Sleep 50ms
Enter

Type@450ms "volscan scan ~/ --output=output.json --threads=20"
Sleep 50ms
Enter
Sleep 5s

Type@450ms "volscan parse output.json --prefix=/System/ --sort=size"
Sleep 100ms
Enter
Sleep 20s
