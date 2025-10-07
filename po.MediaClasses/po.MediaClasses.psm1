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
#==================================================================================================================
# Shared Classes (Movies & TV Shows)
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
    [String] $ProfilePageURL

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
            if ( $this.PSObject.Properties.Match($_).count -eq 1 ) {
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
        $this.Country = $Country
        $this.Rating  = $Rating
    }

    ContentRating ( [Hashtable] $Info ) {
        $Info.Keys | ForEach-Object {
            if ( $this.PSObject.Properties.Match($_).count -eq 1 ) {
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
            if ( $this.PSObject.Properties.Match($_).count -eq 1 ) {
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
            if ( $this.PSObject.Properties.Match($_).count -eq 1 ) {
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
            if ( $this.PSObject.Properties.Match($_).count -eq 1 ) {
                $this."$($_)" = $Info."$($_)"
            }
        }
    }

}

#------------------------------------------------------------------------------------------------------------------
# An collection of media items.
#------------------------------------------------------------------------------------------------------------------

Class Collection {

    [String] $ID
    [String] $Name
    [String] $BackdropPath
    [String] $PosterPath
    [String] $BackdropURL
    [String] $PosterURL

    Collection ( ) {}

    Collection ( [String] $ID, [String] $Name ) {
        $this.ID   = $ID
        $this.Name = $Name
    }

    Collection ( [Hashtable] $Info ) {
        $Info.Keys | ForEach-Object {
            if ( $this.PSObject.Properties.Match($_).count -eq 1 ) {
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
    [String]          $RatingReason
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

    [String]          $LogoPath
    [String]          $BackdropPath
    [String]          $PosterPath
    [String]          $Poster16x9Path
    [String]          $PosterSquarePath
    [String]          $LogoURL
    [String]          $BackdropURL
    [String]          $PosterURL
    [String]          $Poster16x9URL
    [String]          $PosterSquareURL

    [TVSeason[]]      $Seasons

    [TVEpisode]       $LastEpisode
    [TVEpisode]       $NextEpisode

    [Item[]]          $ExternalIDs
    [Image[]]         $Images

  #-----------------------------------------------
  # Constructors
  #-----------------------------------------------

    TVShow ( ) {}

    TVShow ( [String] $Name ) { $this.Name = $Name }

    TVShow ( [Hashtable] $Info ) {
        $Info.Keys | ForEach-Object {
            if ( $this.PSObject.Properties.Match($_).count -eq 1 ) {
                $this."$($_)" = $Info."$($_)"
            }
        }
    }

  #-----------------------------------------------
  # Properties
  #-----------------------------------------------

  # Episodes Read-only Runtime Property.
  # Shows as null in the debugger as this is built/overwritten at runtime.
  # Values are not exported (duplicated) in the XML.
    [TVEpisode[]] $Episodes = $( $this | 
        Add-Member ScriptProperty 'Episodes' -Force {
            $( $this.Seasons | Select-Object -ExpandProperty 'Episodes' )
        }
    )

  #-----------------------------------------------
  # Methods
  #-----------------------------------------------

  # Get all episodes (requires parens "()" to work.)
    # [TVEpisode[]] Episodes ( ) {
    #     return $( $this.Seasons | Select-Object -ExpandProperty 'Episodes' )
    # }

  # Export the current TVShow object to a specified file path as a typed XML object.
    [void] ExportToCache ( [String] $FilePath ) {
        $this | Export-Clixml -LiteralPath $FilePath -Depth 100
        $this.Cache.SetCachePaths()
    }

  # Import a TVShow object from a typed XML definition.
    static [TVShow] ImportFromCache ( [String] $Path ) {
        if ( Test-Path -LiteralPath $Path -PathType Leaf -ErrorAction Ignore ) {
            [TVShow] $importedTVShow = Import-Clixml -LiteralPath $Path
        }
        else {
            Write-Msg -x -lc -m $('ImportFromCache: A valid file path was not provided. Provide a path ' + 
                                  'to a valid TVShow cache XML file.')
            break
        }
        return $importedTVShow
    }

}

Class TVSeason {

    [String]      $Source
    [String]      $ID
    [String]      $URL

    [String]      $ShowTitle
    [String]      $ShowID
    [String]      $ShowURL
   
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
   
    [String]      $BackdropPath
    [String]      $PosterPath
    [String]      $Poster16x9Path
    [String]      $PosterSquarePath
    [String]      $BackdropURL
    [String]      $PosterURL
    [String]      $Poster16x9URL
    [String]      $PosterSquareURL
    
    [TVEpisode[]] $Episodes

    [Item[]]      $ExternalIDs
    [Image[]]     $Images

    TVSeason ( ) {}

    TVSeason ( [int32] $Number ) { $this.Number = $Number }

    TVSeason ( [Hashtable] $Info ) {
        $Info.Keys | ForEach-Object {
            if ( $this.PSObject.Properties.Match($_).count -eq 1 ) {
                $this."$($_)" = $Info."$($_)"
            }
        }
    }

}

Class TVEpisode {

    [String]      $Source
    [String]      $ID
    [String]      $URL
    [String]      $SeasonID
    [String]      $SeasonURL
    [String]      $ShowID
    [String]      $ShowURL
       
    [int32]       $Season
    [int32]       $Number
    [int32]       $Index
    [Bool]        $IsFirstEpisode
    [String]      $Type
    [String]      $ShowTitle
    [String]      $Title
    [String]      $Description
    [String]      $Genre
    [Item[]]      $Genres
    [String]      $Rating

    [Credit[]]    $Cast
    [Credit[]]    $Crew
    [Credit[]]    $Guests
    
    [String]      $AirDate
    [String]      $ProductionCode
    [String]      $Network
    [int32]       $Runtime
   
    [String]      $BackdropPath
    [String]      $PosterPath
    [String]      $Poster16x9Path
    [String]      $PosterSquarePath
    [String]      $StillPath
    [String]      $BackdropURL
    [String]      $PosterURL
    [String]      $Poster16x9URL
    [String]      $PosterSquareURL
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
            if ( $this.PSObject.Properties.Match($_).count -eq 1 ) {
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

Class Movie {

    [String]            $Source
    [String]            $ID
    [Bool]              $Adult
  
    [String]            $Title
    [String]            $Tagline
    [String]            $OriginalTitle
    [String]            $OriginalLanguage
    [String]            $Description
    [String]            $Genre
    [Item[]]            $Genres
    [String]            $ReleaseDate
    [String]            $Year
    [String]            $Rating
    [String]            $RatingReason
    [ContentRating[]]   $Ratings
  
    [String]            $Status
    [Int]               $Runtime
    [Entity[]]          $Studios
    [Int]               $Budget
    [Int]               $Revenue
  
    [String]            $HomePage
    [String]            $LogoPath
    [String]            $BackdropPath
    [String]            $PosterPath
    [String]            $Poster16x9Path
    [String]            $LogoURL
    [String]            $BackdropURL
    [String]            $PosterURL
    [String]            $Poster16x9URL
  
    [Credit[]]          $Cast
    [Credit[]]          $Crew

    [Collection[]]      $Collections

    [Image[]]           $Images

    [Item[]]            $ExternalIDs

    Movie ( ) {}

    Movie ( [String] $Title ) {
        $this.Title  = $Title
    }

    Movie ( [Hashtable] $Info ) {
        $Info.Keys | ForEach-Object {
            if ( $this.PSObject.Properties.Match($_).count -eq 1 ) {
                $this."$($_)" = $Info."$($_)"
            }
        }
    }

}

#==================================================================================================================
#==================================================================================================================
# Media File Classes
#==================================================================================================================
#==================================================================================================================

Class MediaFile {

  #-----------------------------------------------
  # File Properties
  #-----------------------------------------------

    [String]   $Path
    [String]   $Name
    [String]   $BaseName
    [String]   $Extension
    [String]   $ParentFolderName
    [String]   $ParentFolderPath
    [String]   $CreatedTime
    [String]   $LastUpdatedTime
    [bool]     $Exists = $false

    [String]   $PosterPath

  #-----------------------------------------------
  # MPEG Properties
  #-----------------------------------------------

    [Int]      $Duration
    [Int]      $BitRate
    [Object[]] $Streams
    [String[]] $Features

    [String]   $VideoCodec
    [Single]   $AspectRatio
    [Int]      $FrameWidth
    [Int]      $FrameHeight

    [String]   $AudioCodec
    [String]   $AudioFormat
    [Int]      $AudioChannels

    [String]   $Source
    [String]   $Profile
    [String]   $FileTag

  #-----------------------------------------------
  # Embedded File Metadata (AtomicParsley Atoms)
  #-----------------------------------------------
  # '*' are default fields for TV Shows.
  # '&' are generated from iTunesMovie data)

    [String]   $TVShowName                  # tvsh *
    [int32]    $TVSeasonNumber              # tvsn *
    [String]   $TVSeasonDescription         # sdes
    [int32]    $TVEpisodeNumber             # tves *
    [String]   $TVEpisodeID                 # tven *
    [String]   $TVNetwork                   # tvnn

    [String]   $Title                       # ©nam *
    [String]   $Description                 # desc *
    [String]   $LongDescription             # ldes *
    [String]   $Genre                       # ©gen *
    [String[]] $Genres                      
    [String]   $iTunesGenre                 # geID *
    [String]   $ReleaseDate                 # ©day *
    [String]   $ContentRating               # iTunEXTC *
    [String]   $iTunesMovie                 # iTunMOVI
    [String]   $iTunesMovieCast             # iTunMOVI Generated data
    [String]   $iTunesMovieDirectors        # iTunMOVI Generated data
    [String]   $iTunesMovieScreenwriters    # iTunMOVI Generated data
    [String]   $iTunesMovieStudio           # iTunMOVI Generated data

    [String]   $Artist                      # ©ART *
    [String]   $AlbumArtist                 # aART *
    [String]   $Composer                    # ©wrt

    [String]   $Album                       # ©alb *
    [String]   $Grouping                    # ©grp
    [String]   $Compilation                 # cpil *
    [String]   $TrackNumber                 # trkn *
    [String]   $DiscNumber                  # disk *

    [String]   $SortName                    # sonm
    [String]   $SortShow                    # sosn
    [String]   $SortAlbum                   # soal
    [String]   $SortArtist                  # soar
    [String]   $SortAlbumArtist             # soaa
    [String]   $SortComposer                # soco

    [String]   $CoverArt                    # covr *
    [String]   $Comment                     # ©cmt

    [String]   $MediaType                   # stik *
    [String]   $HDVideo                     # hdvd *
    [String]   $Flavor                      # flvr * (read only)

    [String]   $Keywords                    # keyw
    [String]   $Category                    # catg
    [String]   $UserRating                  # rate

    [String]   $iTunesCatalogID             # cnID *
    [String]   $PurchaseDate                # purd *
    [String]   $AccountType                 # akID (read only)
    [String]   $PurchaseAccount             # apID *
    [String]   $PurchaseName                # ownr * (read only)
    [String]   $DownloadAccount             # dwID * (read only)
    [String]   $DownloadName                # dwlr * (read only)
    [String]   $StoreFrontID                # sfID * (read only)
    [String]   $VendorID                    # xid  *
    [String]   $ArtistID                    # atID *
    [String]   $PlayListID                  # plID *
    [String]   $Copyright                   # cprt *

    [String]   $Lyrics                      # ©lyr
    [String]   $Tempo                       # tmpo
    [String]   $AdvisoryRating              # rtng *
    [String]   $GaplessPlayback             # pgap *
    [String]   $MusicGenre                  # gnre

    [String]   $Podcast                     # pcst
    [String]   $PodcastURL                  # purl
    [String]   $PodcastGUID                 # egid

    [String]   $EncodingTool                # ©too
    [String]   $EncodedBy                   # ©enc
    [String]   $CameraID                    # cmID

    [String]   $rawAtomData
    [String]   $UnknownAtoms

  #-----------------------------------------------
  # Constructors
  #-----------------------------------------------

    MediaFile ( ) { }

    MediaFile ( [string] $MediaFilePath ) {
        $this.SetFileProperties( $MediaFilePath )
    }

  #-----------------------------------------------
  # Private Methods
  #-----------------------------------------------

  # Sets the MediaFile properties based on the physical file attributes
    hidden [void] SetFileProperties ( [string] $MediaFilePath ) {
        
        $this.Path = $MediaFilePath
        $this.Exists = [System.IO.File]::Exists($MediaFilePath)

        if ( $this.Exists ) {
            
            $File = Get-Item -LiteralPath $MediaFilePath

            $this.Name             = $File.Name
            $this.BaseName         = $File.BaseName
            $this.Extension        = $File.Extension
            $this.ParentFolderName = $File.Directory.Name
            $this.ParentFolderPath = $File.Directory.FullName
            $this.CreatedTime      = $File.CreationTime
            $this.LastUpdatedTime  = $File.LastWriteTime

            $this.SetPosterPath()

        }
    }

  # Test for the existence of and sets the poster path.
    hidden [void] SetPosterPath ( ) {
        $SupportedFileExtensions = @('.jpg','.jpeg','.png','.tbn')
        foreach ( $Extension in $SupportedFileExtensions ){
            $PosterFilePath = ($this.Path -replace "\$($this.Extension)$",'') + $Extension
            if ( [System.IO.File]::Exists($PosterFilePath) ) {
                $this.PosterPath = $PosterFilePath
                break
            }
        }
    }

  # Set MPEG properties.
    hidden [void] SetMPEGSummaryProperties ( ) {

        foreach ( $stream in $this.streams ) {

            if ( Test-IsSomething($stream.codec_name) ) {

                switch -Wildcard ( $stream.codec_name ) {
                    'bin_data'  { $this.Features += 'chapters' }
                    'mov_text'  { $this.Features += 'subtitles' }
                    'eia_608'   { $this.Features += 'closedCaptions' }
                    'mjpeg'     { $this.Features += 'coverArt' }
                    'png'       { $this.Features += 'coverArt' }
                    'aac'       {
                                    if ( $null -eq $this.AudioFormat ) {
                                        $this.AudioCodec     = $($stream.codec_name)
                                        $this.AudioFormat    = $($stream.channel_layout)
                                        $this.AudioChannels  = $([int]$stream.channels)
                                    }
                                    $this.Features += $('{0}:{1}' -f $($stream.codec_name.ToUpper()),
                                                                     $($stream.channel_layout))
                                }
                    '*ac3'      {
                                    if ( $null -eq $this.AudioFormat -or $this.AudioFormat -like "*AAC*" ) {
                                        $this.AudioCodec     = $($stream.codec_name)
                                        $this.AudioFormat    = $($stream.channel_layout)
                                        $this.AudioChannels  = $([int]$stream.channels)
                                    }
                                    $this.Features += $('{0}:{1}' -f $($stream.codec_name.ToUpper()),
                                                                     $($stream.channel_layout))
                                }
                    'h26*'      {
                                    $this.Features   += $($stream.codec_name)
                                    $this.VideoCodec  = $($stream.codec_name)
                                    $this.FrameWidth  = $($stream.width)
                                    $this.FrameHeight = $($stream.height)
                                    if ( $stream.display_aspect_ratio ) {
                                        $ratio = $stream.display_aspect_ratio -split ':'
                                        $this.AspectRatio = [Math]::Round(([int]$ratio[0] / [int]$ratio[1]),2)
                                    }
                                    else {
                                        $this.AspectRatio = [Math]::Round(([int]$stream.width / [int]$stream.height),2)
                                    }
                                }
                }

            } else {

                switch ( $stream.codec_type ) {
                    'data'      { $this.Features += 'subtitles' }
                    'subtitle'  { $this.Features += 'closedCaptions' }
                    'audio'     {
                                    $this.AudioCodec     = $('AC3drm')
                                    $this.AudioFormat    = $($stream.channel_layout)
                                    $this.AudioChannels  = $([int]$stream.channels)
                                    $this.Features      += $('AC3drm:{0}' -f $($stream.channel_layout))
                                }
                    'video'     {
                                    $this.Features   += $('h264drm')
                                    $this.VideoCodec  = $('h264drm')
                                    $this.FrameWidth  = $($stream.width)
                                    $this.FrameHeight = $($stream.height)
                                    if ( $stream.display_aspect_ratio ) {
                                        $ratio = $stream.display_aspect_ratio -split ':'
                                        $this.AspectRatio = [Math]::Round(([int]$ratio[0] / [int]$ratio[1]),2)
                                    }
                                    else {
                                        $this.AspectRatio = [Math]::Round(([int]$stream.width / [int]$stream.height),2)
                                    }
                            }

                }

            }

        }

        $this.features = $this.features | Sort-Object -Unique

    }

  #-----------------------------------------------
  # Public Methods
  #-----------------------------------------------

  # Set the properties gotten from AtomicParsley.
    [void] SetATOMproperties ( [Hashtable] $AtomData ) {
        $AtomData.Keys | ForEach-Object {
            if ( $this.PSObject.Properties.Match($_).count -eq 1 ) {
                $this."$($_)" = $AtomData."$($_)"
            }
        }
    }

  # Sets the properties tied to the MPEG data gotten from ffprobe.
    [void] SetMPEGproperties ( [PSCustomObject] $MPEGdata ) {

        if ( IsSomething($MPEGdata) ) {

            if ( IsSomething($MPEGdata.format) ) {
                $this.Duration = [int][math]::Round($MPEGdata.format.duration)
                $this.BitRate  = [int]$MPEGdata.format.bit_rate
            }

            if ( IsSomething($MPEGdata.streams) ) {
                $this.Streams = $MPEGdata.streams
                $this.SetMPEGSummaryProperties()
            }

        }

    }

}
