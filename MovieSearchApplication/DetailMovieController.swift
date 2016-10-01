//
//  DetailMovieController.swift
//  MovieSearchApplication
//
//  Created by Ben Wong on 2016-10-01.
//  Copyright © 2016 Ben Wong. All rights reserved.
//

import UIKit
import ImageLoader

class DetailMovieController: UIViewController {
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var movieDescription: UITextView!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var moviePoster: UIImageView!
    var movie: Movie!
    
    override func viewDidLoad() {
        print(movie.release_year)
        
        movieTitle.text = movie.title
        movieDescription.text = movie.plot
        movieYear.text = movie.release_year
        moviePoster.image = UIImage(data: movie.movie_data as Data)
    }
   
}
