#==================================================================================================================
#==================================================================================================================
# Sample Code :: Read AtomicParsley Atoms
#==================================================================================================================
#==================================================================================================================

#==================================================================================================================
# Initialize Test Environment
#==================================================================================================================

# Load the standard test initialization file.
. $(Join-Path -Path $PSScriptRoot -ChildPath '_init-test-environment.ps1')

# Override the Default Debug Logging Setting
  # $env:PS_STATUSMESSAGE_SHOW_VERBOSE_MESSAGES = $true

#==================================================================================================================
# Run Tests
#==================================================================================================================

# $testFileName = 'TVEpisodes/Breaking In - s01e06 - Breaking Out [1080p WS iTunes HD DD].m4v'
$testFileName = 'Movies/Zootopia (2016) [1080p WS BR SHQ20+2DA DD].m4v'

Write-Msg -p -ps -bb -m $( 'Test' ) -ForceWrite

$testPath = Join-Path -Path $mediaPath -ChildPath $testFileName
$testFile = [MediaFile]::New($testPath)
if ( $testFile.exists ) {

    $mpegData = Read-FFmpegFileProperties -File $testPath
    if ( $mpegData.success ) {
        $testFile.SetMPEGproperties( $mpegData.value )
    }

    $atomData = Read-AtomicParsleyAtoms -File $testPath
    if ( $atomData.success ) {
        $testFile.SetATOMproperties( $atomData.value )
    }

    $testFile

}
else {
    Write-Msg -e -ps -ds -m 'Test file "{0}" not found.'
}
