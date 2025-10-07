# PowerShell Module: Media Classes

## Description
Provides a set of reusable PowerShell classes for media files:
  - Movie
  - TVShow
  - TVSeason
  - TVEpisode
  - Credit (Person/Role)
  - ContentRating (G, PG, TV-14, etc...)
  - Entity (Network or Studio)
  - Image (Poster, Background, Logo or Still)
  - Item (Generic Item)
  - MediaFile (an MP4 or M4V file with iTunes-style Metadata)


## How to Use this Module
1. Download the module and place it one of the folders defined in your the following path: 
    ```
    $env:PSModulePath path
    ```
2. Add an "Import-Module" statement to your code or add po.MediaClasses to the "RequiredModules" module definition
   (psd1 file):
    ```
    import module po.MediaClasses
    ```
  **NOTE:** If a PowerShell module containing a custom class uses the "Module/VERSION#/module.psd1" 
  file structure (common when pulling from publishing repos) instead of the "Module/module.psd1" structure, VSCode/PSScriptAnalyzer will not find the module when using the "using module" 
  statement and will throw linting errors for all the custom types.


## Available Properties and Methods
All classes are defined in the modules *.psm1 file [here](https://github.com/seabopo/PowerShell-MediaClasses/blob/main/po.MediaClasses/po.MediaClasses.psm1).


## Notes About Using Classes and Enums in PowerShell

PowerShell's class implementation has several limitations which Microsoft has documented 
[here](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_using?view=powershell-7.5#module-syntax), and which I have included below:

### [Manually Importing Enumerations from a PowerShell Module](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_enum?view=powershell-7.5#manually-importing-enumerations-from-a-powershell-module) 

Import-Module and the #Requires statement only import the module functions, aliases, and variables, as defined by the module. Enumerations aren't imported.

If a module defines classes and enumerations but doesn't add type accelerators for those types, use a using module statement to import them.

The **using** module statement imports classes and enumerations from the root module (ModuleToProcess) of a script module or binary module. ***It doesn't consistently import classes defined in nested modules or classes defined in scripts that are dot-sourced into the root module.*** Define classes that you want to be available to users outside of the module directly in the root module.

For more information about the using statement, see [about_Using](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_using?view=powershell-7.5).

### [Loading Newly Changed Code During Development](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_enum?view=powershell-7.5#loading-newly-changed-code-during-development)

During development of a script module, it's common to make changes to the code then load the new version of the module using Import-Module with the Force parameter. This works for changes to functions in the root module only. Import-Module doesn't reload any nested modules. Also, there's no way to load any updated classes.

To ensure that you're running the latest version, you must start a new session. Classes and enumerations defined in PowerShell and imported with a using statement can't be unloaded.

Another common development practice is to separate your code into different files. If you have function in one file that use enumerations defined in another module, you should using the using module statement to ensure that the functions have the enumeration definitions that are needed.


### The "ScriptsToProcess" Work-Around
The PowerShell community reports that creating separate .PS1 files for classes will work reliably if the files
are defined in the module's **ScriptsToProcess** property, which is defined in the module .psd1 file.

For Example:
````
# Script files (.ps1) that are run in the caller's environment prior to importing this module.

  ScriptsToProcess = @('classes\myClass1.ps1','classes\myClass2.ps1')

````

Using this method also allows users to use the 'Import-Module' statement instead of the 'using module' statement.
