---
title: "Obc-3 Library Extensions"
---

obc-3-libext
============

This is a collection of Oberon-7 extension modules based on
some of Karl Landström's [OBNC](http://miasap.se/obnc/) extended 
library but implemented to be compatible with Mike Spivey's 
[Obc-3](https://github.com/Spivoxity/obc-3) compiler.

Modules
-------

The follow modules have been ported from OBNC's extended library.

| Name       | Description                           | Documentation |
|------------|---------------------------------------|---------------|
| [extArgs.m](extArgs.m)    | Access argv, argc in Oberon           | [extArgs.def](https://miasap.se/obnc/obncdoc/ext/extArgs.def.html "documentation") |
| [extConvert.m](extConvert.m) | Convert ARRAY OF CHAR, INTEGER, REAL  | [extConvert.def](https://miasap.se/obnc/obncdoc/ext/extConvert.def.html "documentation") |
| [extEnv.m](extEnv.m)     | Access environment variables          | [extEnv.def](https://miasap.se/obnc/obncdoc/ext/extEnv.def.html "documentation") |

About the file names
--------------------

I've kept the names of Karl's modules in order for them to function
as a drop in replacement for projects where I need compatibility
between OBNC extended code and Obc-3 compiler.

While obc-3 supports several file extensions for Oberon files I've
found it easiest to adopt Mike Spivey's convention of using `.m`.
When not using obc-3 in a project I prefer the `.Mod` which is
traditional in the Oberon System's community. This also makes it
clear that they are not the same modules as I wrote for use with
OBNC.


