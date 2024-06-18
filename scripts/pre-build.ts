import * as shell from "shelljs";

// Copy all the view templates
shell.rm( "-rf", "dist/" );
shell.mkdir( "dist" );
shell.cp( "-R", "src/views", "dist" );