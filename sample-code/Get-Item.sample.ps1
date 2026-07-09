#==================================================================================================================
#==================================================================================================================
# Test: [MediaFile]::new()
#==================================================================================================================
#==================================================================================================================

#==================================================================================================================
# Initialize Test Environment
#==================================================================================================================

  # Load the standard test initialization file.
  . $(Join-Path -Path $PSScriptRoot -ChildPath '_init-test-environment.ps1')

  # Enable Debugging
    $env:PS_STATUSMESSAGE_VERBOSE_MESSAGE_TYPES = '["Process","Information","Debug","FunctionCall","FunctionResult"]'
    $env:PS_STATUSMESSAGE_SHOW_VERBOSE_MESSAGES = $false

#==================================================================================================================
# Testing
#==================================================================================================================

  # Import the MediaClasses module to load the classes in the local user session.
    Import-Module '../po.MediaClasses'

  # Test a Movie
    Write-Msg -h -ps -bb -m $( ' Test Movie' )
    $mp = '/Volumes/Media/Movies/1080p/John Wick/John Wick (1) (2014) [1080p WS iTunes HD DD].m4v'
    $m = [MediaFile]::new($mp)
    $r = Read-AtomicParsleyAtoms -File $($mp)
    if ( $r.success ) { $m.SetTags($r.value) } else { Write-Msg -e -il 2 -m $r.message }
    $r = Get-MediaInfoSummary -File $($mp)
    if ( $r.success ) { $m.SetEncoding($r.value) } else { Write-Msg -e -il 2 -m $r.message }
    Write-Msg -a -o $m
  
  # Test a TV Episode
    Write-Msg -h -ps -bb -m $( ' Test TV Episode' )
    $mp = '/Volumes/Media/TV Shows/Complete Series 1/Alias (2001)/Season 01/Alias - s01e01 - Truth Be Told [1080p WS IT HD DD].m4v'
    $e = [MediaFile]::new($mp)
    $r = Read-AtomicParsleyAtoms -File $($mp)
    if ( $r.success ) { $e.SetTags($r.value) } else { Write-Msg -e -il 2 -m $r.message }
    $r = Get-MediaInfoSummary -File $($mp)
    if ( $r.success ) { $e.SetEncoding($r.value) } else { Write-Msg -e -il 2 -m $r.message }
    Write-Msg -a -o $e

  exit
