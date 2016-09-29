//
//  Constants.swift
//  MovieSearchApplication
//
//  Created by Ben Wong on 2016-09-28.
//  Copyright © 2016 Ben Wong. All rights reserved.
//

import Foundation

//https://api.themoviedb.org/3/search/movie?api_key=873a05bbf1bd105ba14e62bc0de94a63&language=en-US&query=toy

let BASE_URL = "https://api.themoviedb.org/3/search/movie?&language=en-US&"
let SEARCH = "&query="
//var QUERY = "tarzan"
let APP_ID = "api_key="
let API_KEY = "873a05bbf1bd105ba14e62bc0de94a63"
var MOVIE_ARRAY : [Movie] = []


typealias DownloadComplete = () -> ()

let SEARCH_MOVIE_URL = "\(BASE_URL)\(APP_ID)\(API_KEY)\(SEARCH)"



