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

    Credit ( ) { }

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

    ContentRating ( ) { }

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

    Entity ( ) { }

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

    Item ( [String] $Name ) { 
        $this.Name = $Name
    }

    Item ( [String] $Name, [String] $ID ) {
        $this.Name = $Name
        $this.ID   = $ID
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

    Image ( ) { }

    Image ( [String] $Type, [String] $URL ) {
        $this.Type        = $Type
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

    Collection ( ) { }

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

#------------------------------------------------------------------------------------------------------------------
# A TVShow/Series, which contains seasons, episodes, credits, etc...
#------------------------------------------------------------------------------------------------------------------
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

    [TVSeason[]]      $Seasons  = @()
    [TVEpisode[]]     $Episodes = @()

    [TVEpisode]       $LastEpisode
    [TVEpisode]       $NextEpisode

    [Item[]]          $ExternalIDs
    [Image[]]         $Images

  #-----------------------------------------------
  # Constructors
  #-----------------------------------------------

    TVShow ( ) { }

    TVShow ( [String] $Name ) { $this.Name = $Name }

    TVShow ( [Hashtable] $Info ) {
        $Info.Keys | ForEach-Object {
            if ( $this.PSObject.Properties.Match($_).count -eq 1 ) {
                $this."$($_)" = $Info."$($_)"
            }
        }
    }
    
  # The Static Constructor upgrades getter/setter properties (not visible in the debugger).
    static TVShow ( ) {
        [TVShow] | Update-TypeData -MemberType ScriptProperty -MemberName Episodes -Value {
            return $( $this.Seasons | Select-Object -ExpandProperty 'Episodes' )
        }
    }

  #-----------------------------------------------
  # Methods
  #-----------------------------------------------

  # Export the current TVShow object to a specified file path as a typed XML object.
    [void] ExportToCache ( [String] $FilePath ) {
        $this | Export-Clixml -LiteralPath $FilePath -Depth 100 -Force
    }

  # Import a TVShow object from a typed XML definition.
    static [TVShow] ImportFromCache ( [String] $Path ) {
        if ( [System.IO.File]::Exists($Path) ) {
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

#------------------------------------------------------------------------------------------------------------------
# A Single Season of a TV Show
#------------------------------------------------------------------------------------------------------------------
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

    TVSeason ( ) { }

    TVSeason ( [int32] $Number ) { $this.Number = $Number }

    TVSeason ( [Hashtable] $Info ) {
        $Info.Keys | ForEach-Object {
            if ( $this.PSObject.Properties.Match($_).count -eq 1 ) {
                $this."$($_)" = $Info."$($_)"
            }
        }
    }

}

#------------------------------------------------------------------------------------------------------------------
# A Single Episode of a TV Show
#------------------------------------------------------------------------------------------------------------------
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
    [String]      $LongDescription
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

    [String]      $BaseFileName
    [String]      $ShowFileName

    [Item[]]      $ExternalIDs
    [Image[]]     $Images

    TVEpisode ( ) { }

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

    static TVEpisode ( ) {
        Update-TypeData -TypeName 'TVEpisode' -MemberType ScriptProperty `
            -MemberName 'BaseFileName' `
            -Value {
                $i = ("[{0}]" -f [RegEx]::Escape([IO.Path]::GetInvalidFileNameChars() -Join ''))
                $n = $( "s{0:D2}e{1:D2} - {2}" -f $this.season.ToString(),
                                                  $this.number.ToString(),
                                                  $($this.Title -replace $i) )
                return $n
            }
        Update-TypeData -TypeName 'TVEpisode' -MemberType ScriptProperty `
            -MemberName 'ShowFileName' `
            -Value {
                $i = ("[{0}]" -f [RegEx]::Escape([IO.Path]::GetInvalidFileNameChars() -Join ''))
                $n = $( "{0} - {1}" -f $($this.ShowTitle -replace $i), $this.BaseFileName )
                return $n
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
    [String]            $LongDescription
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

    [String]   $ID
    [String]   $Path
    [String]   $Name
    [String]   $Extension
    [bool]     $Exists

    [String]   $ParentFolderName
    [String]   $ParentFolderPath

    [String]   $CreatedTime
    [String]   $LastUpdatedTime
    
    [String]   $PosterPath

    [MediaFileTags]    $Tags
    [MediaFileNames]   $Names
    [MediaFileMatches] $Matches
    [PSCustomObject]   $Encoding

  #-----------------------------------------------
  # Constructors
  #-----------------------------------------------

    MediaFile ( ) { }

    static MediaFile ( ) {
        Update-TypeData -TypeName 'MediaFile' -MemberType ScriptProperty `
            -MemberName 'Exists' `
            -Value { return [System.IO.File]::Exists($this.Path) }
    }

    MediaFile ( [string] $MediaFilePath ) {
        $this.SetFileProperties( $MediaFilePath )
    }

  #-----------------------------------------------
  # Methods
  #-----------------------------------------------

  # Sets the MediaFile properties based on the physical file attributes.
    hidden [void] SetFileProperties ( [string] $MediaFilePath ) {
 
        $this.Path = $MediaFilePath

        if ( $this.Exists ) {
            
            $file = Get-Item -LiteralPath $MediaFilePath

            $this.Name             = $file.Name
            $this.Extension        = $file.Extension
            $this.ParentFolderName = $file.Directory.Name
            $this.ParentFolderPath = $file.Directory.FullName
            $this.CreatedTime      = $file.CreationTime
            $this.LastUpdatedTime  = $file.LastWriteTime

            $this.ID      = [Media]::GetFileHash($this.Path)
            $this.Matches = [MediaFileMatches]::new($this.ID)
            $this.Names   = [MediaFileNames]::new($this.Name)

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

  # Set the tags/atoms.
    [void] SetTags ( [Hashtable] $TagData ) {
        $this.Tags = [MediaFileTags]::new($TagData)
    }

  # Set the encoding properties.
    [void] SetEncoding ( [Hashtable] $EncodingData ) {
        $this.Encoding = $EncodingData
        if ( $this.Names.EncodedVideoIsDenoised ) { $this.Encoding.Video.FormatTag += '-D' }
        if ( $this.Encoding.SourceTag -eq 'OTA' -and $this.Names.EncodedSource -eq 'DVD' ) { 
            $this.Encoding.SourceTag = 'DVD'
        }
        $this.Encoding.ProfileTag = $( '{0} {1} {2} {3} {4}' -f $this.Encoding.Video.ResolutionTag,
                                                                $this.Encoding.Video.AspectRatioTag,
                                                                $this.Encoding.SourceTag,
                                                                $this.Encoding.Video.FormatTag,
                                                                $this.Encoding.Audio.FormatTag )
    }

}

#------------------------------------------------------------------------------------------------------------------
# The online database ids of the entries matching a single file.
#------------------------------------------------------------------------------------------------------------------
Class MediaFileMatches {

    [String]   $FileId

    [String]   $ATVpId
    [String]   $TMdbId
    [String]   $TVdbId
    [String]   $IMdbId

    [Double]   $ATVpMatchScore
    [Double]   $TMdbMatchScore
    [Double]   $TVdbMatchScore
    [Double]   $IMdbMatchScore

    MediaFileMatches ( [String] $FileId ) {
        $this.FileId = $FileId
    }

}


#------------------------------------------------------------------------------------------------------------------
# Detokenizes the different naming parts of a TV or Movie file name.
#------------------------------------------------------------------------------------------------------------------
Class MediaFileNames {

    [String]   $FullName
    [String]   $StandardizedName
    [String]   $BaseName
    [String]   $BaseNameWithTag
    [String]   $Extension

    [String]   $FileTag
    [String]   $FileTagValue

    [String]   $TVShowName
    [String]   $TVShowNameAndYear
    [String]   $TVShowYear
    [String]   $TVSeasonNumber
    [String]   $TVEpisodeNumber
    [String]   $TVEpisodeTitle
    [String]   $TVEpisodeTitleHasPartNumber
    [String]   $TVEpisodeTitlePartNumber
    [String]   $TVEpisodeTitleNoPart
    [String]   $TVEpisodeTitlePart
    [String]   $TVEpisodeTitleStandardized
    [String]   $TVEpisodeTitleWithPartFormat1
    [String]   $TVEpisodeTitleWithPartFormat2
    [String]   $TVEpisodeTitleWithPartFormat3

    [String]   $MovieName
    [String]   $MovieYear

    [Bool]     $UsesTVShowFormat
    [Bool]     $UsesMovieFormat

    [String]   $EncodedSummary
    [String]   $EncodedResolution
    [String]   $EncodedAspect
    [String]   $EncodedSource
    [String]   $EncodedVideoFormat
    [String]   $EncodedAudioFormat
    [Bool]     $EncodedVideoIsAnimated
    [Bool]     $EncodedVideoIsDenoised

    MediaFileNames ( [String] $FileName ) {
        $this.Update($FileName)
    }

    [void] Update ( [String] $FileName ) {
        $naming = [Media]::GetFileNaming($FileName)
        $naming.Keys | ForEach-Object {
            if ( $this.PSObject.Properties.Match($_).count -eq 1 ) {
                $this."$($_)" = $naming."$($_)"
            }
        }
    }

}

#------------------------------------------------------------------------------------------------------------------
# The ID3 Tags / AtomicParsley Atoms applied to a single media file.
#------------------------------------------------------------------------------------------------------------------
Class MediaFileTags {

  # '*' are default fields for TV Shows.

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

    MediaFileTags ( [Hashtable] $TagData ) {
        $this.Update($TagData)
    }

    [void] Update ( [Hashtable] $TagData ) {
        $TagData.Keys | ForEach-Object {
            if ( $this.PSObject.Properties.Match($_).count -eq 1 ) {
                $this."$($_)" = $TagData."$($_)"
            }
        }
    }

}

#------------------------------------------------------------------------------------------------------------------
# A utility class for static, media-related functions.
#------------------------------------------------------------------------------------------------------------------
Class Media {

  #-----------------------------------------------------------------------------
  # De-tokenizes the file name.
  #-----------------------------------------------------------------------------
    static [PSCustomObject] GetFileNaming ( [string] $FileName ) {

        $fxp = '^(?<base>.+?)\s*(?<tag>\[[^\]]*\])?\s*(?<ext>\.[A-Za-z0-9]{1,6})?$'
        $mxp = '(?<title>.+?)\s*\((?<year>\d{4})\)'
        $num = 'one|two|three|four|five|six|seven|eight|nine|ten'
        $txf = '^(?<show>.+?)\s*-\s*[sS](?<season>\d{1,2})[eE](?<episode>\d{1,2})\s*-\s*(?<title>.+)$'
        $txp = ('(?i)^(?<show>.+?)\s*\((?<year>\d{4})\)\s*-\s*s(?<season>\d{1,2})e(?<episode>\d{1,2})\s*-\s*(?<title>.+?)' + 
                '(?:[\s,:-]*?(?:\(?\s*(?:part|pt)\.?\s*(?<part>\d{1,2}|'+$num+')\s*\)?|\(?\s*(?<part>\d{1,2})\s*\)?))?\s*$')

        $p = [ordered]@{ FullName = $FileName; StandardizedName = $null }
        
        $fp = [regex]::Match($FileName,$fxp)
        if ( $fp.success ) {

            $p.FullName        = $FileName
            $p.BaseName        = $fp.Groups['base'].Value
            $p.FileTag         = $fp.Groups['tag'].Value
            $p.FileTagValue    = [regex]::Match($FileName,'(?<=\[)[^\]]+(?=\])').value
            $p.Extension       = $fp.Groups['ext'].Value
            $p.BaseNameWithTag = $FileName.Replace($p.Extension,'')

            $tf = [regex]::Match($p.BaseName,$txf)
            $tp = [regex]::Match($p.BaseName,$txp)
            if ( $tp.success ) {
                
                $p.UsesTVShowFormat            = $true
                $p.UsesMovieFormat             = $false
                $p.TVShowName                  = $tp.Groups['show'].Value.Trim()
                $p.TVShowNameAndYear           = $tf.Groups['show'].Value.Trim()
                $p.TVShowYear                  = $tp.Groups['year'].Value.Trim()
                $p.TVSeasonNumber              = $tp.Groups['season'].Value
                $p.TVEpisodeNumber             = $tp.Groups['episode'].Value
                $p.TVEpisodeTitle              = $tf.Groups['title'].Value.Trim()
                $p.TVEpisodeTitleHasPartNumber = $tp.Groups['part'].value -eq '' ? $false : $true
                $p.TVEpisodeTitlePartNumber    = $null
                $p.TVEpisodeTitleNoPart        = $tp.Groups['title'].Value.Trim()
                $p.TVEpisodeTitlePartString    = $tp.Groups['part'].value -eq '' ? $null :
                                                  $p.TVEpisodeTitle.Replace($p.TVEpisodeTitleNoPart,'').Trim()
                $p.TVEpisodeTitlePart          = $tp.Groups['part'].value -eq '' ? $null :
                                                 $tp.Groups['part'].value.ToString().Trim()
                
                if ( $p.TVEpisodeTitleHasPartNumber ) {
                    if ($p.TVEpisodeTitlePart -match '^\d+$') { 
                        $p.TVEpisodeTitlePartNumber = [int]$p.TVEpisodeTitlePart 
                    } else {
                        $p.TVEpisodeTitlePartNumber = $(
                            switch ($p.TVEpisodeTitlePart.ToLowerInvariant()) {
                                'one'   { 1 }
                                'two'   { 2 }
                                'three' { 3 }
                                'four'  { 4 }
                                'five'  { 5 }
                                'six'   { 6 }
                                'seven' { 7 }
                                'eight' { 8 }
                                'nine'  { 9 }
                                'ten'   { 10 }
                                default { $null }
                            })
                    }
                    $p.TVEpisodeTitleWithPartFormat1 = $('{0} (Part {1})' -f $p.TVEpisodeTitleNoPart,
                                                                             $p.TVEpisodeTitlePartNumber)
                    $p.TVEpisodeTitleWithPartFormat2 = $('{0}, Part {1}'  -f $p.TVEpisodeTitleNoPart,
                                                                             $p.TVEpisodeTitlePartNumber)
                    $p.TVEpisodeTitleWithPartFormat3 = $('{0}, Pt. {1}'   -f $p.TVEpisodeTitleNoPart,
                                                                             $p.TVEpisodeTitlePartNumber)
                }
                
                $p.TVEpisodeTitleStandardized = $p.TVEpisodeTitleWithPartFormat1 ?? $p.TVEpisodeTitleNoPart
                
                $p.StandardizedName = $("{0} - s{1:D2}e{2:D2} - {3} {4}{5}" -f $p.TVShowNameAndYear,
                                                                               $p.TVSeasonNumber,
                                                                               $p.TVEpisodeNumber,
                                                                               $p.TVEpisodeTitleStandardized,
                                                                               $p.FileTag,
                                                                               $p.Extension)
            } else {
                
                $mp = [regex]::Match($p.BaseName,$mxp)
                if ( $mp.success ) {
                    $p.UsesTVShowFormat     = $false
                    $p.UsesTVShowYearFormat = $false
                    $p.UsesMovieFormat      = $true
                    $p.MovieTitle           = $mp.Groups['title'].Value.Trim()
                    $p.MovieYear            = $mp.Groups['year'].Value
                }
                else {
                    $p.UsesTVShowFormat     = $false
                    $p.UsesTVShowYearFormat = $false
                    $p.UsesMovieFormat      = $false
                }
                $p.StandardizedName = $p.FullName

            }

            $ep = [Media]::GetEncodingProfileProperties($p.FileTagValue)
            if ( $ep.count -gt 0 ) {
                $ep.Keys | ForEach-Object { $p."$($_)" = $ep."$($_)" }
            }

        }
        else {
            $p.UsesTVShowFormat = $false
            $p.UsesMovieFormat  = $false
        }

        return $p
    }

  #-----------------------------------------------------------------------------
  # Calculates a Fast file hash by analyzing 3 parts of a file.
  #-----------------------------------------------------------------------------
    static [String] GetFileHash ( [string] $FilePath ) {

        $f = [System.IO.File]::OpenRead($FilePath)

        try {
            
            $size    = [long]$f.Length
            $hasher  = [System.Security.Cryptography.SHA256]::Create()
            $bufSize = 65536
            $buf     = New-Object byte[] $bufSize

          # Compute min without calling System.Math overloads
            $min = { param($a,$b) if ($a -lt $b) { return $a } else { return $b } }

          # Read File Head
            $count = [int](& $min $bufSize $size)
            if ($count -gt 0) {
                $read = $f.Read($buf,0,$count)
                $hasher.TransformBlock($buf,0,$read,$null,0) | Out-Null
            }

          # Read File Middle
            $midPos = [long](([long]($size - $bufSize)) / 2)
            if ($midPos -lt 0) { $midPos = 0 }
            $remaining = $size - $midPos
            $count = [int](& $min $bufSize $remaining)
            if ($count -gt 0) {
                $f.Position = $midPos
                $read = $f.Read($buf,0,$count)
                $hasher.TransformBlock($buf,0,$read,$null,0) | Out-Null
            }

          # Read File Tail
            $tailPos = $size - $bufSize
            if ($tailPos -lt 0) { $tailPos = 0 }
            $f.Position = $tailPos
            $remaining = $size - $f.Position
            $count = [int](& $min $bufSize $remaining)
            if ($count -gt 0) {
                $read = $f.Read($buf,0,$count)
                $hasher.TransformFinalBlock($buf,0,$read) | Out-Null
            } else {
                $hasher.TransformFinalBlock($buf,0,0) | Out-Null
            }

            $hash = ($hasher.Hash | ForEach-Object { $_.ToString('x2') }) -join ''

            return "${size}-${hash}"

        } finally {
            $f.Close()
        }

    }

  #-----------------------------------------------------------------------------
  # De-tokenizes the MPEG profile summary.
  #-----------------------------------------------------------------------------
    static [PSCustomObject] GetEncodingProfileProperties ( [String] $Profile ) {
        $r = @{ }
        if ( ($Profile -split ' ').count -eq 6 ) {
            $tempValue = ($Profile -split ' ')
            $Profile   = ($tempValue[0..4] -join ' ') + $tempValue[5]
         }
        if ( ($Profile -split ' ').count -eq 5 ) {
            $pattern = '\b(?<r>\d{3,4}p)\s+(?<x>WS|FS)\s+(?<s>[A-Za-z0-9\+]+)\s+(?<v>[A-Za-z0-9\+\-]+)\s+(?<a>[A-Za-z0-9\+\-\.]+)\b'
            if ($Profile -match $pattern) {
                $r.EncodedSummary         = $Profile 
                $r.EncodedResolution      = $matches['r']
                $r.EncodedAspect          = $matches['x']
                $r.EncodedSource          = $matches['s']
                $r.EncodedVideoFormat     = $matches['v']
                $r.EncodedAudioFormat     = $matches['a']
                $r.EncodedVideoIsAnimated = $r.EncodedVideoFormat -like "*2DA"
                $r.EncodedVideoIsDenoised = ( $r.EncodedVideoFormat -like "*ULD" -or 
                                              $r.EncodedVideoFormat.EndsWith('-D') )
            }
        }
        return $r
    }



}

