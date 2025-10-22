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
        [TVEpisode] | Update-TypeData -MemberType ScriptProperty -MemberName BaseFileName -Value {
            $t = $($this.Title -replace ("[{0}]" -f [RegEx]::Escape([IO.Path]::GetInvalidFileNameChars() -Join '')))
            $s = $this.season.ToString().PadLeft(2,'0')
            $e = $this.number.ToString().PadLeft(2,'0')
            $n = $( "s{0}e{1} - {2}" -f $s, $e, $t )
            return $n
        }
        [TVEpisode] | Update-TypeData -MemberType ScriptProperty -MemberName ShowFileName -Value {
            $s = $($this.ShowTitle -replace ("[{0}]" -f [RegEx]::Escape([IO.Path]::GetInvalidFileNameChars() -Join '')))
            $b = $this.BaseFileName
            $n = $( "{0} - {1}" -f $s, $b )
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

    [String]   $Path
    [String]   $Name
    [String]   $StandardizedName
    [String]   $BaseName
    [String]   $BaseNameWithTag
    [String]   $FileTag
    [String]   $FileTagValue
    [String]   $Extension
    [bool]     $Exists

    [String]   $ParentFolderName
    [String]   $ParentFolderPath

    [String]   $CreatedTime
    [String]   $LastUpdatedTime
    
    [String]   $FileTVShowName
    [String]   $FileTVSeasonNumber
    [String]   $FileTVEpisodeNumber
    [String]   $FileTVEpisodeTitle

    [String]   $EpisodeTitleHasPartNumber
    [String]   $EpisodeTitlePartNumber
    [String]   $EpisodeTitleNoPart
    [String]   $EpisodeTitlePart
    [String]   $EpisodeTitleStandardized
    [String]   $EpisodeTitleWithPartFormat1
    [String]   $EpisodeTitleWithPartFormat2
    [String]   $EpisodeTitleWithPartFormat3

    [String]   $FileMovieName
    [String]   $FileMovieYear

    [String]   $PosterPath

    [String]   $ATVpId
    [String]   $TMdbId
    [String]   $TVdbId
    [String]   $IMdbId

    [Double]   $ATVpMatchScore
    [Double]   $TMdbMatchScore
    [Double]   $TVdbMatchScore
    [Double]   $IMdbMatchScore

  #-----------------------------------------------
  # MPEG Properties
  #-----------------------------------------------

    [Object]   $MPEG

    [String]   $FileTagProfile
    [String]   $FileTagResolution
    [String]   $FileTagAspect
    [String]   $FileTagSource
    [String]   $FileTagVideoProfile
    [Bool]     $FileTagVideoProfileAnimation
    [Bool]     $FileTagVideoProfileDenoised
    [String]   $FileTagAudioProfile

    [String]   $CommentProfile
    [String]   $CommentResolution
    [String]   $CommentAspect
    [String]   $CommentSource
    [String]   $CommentVideoProfile
    [Bool]     $CommentVideoProfileAnimation
    [Bool]     $CommentVideoProfileDenoised
    [String]   $CommentAudioProfile

    [String]   $DerivedProfile
    [String]   $DerivedResolution
    [String]   $DerivedAspect
    [String]   $DerivedSource
    [String]   $DerivedVideoProfile
    [Bool]     $DerivedVideoProfileAnimation
    [Bool]     $DerivedVideoProfileDenoised
    [String]   $DerivedAudioProfile
    
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
            
            $File = Get-Item -LiteralPath $MediaFilePath

            $this.Name             = $File.Name
            $this.BaseNameWithTag  = $File.BaseName
            $this.Extension        = $File.Extension
            $this.ParentFolderName = $File.Directory.Name
            $this.ParentFolderPath = $File.Directory.FullName
            $this.CreatedTime      = $File.CreationTime
            $this.LastUpdatedTime  = $File.LastWriteTime

            if ( $File.Name -match '\[[^\]]+\]' ) {
                $this.FileTag      = [regex]::Match($this.Name,'\[[^\]]+\]').value
                $this.FileTagValue = [regex]::Match($this.Name,'(?<=\[)[^\]]+(?=\])').value
                $this.BaseName     = $File.BaseName -replace '\s*\[[^\]]+\]', ''
            }
            else {
                $this.BaseName = $File.BaseName
            }

            $parts = [MediaFile]::GetFileNameParts($this.Name)
            if ( $parts.UsesTVShowFormat ) {

                $this.StandardizedName            = $parts.StandardizedName

                $this.FileTVShowName              = $parts.ShowName
                $this.FileTVSeasonNumber          = $parts.SeasonNumber
                $this.FileTVEpisodeNumber         = $parts.EpisodeNumber
                $this.FileTVEpisodeTitle          = $parts.EpisodeTitle

                $this.EpisodeTitleHasPartNumber   = $parts.EpisodeTitleHasPartNumber
                $this.EpisodeTitlePartNumber      = $parts.EpisodeTitlePartNumber
                $this.EpisodeTitleNoPart          = $parts.EpisodeTitleNoPart
                $this.EpisodeTitlePart            = $parts.EpisodeTitlePart
                $this.EpisodeTitleStandardized    = $parts.EpisodeTitleStandardized

                $this.EpisodeTitleWithPartFormat1 = $parts.EpisodeTitleWithPartFormat1
                $this.EpisodeTitleWithPartFormat2 = $parts.EpisodeTitleWithPartFormat2
                $this.EpisodeTitleWithPartFormat3 = $parts.EpisodeTitleWithPartFormat3

            }
            elseif ( $parts.UsesMovieFormat ) {
                $this.StandardizedName = $parts.StandardizedName
                $this.FileMovieName    = $parts.MovieTitle
                $this.FileMovieYear    = $parts.MovieYear
            }

            $this.SetPosterPath()

            $this.SetProfileProperties('FileTag',$this.FileTagValue)

        }
    }

  # Sets the MediaFile TV Episode or Movie properties based on the file name.
    static [PSCustomObject] GetFileNameParts ( [string] $FileName ) {

        $fxp = '^(?<base>.+?)\s*(?<tag>\[[^\]]*\])?\s*(?<ext>\.[A-Za-z0-9]{1,6})?$'
        $mxp = '(?<title>.+?)\s*\((?<year>\d{4})\)'
        $num = 'one|two|three|four|five|six|seven|eight|nine|ten'
        $txf = '^(?<show>.+?)\s*-\s*[sS](?<season>\d{1,2})[eE](?<episode>\d{1,2})\s*-\s*(?<title>.+)$'
        $txp = ('(?i)^(?<show>.+?)\s*-\s*s(?<season>\d{1,2})e(?<episode>\d{1,2})\s*-\s*(?<title>.+?)' + 
                '(?:[\s,:-]*?(?:\(?\s*(?:part|pt)\.?\s*(?<part>\d{1,2}|'+$num+')\s*\)?|\(?\s*(?<part>\d{1,2})\s*\)?))?\s*$')

        $parts = [ordered]@{ FullName = $FileName; StandardizedName = $null }
        
        $fp = [regex]::Match($FileName,$fxp)
        if ( $fp.success ) {

            $parts.FullName     = $FileName
            $parts.BaseName     = $fp.Groups['base'].Value
            $parts.FileTag      = $fp.Groups['tag'].Value
            $parts.FileTagValue = [regex]::Match($FileName,'(?<=\[)[^\]]+(?=\])').value
            $parts.Extension    = $fp.Groups['ext'].Value

            $tf = [regex]::Match($parts.BaseName,$txf)
            $tp = [regex]::Match($parts.BaseName,$txp)
            if ( $tp.success ) {
                
                $parts.UsesTVShowFormat          = $true
                $parts.UsesMovieFormat           = $false
                $parts.ShowName                  = $tp.Groups['show'].Value.Trim()
                $parts.SeasonNumber              = $tp.Groups['season'].Value
                $parts.EpisodeNumber             = $tp.Groups['episode'].Value
                $parts.EpisodeTitle              = $tf.Groups['title'].Value.Trim()
                $parts.EpisodeTitleHasPartNumber = $tp.Groups['part'].value -eq '' ? $false : $true
                $parts.EpisodeTitlePartNumber    = $null
                $parts.EpisodeTitleNoPart        = $tp.Groups['title'].Value.Trim()
                $parts.EpisodeTitlePartString    = $tp.Groups['part'].value -eq '' ? $null :
                                                   $parts.EpisodeTitle.Replace($parts.EpisodeTitleNoPart,'').Trim()
                $parts.EpisodeTitlePart          = $tp.Groups['part'].value -eq '' ? $null :
                                                   $tp.Groups['part'].value.ToString().Trim()
                
                if ( $parts.EpisodeTitleHasPartNumber ) {
                    if ($parts.EpisodeTitlePart -match '^\d+$') { 
                        $parts.EpisodeTitlePartNumber = [int]$parts.EpisodeTitlePart 
                    } else {
                        $parts.EpisodeTitlePartNumber = $(
                            switch ($parts.EpisodeTitlePart.ToLowerInvariant()) {
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
                    $parts.EpisodeTitleWithPartFormat1 = $('{0} (Part {1})' -f $parts.EpisodeTitleNoPart, 
                                                                            $parts.EpisodeTitlePartNumber)
                    $parts.EpisodeTitleWithPartFormat2 = $('{0}, Part {1}'  -f $parts.EpisodeTitleNoPart, 
                                                                            $parts.EpisodeTitlePartNumber)
                    $parts.EpisodeTitleWithPartFormat3 = $('{0}, Pt. {1}'   -f $parts.EpisodeTitleNoPart, 
                                                                            $parts.EpisodeTitlePartNumber)
                }
                
                $parts.EpisodeTitleStandardized = $parts.EpisodeTitleWithPartFormat1 ?? $parts.EpisodeTitleNoPart
                
                $parts.StandardizedName = $("{0} - s{1:D2}e{2:D2} - {3} {4}{5}" -f $parts.ShowName,
                                                                                $parts.SeasonNumber,
                                                                                $parts.EpisodeNumber,
                                                                                $parts.EpisodeTitleStandardized,
                                                                                $parts.FileTag,
                                                                                $parts.Extension)

            } else {
                
                $mp = [regex]::Match($parts.BaseName,$mxp)
                if ( $mp.success ) {
                    $parts.UsesTVShowFormat = $false
                    $parts.UsesMovieFormat  = $true

                    $parts.MovieTitle       = $mp.Groups['title'].Value.Trim()
                    $parts.MovieYear        = $mp.Groups['year'].Value
                }
                else {
                    $parts.UsesTVShowFormat = $false
                    $parts.UsesMovieFormat  = $false
                }
                $parts.StandardizedName = $parts.FullName

            }
        }
        else {
            $parts.UsesTVShowFormat = $false
            $parts.UsesMovieFormat  = $false
        }

        return $parts
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

  # Set the individual MPEG profile properties based on the file tag/profile.
    hidden [void] SetProfileProperties ( [String] $ProfileName, [String] $ProfileValue ) {
         if ( ($ProfileValue -split ' ').count -eq 6 ) {
            $tempValue    = ($ProfileValue -split ' ')
            $ProfileValue = ($tempValue[0..4] -join ' ') + $tempValue[5]
         }
        if ( ($ProfileValue -split ' ').count -eq 5 ) {
            $pattern = '\b(?<r>\d{3,4}p)\s+(?<x>WS|FS)\s+(?<s>[A-Za-z0-9\+]+)\s+(?<v>[A-Za-z0-9\+\-]+)\s+(?<a>[A-Za-z0-9\+\-\.]+)\b'
            if ($ProfileValue -match $pattern) {
                $this."$($ProfileName)Profile"      = $ProfileValue
                $this."$($ProfileName)Resolution"   = $matches['r']
                $this."$($ProfileName)Aspect"       = $matches['x']
                $this."$($ProfileName)Source"       = $matches['s']
                $this."$($ProfileName)VideoProfile" = $matches['v']
                $this."$($ProfileName)AudioProfile" = $matches['a']
                $this."$($ProfileName)VideoProfileAnimation" = $this."$($ProfileName)VideoProfile" -like "*2DA"
                $this."$($ProfileName)VideoProfileDenoised"  = $this."$($ProfileName)VideoProfile" -like "*ULD"
            }
        }
    }

  # Set the properties passed from AtomicParsley.
    [void] SetATOMproperties ( [Hashtable] $AtomData ) {
        $AtomData.Keys | ForEach-Object {
            if ( $this.PSObject.Properties.Match($_).count -eq 1 ) {
                $this."$($_)" = $AtomData."$($_)"
            }
        }
        $this.SetProfileProperties('Comment',$this.comment)
    }

  # Set the properties of the profile tag as derived from the MPEG data via FFMPEG and MediaInfo.
    [void] SetDerivedProperties ( ) {
        if ( $null -ne $this.MPEG ) {
            $this.SetDerivedResolution()
            $this.SetDerivedSource()
            $this.SetDerivedProfile()
            $this.DerivedAspect       = $this.MPEG.video.AspectRatioTag
            $this.DerivedAudioProfile = $this.MPEG.audio.FormatTag
            $this.DerivedProfile      = $( '{0} {1} {2} {3} {4}' -f $this.DerivedResolution, `
                                                                    $this.DerivedAspect, `
                                                                    $this.DerivedSource, `
                                                                    $this.DerivedVideoProfile, `
                                                                    $this.DerivedAudioProfile )
        }
    }

  # Categorize the file's actual resolution into one of the main media resolutions.
    hidden [void] SetDerivedResolution ( ) {
        if ( $null -ne $this.MPEG ) {
            $this.DerivedResolution = switch ( $this.MPEG.video.AspectRatioTag ) {
                'FS'     {   switch ( [convert]::ToInt32($this.MPEG.video.FrameWidth) ) {
                                { $_ -gt 2200 -and $_ -le 3400 } {    "4K"; break } # 2872
                                { $_ -gt 1200 -and $_ -le 1600 } { "1080p"; break } # 1440
                                { $_ -gt  800 -and $_ -le 1100 } {  "720p"; break } #  960
                                { $_ -gt  700 -and $_ -le  800 } {  "560p"; break } #  744
                                { $_ -gt  600 -and $_ -le  700 } {  "480p"; break } #  640
                                { $_ -gt  300 -and $_ -le  400 } {  "240p"; break } #  320
                            }
                        }
                default {   switch ( [convert]::ToInt32($this.MPEG.video.FrameWidth) ) {
                                { $_ -gt 2100 -and $_ -le 4200 } {    "4K"; break } # 4096
                                { $_ -gt 1700 -and $_ -le 2100 } { "1080p"; break } # 1920
                                { $_ -gt 1100 -and $_ -le 1400 } {  "720p"; break } # 1280
                                { $_ -gt  880 -and $_ -le 1000 } {  "560p"; break } #  996
                                { $_ -gt  500 -and $_ -le  880 } {  "480p"; break } #  854 (Anamorphic)
                                { $_ -gt  200 -and $_ -le  500 } {  "240p"; break } #  320
                            }
                        }
            }
        }
    }

  # Determine the source of the video, if possible. 
    hidden [void] SetDerivedSource ( ) {
        
        if ( $null -ne $this.MPEG ) {

            $AC3 = @('BAMTech','USP','GPAC','VideoHandler')
            $AAC = @('Bento4')

            $m = $this.MPEG
            $a = $this.MPEG.Audio
            $v = $this.MPEG.Video

            $this.DerivedSource = $(
                if     ( ($m.iTunes) -and ($m.DrmProtected)                                            ) { 'IT+' }
                elseif ( ($m.iTunes)                                                                   ) { 'IT'  }
                elseif ( ($v.ColorSpace) -eq 'BT.601 NTSC'                                             ) { 'OTA' }
                elseif ( ($m.EncodedBy) -like "HandBrake *"                                            ) { 'DSC' }
                elseif ( ($m.EncodedBy) -like "Lavf*"                                                  ) { 'SC'  }
                elseif ( ($m.CodecID -eq 'isom') -and ($a.codec -eq 'ec-3'  ) -and $v.encoder -in $AC3 ) { 'SC'  }
                elseif ( ($m.CodecID -eq 'isom') -and ($a.codec -eq 'ac-3'  ) -and $v.encoder -in $AC3 ) { 'SC'  }
                elseif ( ($m.CodecID -eq 'isom') -and ($a.codec -like 'mp4a') -and $v.encoder -in $AAC ) { 'SC'  }
                elseif ( ($m.CodecID -eq 'mp42') -and ($a.codec -eq 'ec-3'  ) -and $v.encoder -in $AC3 ) { 'SC'  }
                else                                                                                     { 'DSC' }
            )

            if ( $this.DerivedSource -eq 'DSC' ) {
                $this.DerivedSource = $( if     ( Test-Is($this.FileTagSource) )        { $this.FileTagSource }
                                         elseif ( Test-Is($this.CommentSource) )        { $this.CommentSource }
                                         elseif ( $this.MPEG.video.FrameWidth -gt 900 ) { 'BR'  }
                                         else                                           { 'DVD' } )
            }

             if ( $this.DerivedSource -eq 'OTA' ) {
                if ( $this.FileTagSource -eq 'DVD' -or $this.CommentSource -eq 'DVD' ) { 
                    $this.DerivedSource = 'DVD' 
                }
            }
            
        }
        
    }

  # Set an encoding profile base on the EncodingSettings included in the exported MPEG data.
    hidden [void] SetDerivedProfile ( ) {

        if ( $null -ne $this.MPEG) {
            $this.DerivedVideoProfile = ([convert]::ToInt32($this.MPEG.video.FrameWidth) -gt 900) ? 'HD' : 'SD'
        }
        
        if ( $null -ne $this.MPEG.video.EncodingSettings ) {

            $this.DerivedVideoProfile = $(
                switch -Wildcard ( $($this.MPEG.video.Profile + ' / ' + $this.MPEG.video.EncodingSettings) ) {
                    '* cabac=0 * bframes=0 * vbv_maxrate=768 * vbv_bufsize=2000 *' { 'IPOD'; break }
                    '* cabac=1 * ref=1 * vbv_maxrate=20000 * vbv_bufsize=25000 *'  { 'NQ';   break }
                    '* cabac=1 * ref=3 * deblock=1:0:0 * vbv_maxrate=62500 *'      { 'HQ';   break }
                    '* ref=4 * bframes=5 * vbv_bufsize=31250 *'                    { 'SHQ';  break }
                    '* ref=3 * bframes=3 * vbv_bufsize=31250 *'                    { 'ATV3'; break }
                    '* cabac=1 * ref=3 * me=umh * subme=10 *'                      { 'ATV2'; break }
                    '* cabac=1 * brdo=0 * mbaff=0 *'                               { 'AU';   break }
                    '* cabac=0 * ref=1 * mbaff=0 * bframes=0 *'                    { 'AU';   break }
                    '* cabac=0 * ref=2 * bframes=0 *'                              { 'AU';   break }
                    '* vbv_maxrate=5500 *'                                         { 'ATV1'; break }
                    '* vbv_maxrate=9500 *'                                         { 'ATV1'; break }
                    '* vbv_maxrate=14000 *'                                        { 'ATV1'; break }
                    '* cabac=1 * subme=10 * vbv_maxrate=17500 *'                   { 'ATV1'; break }
                    '* cabac=0 * ref=4 * bframes=0 *'                              { 'ATV1'; break }
                    '* rc=2pass * ratetol=1.0 *'                                   { 'CBR';  break }
                    default { 
                        ([convert]::ToInt32($this.MPEG.video.FrameWidth) -gt 900) ? 'HD' : 'SD'; break 
                    }
                }
            )

            $crf = $([regex]::Match($this.MPEG.video.EncodingSettings,'(?<=\bcrf=)[0-9]+(?:\.[0-9]+)?').Value)
            if (Test-Is($crf)) { $crf = $crf.ToString().Split('.')[0] } else { $crf = $null }
            $cbr = $([regex]::Match($this.MPEG.video.EncodingSettings,'(?<=\bbitrate=)[0-9]+(?:\.[0-9]+)?').Value)
            if (Test-Is($cbr)) { $cbr = $cbr.ToString().substring(0,$cbr.Length -3) } else { $cbr = $null }
            $this.DerivedVideoProfile += $crf ?? $cbr
            
            if ( $this.MPEG.video.Tuning -eq 'animation') { 
                $this.DerivedVideoProfile += 'A'
                $this.DerivedVideoProfileAnimation = $true
            }
            if ( $this.FileTagVideoProfileDenoised ) { 
                $this.DerivedVideoProfile += 'D'
                $this.DerivedVideoProfileDenoised = $true
            }

        }
        
    }

}