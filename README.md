# deps
Automatic Makefile generation for data processing pipelines from command line history

deps is a zshell function that contains a collection of useful subcommands for generating and managing makefiles automatically from the commandline history. Useful for datascience projects that involve extended pipelines of exploratory data processing and file manipulation from the command line.

## Quick Start

First, source the deps file and create a Makefile at the root of your project using `deps init`.

As you create files using standard redirects `echo 'data' > data`, you can add them to the Makefile with the simple command `deps add data`, which searches the history for a redirect to the data file ("> data") and uses that command as the recipe, with dependencies heuristically extracted therefrom.

When you inevitably discover, 42 steps into your analysis, that there was a formatting error in your original data file, you can now simply correct it and run `make` to rebuild all the subsequent files you have tracked using deps.

See the documentation section for a complete list of utility commands for managing the Makefile.

## Documentation

```
add [FILE...] - Heuristically scans history for recipe that created FILE and adds to Makefile. Recipes must contain redirects to FILE (eg "> FILE"). Dependencies are determined by tokens contained in recipe that refer to current files. Must be run from directory where command was first executed.
comment TARGET [COMMENT] - Sets or prints a short comment associated with the recipe for TARGET. Useful for quick notes annotating generated files. If COMMENT is present, set the comment, otherwise print.
edit TARGET - Places the recipe for TARGET on the command line so it can be modified and re-added to the Makefile if needed.
--help|-h|help [SUBCOMMAND] - Prints help text for SUBCOMMAND. If SUBCOMMAND omitted, prints list of subcommands.
init  - Creates a new Makefile in the current directory. Use before other commands that attempt to modify the Makefile.
less  - Opens the Makefile in less.
mv SOURCE DEST - Moves a file with mv and updates the Makefile accordingly.
rm TARGET - Unsets the recipe for building TARGET from the Makefile and deletes the corresponding file.
set TARGET [DEPENDENCY...] - Creates a new recipe for TARGET using DEPENDENCY and a recipe from stdin.
unset TARGET - Deletes the recipe for building TARGET from the Makefile.
```
