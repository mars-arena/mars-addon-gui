## Extract

```
e[xtract] MpqFile FileName [TargetDir] [/listfile FileName] [/fp] [/lower]

Extracts one or more files from MPQ Archive.

MpqFile       Name of the MPQ to be used for this operation.
FileName      Full name of file (or wildcard) in the MPQ.
TargetDir     Target dir. If not entered, the current dir will be used.
/listfile fn  Uses listfile for extraction
/fp           Forces extraction with the path stored in MPQ file
/lower        Creates lowercase path
```

```
a[dd] MpqFile [SourceFile] [TargetName] [/wav] [/c] [/auto] [/r]

Adds one or more files into the MPQ. Replaces existing files.

  MpqFile       Name of the MPQ to be used for this operation.
  SourceFile    Name of source file. Can contain wildcards.
  TargetName    Target file name (or directory name) in MPQ.
  /wave         Add the file as WAVE file
  /c            Use data file compression
  /auto         Choose compression by file type
  /r            Recurse subdirectories
```
