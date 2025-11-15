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

  #-----------------------------------------------
  # Constructors
  #-----------------------------------------------

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
                $this.$($_) = $Info.$($_)
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

  #-----------------------------------------------
  # Constructors
  #-----------------------------------------------

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
                $this.$($_) = $Info.$($_)
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

  #-----------------------------------------------
  # Constructors
  #-----------------------------------------------

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
                $this.$($_) = $Info.$($_)
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

  #-----------------------------------------------
  # Constructors
  #-----------------------------------------------

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
                $this.$($_) = $Info.$($_)
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

  #-----------------------------------------------
  # Constructors
  #-----------------------------------------------

    Image ( ) { }

    Image ( [String] $Type, [String] $URL ) {
        $this.Type        = $Type
        $this.URL         = $URL
    }

    Image ( [Hashtable] $Info ) {
        $Info.Keys | ForEach-Object {
            if ( $this.PSObject.Properties.Match($_).count -eq 1 ) {
                $this.$($_) = $Info.$($_)
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

  #-----------------------------------------------
  # Constructors
  #-----------------------------------------------

    Collection ( ) { }

    Collection ( [String] $ID, [String] $Name ) {
        $this.ID   = $ID
        $this.Name = $Name
    }

    Collection ( [Hashtable] $Info ) {
        $Info.Keys | ForEach-Object {
            if ( $this.PSObject.Properties.Match($_).count -eq 1 ) {
                $this.$($_) = $Info.$($_)
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
                $this.$($_) = $Info.$($_)
            }
        }
    }
    
  #-----------------------------------------------
  # Static Overrides
  #-----------------------------------------------

    static TVShow ( ) {
        Update-TypeData -TypeName 'TVShow' -MemberType ScriptProperty `
            -MemberName Episodes `
            -Value { return $( $this.Seasons | Select-Object -ExpandProperty 'Episodes' )
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

  #-----------------------------------------------
  # Constructors
  #-----------------------------------------------

    TVSeason ( ) { }

    TVSeason ( [int32] $Number ) { $this.Number = $Number }

    TVSeason ( [Hashtable] $Info ) {
        $Info.Keys | ForEach-Object {
            if ( $this.PSObject.Properties.Match($_).count -eq 1 ) {
                $this.$($_) = $Info.$($_)
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

  #-----------------------------------------------
  # Constructors
  #-----------------------------------------------

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
                $this.$($_) = $Info.$($_)
            }
        }
    }

  #-----------------------------------------------
  # Static Overrides
  #-----------------------------------------------

    static TVEpisode ( ) {
        Update-TypeData -TypeName 'TVEpisode' -MemberType ScriptProperty `
            -MemberName 'BaseFileName' `
            -Value {
                $i = ("[{0}]" -f [RegEx]::Escape([IO.Path]::GetInvalidFileNameChars() -Join ''))
                $n = $( "s{0:D2}e{1:D2} - {2}" -f $this.season,$this.number,$($this.Title -replace $i) )
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

  #-----------------------------------------------
  # Constructors
  #-----------------------------------------------

    Movie ( ) {}

    Movie ( [String] $Title ) {
        $this.Title  = $Title
    }

    Movie ( [Hashtable] $Info ) {
        $Info.Keys | ForEach-Object {
            if ( $this.PSObject.Properties.Match($_).count -eq 1 ) {
                $this.$($_) = $Info.$($_)
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
    [bool]     $TaggingComplete
    [bool]     $TagsUpdated
    [String[]] $UpdatedTags = @()

    [String]   $ParentFolderName
    [String]   $ParentFolderPath

    [String]   $CreatedTime
    [String]   $LastUpdatedTime
    
    [String]   $PosterPath

    [Hashtable]        $Tags
    [MediaFileNames]   $Names
    [MediaFileMatches] $Matches
    [PSCustomObject]   $Encoding

  #-----------------------------------------------
  # Constructors
  #-----------------------------------------------

    MediaFile ( ) { }

    MediaFile ( [string] $MediaFilePath ) {
        $this.SetFileProperties( $MediaFilePath )
    }

  #-----------------------------------------------
  # Static Overrides
  #-----------------------------------------------

    static MediaFile ( ) {

        Update-TypeData -TypeName 'MediaFile' -MemberType ScriptProperty `
            -MemberName 'Exists' `
            -Value { return [System.IO.File]::Exists($this.Path) }

        Update-TypeData -TypeName 'MediaFile' -MemberType ScriptProperty `
            -MemberName 'GeneratedName' `
            -Value {
                $i = ("[{0}]" -f [RegEx]::Escape([IO.Path]::GetInvalidFileNameChars() -Join ''))
                $o = [Media]::CleanPunctuation($($this.Tags.tvShowName -replace $i))
                $t = [Media]::CleanPunctuation($($this.Tags.title -replace $i))
                $s = [int]$this.Tags.tvSeasonNumber
                $e = [int]$this.Tags.tvEpisodeNumber
                $n = '{0} - s{1:d2}e{2:d2} - {3}' -f $o,$s,$e,$t
                if ( -not [string]::IsNullOrEmpty($this.Tags.comment) ) {
                    $n += $(' [{0}]' -f $($this.Tags.comment -replace $i))
                }
                $n += '.m4v'
                return $n
            }

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
        # $this.Tags = [MediaFileTags]::new($TagData)
        $this.Tags = $TagData
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

    [Bool]     $ATVpMatchConfirmed
    [Bool]     $TMdbMatchConfirmed
    [Bool]     $TVdbMatchConfirmed
    [Bool]     $IMdbMatchConfirmed

  #-----------------------------------------------
  # Constructors
  #-----------------------------------------------

    MediaFileMatches ( ) { }

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

  #-----------------------------------------------
  # Constructors
  #-----------------------------------------------

    MediaFileNames ( ) { }
    
    MediaFileNames ( [String] $FileName ) {
        $this.Update($FileName)
    }

  #-----------------------------------------------
  # Functions
  #-----------------------------------------------

    [void] Update ( [String] $FileName ) {
        $naming = [Media]::GetFileNaming($FileName)
        $naming.Keys | ForEach-Object {
            if ( $this.PSObject.Properties.Match($_).count -eq 1 ) {
                $this.$($_) = $naming.$($_)
            }
        }
    }

}

#------------------------------------------------------------------------------------------------------------------
# A utility class for static, media-related functions.
#------------------------------------------------------------------------------------------------------------------
Class Media {

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
  # De-tokenizes the file name.
  #-----------------------------------------------------------------------------
    static [PSCustomObject] GetFileNaming ( [string] $FileName ) {

        $fxp = '^(?<base>.+?)\s*(?<tag>\[[^\]]*\])?\s*(?<ext>\.[A-Za-z0-9]{1,6})?$'
        $mxp = '(?<title>.+?)\s*\((?<year>\d{4})\)'
        $num = 'one|two|three|four|five|six|seven|eight|nine|ten'
        $txf = '^(?<show>.+?)\s*-\s*[sS](?<season>\d{1,2})[eE](?<episode>\d{1,2})\s*-\s*(?<title>.+)$'
        $txp = ('(?i)^(?<show>.+?)\s*-\s*s(?<season>\d{1,2})e(?<episode>\d{1,2})\s*-\s*(?<title>.+?)' + 
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
                $ep.Keys | ForEach-Object { $p.$($_) = $ep.$($_) }
            }

            if ( $p.TVEpisodeTitle -like "*©*" ) {
                $p.EncodedAudioCommentary = $true
            }

        }
        else {
            $p.UsesTVShowFormat = $false
            $p.UsesMovieFormat  = $false
        }

        return $p
    }

  #-----------------------------------------------------------------------------
  # De-tokenizes the MPEG profile summary.
  #-----------------------------------------------------------------------------
  # Samples:
  # r      x    s       v      a    ac   c
  # -----  ---  ------  -----  ---  ---  ---
  # 4k     CWS  BR      SHQ20  DD
  # 1080p  WS   BR      SHQ20  DD
  # 1080p  WS   iTunes  HD     DD
  # 1080p  WS   BR      SHQ20  AC3  5.1
  # 1080p  WS   BR      ATV3+  DD        COM
  # 240p   WS   BR      iPod   DPL  2.0
  # 240p   WS   BR      iPod   DPL  2.0  COM
  #-----------------------------------------------------------------------------
    static [PSCustomObject] GetEncodingProfileProperties ( [String] $EncodingProfile ) {
        
        $r = @{ }
        
        $x = @{
            rez = '(?<resolution>(?:\d{3,4}p|4[kK]))'
            asp = '(?<aspect>FS|WS|CWS)'
            src = '(?<source>[A-Za-z0-9\+\-]+)'
            vid = '(?<videoformat>[A-Za-z0-9\+\-]+)'
            aud = '(?<audioformat>[A-Za-z0-9\+\-\.]+)'
            ach = '(?<audiochannels>[0-9\.]+)'
            com = '(?<commentary>[A-Za-z]+)'
            xxx = '\b'
              s = '\s+'
        }
        
        $p = @( $x.xxx, $x.rez, $x.s, $x.asp, $x.s, $x.src, $x.s, $x.vid )

        if ( ($EncodingProfile -split ' ').count -eq 7 -and $EncodingProfile.EndsWith(' COM') ) {
            $p += @( $x.s, $x.aud, $x.s, $x.ach, $x.s, $x.com, $x.xxx )
        }
        elseif ( ($EncodingProfile -split ' ').count -eq 6 -and $EncodingProfile.EndsWith(' COM') ) {
            $p += @( $x.s, $x.aud, $x.s, $x.com, $x.xxx )
        }
        elseif ( ($EncodingProfile -split ' ').count -eq 6 ) {
            $p += @( $x.s, $x.aud, $x.s, $x.ach, $x.xxx )
        }
        else {
            $p += @( $x.s, $x.aud, $x.xxx )
        }

        $p = $p -join ''

        if ($EncodingProfile -match $p) {
            $r.EncodedSummary         = $EncodingProfile 
            $r.EncodedResolution      = $matches['resolution']
            $r.EncodedAspect          = $matches['aspect']
            $r.EncodedSource          = $matches['source']
            $r.EncodedVideoFormat     = $matches['videoformat']
            $r.EncodedAudioFormat     = $matches['audioformat']
            $r.EncodedAudioChannels   = $matches['audiochannels']
            $r.EncodedAudioCommentary = Test-IsSomething($matches['commentary'])
            $r.EncodedVideoIsAnimated = $r.EncodedVideoFormat -like "*2DA"
            $r.EncodedVideoIsDenoised = ( $r.EncodedVideoFormat -like "*ULD" -or 
                                          $r.EncodedVideoFormat.EndsWith('-D') )
        }
        
        return $r

    }

  #-----------------------------------------------------------------------------
  # Removes Special Characters from a string
  #-----------------------------------------------------------------------------
    static [String] ReplaceSpecialCharacters ( [String] $String ) {

        $sc = [System.Collections.Generic.Dictionary[string,string]]::new()

        $sc.Add([char]0x2018,"'") # ‘ LEFT SINGLE QUOTATION MARK
        $sc.Add([char]0x2019,"'") # ’ RIGHT SINGLE QUOTATION MARK
        $sc.Add([char]0x201A,"'") # ‚ SINGLE LOW-9 QUOTATION MARK
        $sc.Add([char]0x201B,"'") # ‛ SINGLE HIGH-REVERSED-9 QUOTATION MARK
        $sc.Add([char]0x2032,"'") # ′ PRIME
        $sc.Add([char]0x2035,"'") # ‵ REVERSED PRIME
        $sc.Add([char]0x275B,"'") # ❛ HEAVY SINGLE COMMA QUOTATION MARK ORNAMENT
        $sc.Add([char]0x275C,"'") # ❜
        $sc.Add([char]0x201C,'"') # “ LEFT DOUBLE QUOTATION MARK
        $sc.Add([char]0x201D,'"') # ” RIGHT DOUBLE QUOTATION MARK
        $sc.Add([char]0x201E,'"') # „ DOUBLE LOW-9 QUOTATION MARK
        $sc.Add([char]0x201F,'"') # ‟ DOUBLE HIGH-REVERSED-9 QUOTATION MARK
        $sc.Add([char]0x2033,'"') # ″ DOUBLE PRIME
        $sc.Add([char]0x2036,'"') # ‶ REVERSED DOUBLE PRIME
        $sc.Add([char]0x275D,'"') # ❝ HEAVY DOUBLE COMMA QUOTATION MARK ORNAMENT
        $sc.Add([char]0x275E,'"') # ❞
        
        $sc.Add("&#233;","Ã©")
        $sc.Add("&#192;","A")
        $sc.Add("&#193;","A")
        $sc.Add("&#194;","A")
        $sc.Add("&#195;","A")
        $sc.Add("&#196;","A")
        $sc.Add("&#197;","A")
        $sc.Add("&#198;","A")
        $sc.Add("&#200;","E")
        $sc.Add("&#201;","E")
        $sc.Add("&#202;","E")
        $sc.Add("&#203;","E")
        $sc.Add("&#204;","I")
        $sc.Add("&#205;","I")
        $sc.Add("&#206;","I")
        $sc.Add("&#207;","I")
        $sc.Add("&#210;","O")
        $sc.Add("&#211;","O")
        $sc.Add("&#212;","O")
        $sc.Add("&#213;","O")
        $sc.Add("&#214;","O")
        $sc.Add("&#217;","U")
        $sc.Add("&#218;","U")
        $sc.Add("&#219;","U")
        $sc.Add("&#220;","U")
        $sc.Add("&#224;","a")
        $sc.Add("&#225;","a")
        $sc.Add("&#226;","a")
        $sc.Add("&#227;","a")
        $sc.Add("&#228;","a")
        $sc.Add("&#229;","a")
        $sc.Add("&#230;","a")
        $sc.Add("&#232;","e")
        $sc.Add("&#234;","e")
        $sc.Add("&#235;","e")
        $sc.Add("&#236;","i")
        $sc.Add("&#237;","i")
        $sc.Add("&#238;","i")
        $sc.Add("&#239;","i")
        $sc.Add("&#242;","o")
        $sc.Add("&#243;","o")
        $sc.Add("&#244;","o")
        $sc.Add("&#245;","o")
        $sc.Add("&#246;","o")
        $sc.Add("&#249;","u")
        $sc.Add("&#250;","u")
        $sc.Add("&#251;","u")
        $sc.Add("&#252;","u")
        $sc.Add("&#253;","y")
        $sc.Add("&#254;","y")
        $sc.Add("&#255;","y")

        foreach ( $k in $sc.keys ) {
            $String = $String.Replace( $k,$sc[$k] )
        }
        return $String

    }

  #-----------------------------------------------------------------------------
  # Removes Special Punctuation from a string
  #-----------------------------------------------------------------------------
    static [String] CleanPunctuation ( [String] $String ) {
        
        $sc = [System.Collections.Generic.Dictionary[string,string]]::new()
        $sc.Add([char]0x2018,"'") # ‘ LEFT SINGLE QUOTATION MARK
        $sc.Add([char]0x2019,"'") # ’ RIGHT SINGLE QUOTATION MARK
        $sc.Add([char]0x201A,"'") # ‚ SINGLE LOW-9 QUOTATION MARK
        $sc.Add([char]0x201B,"'") # ‛ SINGLE HIGH-REVERSED-9 QUOTATION MARK
        $sc.Add([char]0x2032,"'") # ′ PRIME
        $sc.Add([char]0x2035,"'") # ‵ REVERSED PRIME
        $sc.Add([char]0x275B,"'") # ❛ HEAVY SINGLE COMMA QUOTATION MARK ORNAMENT
        $sc.Add([char]0x275C,"'") # ❜
        $sc.Add([char]0x201C,'"') # “ LEFT DOUBLE QUOTATION MARK
        $sc.Add([char]0x201D,'"') # ” RIGHT DOUBLE QUOTATION MARK
        $sc.Add([char]0x201E,'"') # „ DOUBLE LOW-9 QUOTATION MARK
        $sc.Add([char]0x201F,'"') # ‟ DOUBLE HIGH-REVERSED-9 QUOTATION MARK
        $sc.Add([char]0x2033,'"') # ″ DOUBLE PRIME
        $sc.Add([char]0x2036,'"') # ‶ REVERSED DOUBLE PRIME
        $sc.Add([char]0x275D,'"') # ❝ HEAVY DOUBLE COMMA QUOTATION MARK ORNAMENT
        $sc.Add([char]0x275E,'"') # ❞
        
        foreach ( $k in $sc.keys ) {
            $String = $String.Replace( $k,$sc[$k] )
        }

        return $String

    }

}

