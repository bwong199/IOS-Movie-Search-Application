//
//  Movie.swift
//  MovieSearchApplication
//
//  Created by Ben Wong on 2016-09-28.
//  Copyright © 2016 Ben Wong. All rights reserved.
//

import Foundation
import Alamofire

class Movie {
    
    
    var _title: String!
    var _release_date: String!
    var _movie_image: String!
    var _movie_data: NSData!
    

    var movie_data: NSData {
        if _movie_data == nil {
            let url = NSURL(string: "https://www.purdysgpp.com/images/icon-placeholder.jpg");
            let data = NSData(contentsOf:url! as URL)
            _movie_data = data
        }
        
        return _movie_data
    }
    
    
    var title: String {
        if _title == nil {
            _title = ""
        }
        
        return _title
    }
    
    var release_year: String {
        if _release_date == nil {
            _release_date = ""
        }
        
        return _release_date
    }
    
    var movie_image: String {
        if _movie_image == nil {
            _movie_image = ""
        }
        
        return _movie_image
    }
    
    
    func downloadMovieDetails(completed: @escaping DownloadComplete){
        let movieURL = URL(string: SEARCH_MOVIE_URL)
        print(movieURL)
        Alamofire.request(movieURL!, method: .get ).responseJSON {response in
            
            
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let results = dict["results"] as? NSArray {
                    for x in results {
                        
                        if let movieObject = x as? Dictionary<String, AnyObject> {
                            
                            
                            let new_movie = Movie()
                            
                            if let title = movieObject["title"] as? String {
                                new_movie._title = title
                            }
                            
                            if let release_date = movieObject["release_date"] as? String {
                                new_movie._release_date = release_date
                            }
                            
                            if let image = movieObject["poster_path"] as? String {
                                new_movie._movie_image = image
                                
                                let url = NSURL(string: "http://image.tmdb.org/t/p/w500\(image)");
                                let data = NSData(contentsOf:url! as URL)
                                new_movie._movie_data = data as NSData!
                            }
                      
                            let anyMirror = Mirror(reflecting: movieObject["poster_path"])

                            print(anyMirror)
                            if movieObject["poster_path"] == nil {
//                                new_movie._movie_image = image
                                new_movie._movie_image = "https://www.purdysgpp.com/images/icon-placeholder.jpg"
                                let url = NSURL(string: "https://www.purdysgpp.com/images/icon-placeholder.jpg");
                                let data = NSData(contentsOf:url! as URL)
                                new_movie._movie_data = data as NSData!
                            }
                            
                           MOVIE_ARRAY.append(new_movie)
                            
                        }
                    }
                    
                }
            }
            completed()
        }
    }
}
