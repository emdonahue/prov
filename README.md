# deps
Automatic Makefile generation and dependency management for data processing pipelines from commandline history

deps is a zshell function that contains a collection of subcommands for generating and managing makefiles automatically from your commandline history. Useful for datascience projects that involve extended pipelines of exploratory data processing and file manipulation from the command line.

## Quick Start

First, source the deps file and create a Makefile at the root of your project using `deps init`.

As you create files using standard redirects `echo 'data' > datafile`, you can add them to the Makefile with the simple command `deps add datafile`, which searches the history for a redirect to the data file ("> datafile") and uses that command as the recipe, with dependencies heuristically extracted therefrom. Commands that produce files without using redirects or that otherwise foil the heuristics used by add can be added manually with `deps set`. The `deps set` subcommand accepts Makefile dependencies as arguments  and reads the recipe from stdin. The easiest way use this is to type `deps set dependency1 dependency2 <<'EOF'`, hit enter, then scroll up through your command history to find the command you want to use as the recipe, hit enter again, and type `EOF` again to complete the heredoc.

When you inevitably discover, 42 steps into your analysis, that there was a formatting error in your original data file, you can now simply correct it and run `make` to rebuild all the subsequent files you have tracked using deps.

See the documentation section for a complete list of utility commands for managing the Makefile.

## Documentation

```
--help|-h|help [SUBCOMMAND] - Prints help text and options for SUBCOMMAND. If SUBCOMMAND omitted, prints list of subcommands.
add [FILE...] - Heuristically scans history for recipe that created FILE and adds to Makefile. Recipes must contain redirects to FILE (eg "> FILE"). Dependencies are determined by tokens contained in recipe that refer to current files. Must be run from directory where command was first executed.
comment TARGET [COMMENT] - Sets or prints a short comment associated with the recipe for TARGET. Useful for quick notes annotating generated files. If COMMENT is present, set the comment, otherwise print.
cp SOURCE... DEST; Recursively copies the SOURCE files and folders to DEST - modifying their mutual dependencies to point to the new copies within a given cp command.
echo TARGET - Echoes the recipe for TARGET
edit TARGET - Places the recipe for TARGET on the command line so it can be modified and re-added to the Makefile if needed.
init  - Creates a new Makefile in the current directory. Use before other commands that attempt to modify the Makefile.
less  - Opens the Makefile in less.
mv SOURCE... DEST - Moves a file with mv and updates the Makefile accordingly.
rm TARGET - Unsets the recipe for building TARGET from the Makefile and deletes the corresponding file.
set TARGET [DEPENDENCY...] - Creates a new recipe for TARGET using DEPENDENCY and a recipe from stdin.
unset TARGET - Deletes the recipe for building TARGET from the Makefile.
```
## TODO
- make edit escape backslashes so they dont end up as ctrl chars
- escape sed patterns
