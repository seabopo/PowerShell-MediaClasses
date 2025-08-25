#==================================================================================================================
#==================================================================================================================
# po.MediaClasses
#==================================================================================================================
#==================================================================================================================
#
# Classes for all media-related objects: Movie, TVShow, TVSeason, TVEpisode, TVRating, Credits, Images, Files, ...
#
# All classes are in a single file because:
#   - The classes have parent/child relationships and the PowerShell extension in VSCode can't properly resolve 
#     the types when child classes are contained in separate files which causes the debugger to throw errors.
#   - All versions of PowerShell that support classes have an issues with reliably when loading classes that are
#     not defined in the root module (ModuleToProcess) of a script module. See: 
#     https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_enum?view=powershell-7.5
#
# Note that classes cannot be re-loaded in the PowerShell session, even when the module is unloaded or force
# loaded, so it is necessary to kill the PowerShell session and start a new session when changes to the class 
# have occurred.
#
#==================================================================================================================
#==================================================================================================================
# Module Initializations
#==================================================================================================================

    using namespace System.Collections.Generic
    using namespace System.Collections.Specialized
    using namespace System.Web.HttpUtility

    Set-Variable -Scope 'Script' -Name "PS_MODULE_ROOT"  -Value $PSScriptRoot
    Set-Variable -Scope 'Script' -Name "PS_MODULE_NAME"  -Value $($PSScriptRoot | Split-Path -Leaf)

#==================================================================================================================
# Load Functions and Export Public Functions and Aliases
#==================================================================================================================

  # Load all public functions
  # Get-ChildItem -Path "$PS_MODULE_ROOT/classes/*.ps1" -Recurse | ForEach-Object { . $($_.FullName) }
