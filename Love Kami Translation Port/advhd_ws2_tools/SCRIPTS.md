# Editing scripts

Decompiled script is a pseudo code that lists commands used by the game engine.
Command names are assumed by me, so some are `Unk**` because I don't know what they do, and some have normal names like `RunFile`, `StartTimer`, `StopMusic` because it's easy to guess.

It's possible that some commands mean different things, but the way it is now, it's easy to edit and tweak, even if you want to do more than just translate text.

Game script files are self-contained. Everything in a script file (e.g. `AFT_005_E.ws2`) is only relevant to that file. You can call the next file (e.g. `NextFile (AFT_006_1_E)`), but internal values will be reset (message ids, pointers).

Things to keep in mind:
1. Each line in the file is a command, except 2 commands.
2. Empty lines are ignored, so it's OK to add them.
3. Lines with `@` are labels, places where the script will jump from some condition.

## Comments
Lines with comments (starting with `#`) are ignored, so you can add your notes without breaking the script.

You can comment on whole blocks by adding lines `/*` and `*/`. All lines between these 2 will be ignored. Note that they should be on separate lines, not at the beginning of the current line.

```
# SetFlag (1026, 1)                     <--- This is correct
/*
SetDisplayName (0, '%LCAoi')            <--- This is also correct
DisplayMessage (0, char, 0
\dHmmm...\d%K%P
);                                      <--- Last Line ignored 
*/
SetDisplayName (0, '')
# @todo - validate block below          <--- Still ok
/*SetDisplayName (0, '')                <--- Will not work
DisplayMessage (1, char, 0
It felt like I spent all my free time these\ndays puzzling over the same problem.%K%P
);
SetDisplayName (0, '') */               <--- Also will not work
```


## Text messages
Display Message command has 3 lines format, with the text in the middle line.
```
DisplayMessage (237, char, 0
It was a day, like any other, and it ended\nquietly.%K%P
);

SetDisplayName (0, '%LCAoi')
DisplayMessage (58, char, 0
\dYou've gotten really good! There was a\ncrosswind, but your takeoff was still\nperfect!\d%K%P
);

DisplayMessage (234, char, 0
「じゃーね」%K%P
);
```
Each line of text has a unique ID (`237`, `58`, `234` here) which is used by the game engine to store the lines read.
These IDs should be unique.
All IDs are renumbered when the script is compiled, so it's ok to use any number, even if it's the same as a previous message.

The game uses formatting.
`\n` means “next line” in the game engine.
`\d` are “quotes” for English, JP will use `「」`, but it might be game dependent and not required.
`%K%P` some internal line end, exists on every line.

This is what the line will look like in the game:
```
"You've gotten really good! There was a
crosswind, but your takeoff was still
perfect!"
```

## Show Choice
Another multi-line command. The number of lines depends on the number of choices. Could have next file or pointer as last parameter.
```
ShowChoice (2
207, 0, 11, 0, 7, YOZORA_COM_402A_A
返したくない
208, 0, 12, 0, 7, YOZORA_COM_402A_B
おとなしく返す
);
```
First param (`207`, `208`) is unique ID, the same increment id from messages.

Forth - jump type. `6` is pointer inside file, `7` is next file to read. Fifth - depends on the previous one.

## SetDisplayName
It's also a little different from others cases.
```
// Description/thought
SetDisplayName (0, '')
// A sky full of stars characted
SetDisplayName (0, '%LF暁斗')
// IMHHW Character
SetDisplayName (0, '%LCAoi') 
```
As it may be empty, this string is enclosed in quotes `'`.
`%LC` and `%LF` are game engine data, depends on the current game, but mostly constant inside it. Then goes character name. 

# In-Depth code updates
Most function has some kind of params applied.
```
RunFile (LAYER_ORDER)
LayerConfig (0, 10, 0, 1)
MoveBackground (bg01, 0, 0, 0, -640, -360, 0, 0)
SetBackground (bg02, BG_19G_L.PNG)
```
There is a format which should be used in case you want to update them.

1. There is a space between the function name and the `SetBackground (`) bracket. This should be kept.
2. The function name is the name of the file, changing it will break the generation.
3. Params are separated by comma AND space `, `. In most cases it's for visibility.
4. Sometimes it's possible to see several commas one after the other `RainStart (rain01, PICTURE00, PICTURE00, , 0, 188,` - this means that there is an empty string here.

## Some possibilities
You can change character's face, image, position.
```
UsePnaPackage (st01, D亜紗_01M.PNA, 1, 1)
DisplayCharacterImage (st01, 2, 1, 3, 68, 38, 0)
```
These lines mean that the game will refer to the file `D亜紗_01M.PNA` as variable `st01`.
It will then use images with ids 68, 38 and 0 from this file, combining character look (68), face (38) and ribbons (0). Validate PNA files via GARbro.

Move character images in different positions.
```
UsePnaPackage (st02, 遙ST01_L.PNA, 1, 1)
DisplayCharacterImage (st02, 2, 1, 2, 46, 27)
MoveBackground (st02, 6, 0, 240, 10, 11, 12, 13)
MoveBackground (st02, 0, 0, 0, 504, -100, 0, 0)
```

Set CG image as visited or show them in the gallery
```
SetFlag (1673, 1)

Condition (2, 1673, 1, 0, @LABEL_86)
ExecuteFunction (openCgBrowser, KAN_03_001S.png, 0, 0)
Condition (130, 99, -1, 0, @LABEL_86)
Jump (@LABEL_12394)
@LABEL_86
```

Keep in mind, that some commands are linked, and you can’t just copy one line without some next ones. For complex script changes only.

### Conditions

Some scripts may have conditions applied. Mostly these are route choices or gallery pages.
These conditions are also the main reason why labels are used. Labels point to the specific line of the script where the execution code will jump in some cases.

```
Condition (130, 99, -1, 0, @LABEL_86)
```
* The first param here is the condition type. 1 does nothing, others (2,128,129,130) are some cases - equal, less, more, more or equal, etc. Not sure which is which.
* Second points to the variable id (flag).
* Third is most likely the value we are comparing it to. Could be different depending on the type of comparison.
* Fourth and fifth - are pointers to where the code will jump if the condition returns true or false.

A label is created when script finds a pointer to a specific location in the code. So if you have a `@LABEL` inside a condition - make sure you put it somewhere in the code on a separate line.

The name of the label is irrelevant, it should just start with `@`. Ex: `@LABEL_123`, `@LABEL`, `@AKANE_ROUTE_END`, so you can rename them if you want, but be sure to replace all names of changed label within a file.
Decompiling the updated code again will change the names back to `@LABEL_***`.