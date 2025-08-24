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

#==================================================================================================================
#==================================================================================================================
# Shared Classes
#==================================================================================================================
#==================================================================================================================

#------------------------------------------------------------------------------------------------------------------
# A Person's Role in a Movie or TV Show
#------------------------------------------------------------------------------------------------------------------

Class Credit {

    [String] $Type
    [String] $Role
    [String] $Name
    [String] $OriginalName
    [String] $ID
    [String] $CreditID
    [Int]    $CreditOrder
    [String] $ProfileImagePath
    [String] $ProfileImageURL

    Credit ( ) {}

    Credit ( [String] $Type, [String] $Role, [String] $Name, [String] $ID ) { 
        $this.Type = $Type
        $this.Role = $Role
        $this.Name = $Name
        $this.ID   = $ID 
    }

    Credit ( [String] $Type, [String] $Role, [String] $Name ) { 
        $this.Type = $Type
        $this.Role = $Role
        $this.Name = $Name
    }

    Credit ( [String] $Role, [String] $Name ) { 
        $this.Role = $Role
        $this.Name = $Name
    }

    Credit ( [String] $Name ) { 
        $this.Name = $Name
    }

    Credit ( [Hashtable] $Info ) {
        $Info.Keys | ForEach-Object {
            if ( $this.PSObject.Properties.Match($_) ) {
                $this."$($_)" = $Info."$($_)"
            }
        }
    }

}

#------------------------------------------------------------------------------------------------------------------
# The Rating assigned by the Motion Picture or Broadcast Association (G, R, TV-G, TV-14, etc.)
#------------------------------------------------------------------------------------------------------------------

Class ContentRating {

    [String]   $Country
    [String]   $Rating
    [String[]] $Descriptors

    ContentRating ( ) {}

    ContentRating ( [String] $Country, [String] $Rating, [String[]] $Descriptors ) { 
        $this.Country     = $Country
        $this.Rating      = $Rating
        $this.Descriptors = $Descriptors
    }

    ContentRating ( [String] $Country, [String] $Rating) { 
        $this.Country     = $Country
        $this.Rating      = $Rating
    }

    ContentRating ( [Hashtable] $Info ) {
        $Info.Keys | ForEach-Object {
            if ( $this.PSObject.Properties.Match($_) ) {
                $this."$($_)" = $Info."$($_)"
            }
        }
    }

}

#------------------------------------------------------------------------------------------------------------------
# A Studio or Network involved in the production. (Disney, Hulu, HBO, FX, etc...)
#------------------------------------------------------------------------------------------------------------------

Class Entity {

    [String] $Name
    [String] $ID
    [String] $Country
    [String] $LogoPath
    [String] $LogoURL

    Entity ( ) {}

    Entity ( [String] $Name, [String] $ID, [String] $Country, [String] $LogoPath, [String] $LogoURL ) { 
        $this.Name     = $Name
        $this.ID       = $ID
        $this.Country  = $Country
        $this.LogoPath = $LogoPath
        $this.LogoPath = $LogoURL
    }

    Entity ( [String] $Name, [String] $ID ) { 
        $this.Name = $Name
        $this.ID   = $ID
    }

    Entity ( [String] $Name ) { 
        $this.Name = $Name
    }

    Entity ( [Hashtable] $Info ) {
        $Info.Keys | ForEach-Object {
            if ( $this.PSObject.Properties.Match($_) ) {
                $this."$($_)" = $Info."$($_)"
            }
        }
    }

}

#------------------------------------------------------------------------------------------------------------------
# A generic item used for basic lists.
#------------------------------------------------------------------------------------------------------------------

Class Item {

    [String] $Name
    [String] $ID

    Item ( ) {}

    Item ( [String] $Name, [String] $ID ) { 
        $this.Name = $Name
        $this.ID   = $ID
    }

    Item ( [String] $Name ) { 
        $this.Name = $Name
    }

    Item ( [Hashtable] $Info ) {
        $Info.Keys | ForEach-Object {
            if ( $this.PSObject.Properties.Match($_) ) {
                $this."$($_)" = $Info."$($_)"
            }
        }
    }

}

#------------------------------------------------------------------------------------------------------------------
# An image associated with the content (Poster, Background, Logo or Still Image)
#------------------------------------------------------------------------------------------------------------------
Class Image {

    [String]  $Type
    [Decimal] $AspectRatio
    [Int]     $Height
    [Int]     $Width
    [String]  $Language
    [String]  $Path
    [String]  $URL

    Image ( ) {}

    Image ( [String] $Type, [Decimal] $AspectRatio, [Int] $Height, [Int] $Width, [String] $Language, [String] $Path, [String] $URL ) { 
        $this.Type        = $Type
        $this.AspectRatio = $AspectRatio
        $this.Height      = $Height
        $this.Width       = $Width
        $this.Language    = $Language
        $this.Path        = $Path
        $this.URL         = $URL
    }

    Image ( [Hashtable] $Info ) {
        $Info.Keys | ForEach-Object {
            if ( $this.PSObject.Properties.Match($_) ) {
                $this."$($_)" = $Info."$($_)"
            }
        }
    }

}

#==================================================================================================================
#==================================================================================================================
# TVShow Classes
#==================================================================================================================
#==================================================================================================================

Class TVShow {

    [String]          $Source
    [String]          $ID

    [String]          $Name
    [String]          $OriginalName
    [String]          $Description
    [String]          $Rating
    [ContentRating[]] $Ratings
    [String]          $Genre
    [Item[]]          $Genres

    [Credit[]]        $Creators
    [Credit[]]        $Cast
    [Credit[]]        $Crew

    [String]          $Year
    [String]          $FirstAirDate
    [String]          $LastAirDate

    [int32]           $TotalSeasons
    [int32]           $TotalEpisodes

    [Boolean]         $InProduction
    [String]          $Status
    [String[]]        $Country
    [Entity[]]        $Studios
    [Entity[]]        $Networks

    [String]          $HomePage
    [String]          $PosterPath
    [String]          $BackdropPath
    [String]          $PosterURL
    [String]          $BackdropURL

    [TVSeason[]]      $Seasons = @()

    [TVEpisode[]]     $Episodes = @()
    [TVEpisode]       $LastEpisode
    [TVEpisode]       $NextEpisode

    [Item[]]          $ExternalIDs
    [Image[]]         $Images

    TVShow ( ) {}

    TVShow ( [String] $Name ) { $this.Name = $Name }

    TVShow ( [Hashtable] $Info ) {
        $Info.Keys | ForEach-Object {
            if ( $this.PSObject.Properties.Match($_) ) {
                $this."$($_)" = $Info."$($_)"
            }
        }
    }

}

Class TVSeason {

    [String]      $Source
    [String]      $ID
    [String]      $ShowID
   
    [int32]       $Number
    [String]      $Name
    [String]      $Description

    [Credit[]]    $Cast
    [Credit[]]    $Crew
   
    [String]      $Network
    [String]      $Year
    [String]      $FirstAirDate
    [String]      $LastAirDate
    [int32]       $TotalEpisodes
   
    [String]      $PosterPath
    [String]      $BackdropPath
    [String]      $PosterURL
    [String]      $BackdropURL

    [TVEpisode[]] $Episodes = @()

    [Item[]]      $ExternalIDs
    [Image[]]     $Images

    TVSeason ( ) {}

    TVSeason ( [int32] $Number ) { $this.Number = $Number }

    TVSeason ( [Hashtable] $Info ) {
        $Info.Keys | ForEach-Object {
            if ( $this.PSObject.Properties.Match($_) ) {
                $this."$($_)" = $Info."$($_)"
            }
        }
    }

}

Class TVEpisode {

    [String]      $Source
    [String]      $ID
    [String]      $SeasonID
    [String]      $ShowID
       
    [int32]       $Season
    [int32]       $Number
    [String]      $Type
    [String]      $Title
    [String]      $Description
    [String]      $LongDescription

    [Credit[]]    $Cast
    [Credit[]]    $Crew
    [Credit[]]    $Guests

    [String]      $ProductionCode
    [String]      $AirDate
    [String]      $Network
    [int32]       $Runtime
   
    [String]      $StillPath
    [String]      $StillURL

    [Item[]]      $ExternalIDs
    [Image[]]     $Images

    TVEpisode ( ) {}

    TVEpisode ( [int32] $SeasonNumber, [int32] $EpisodeNumber, [String] $Title ) { 
        $this.Season = $SeasonNumber
        $this.Number = $EpisodeNumber
        $this.Title  = $Title 
    }

    TVEpisode ( [int32] $SeasonNumber, [int32] $EpisodeNumber) { 
        $this.Season = $SeasonNumber
        $this.Number = $EpisodeNumber
    }

    TVEpisode ( [Hashtable] $Info ) {
        $Info.Keys | ForEach-Object {
            if ( $this.PSObject.Properties.Match($_) ) {
                $this."$($_)" = $Info."$($_)"
            }
        }
    }

}

#==================================================================================================================
#==================================================================================================================
# Movie Classes
#==================================================================================================================
#==================================================================================================================



#==================================================================================================================
#==================================================================================================================
# Media File Classes
#==================================================================================================================
#==================================================================================================================

