# deps
Automatic Makefile generation for data processing pipelines from command line history

deps is a zshell function that contains a collection of useful subcommands for generating and managing makefiles automatically from the commandline history. Useful for datascience projects that involve extended pipelines of exploratory data processing and file manipulation from the command line.

## Quick Start

First, source the deps file and create a Makefile at the root of your project using `deps init`.

As you create files using standard redirects `echo 'data' > data`, you can add them to the Makefile with the simple command `deps add data`, which searches the history for a redirect to the data file ("> data") and uses that command as the recipe, with dependencies heuristically extracted therefrom.

When you inevitably discover, 42 steps into your analysis, that there was a formatting error in your original data file, you can now simply correct it and run `make` to rebuild all the subsequent files you have tracked using deps.

See the documentation section for a complete list of utility commands for managing the Makefile.

## Documentation