//
//  ViewController.swift
//  MovieSearchApplication
//
//  Created by Ben Wong on 2016-09-28.
//  Copyright © 2016 Ben Wong. All rights reserved.
//

import UIKit
import ImageLoader

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.dataSource = self
        collection.delegate = self
        
        Movie().downloadMovieDetails {
            //            for x in MOVIE_ARRAY {
            //                print(x._title)
            //                print(x._release_date)
            //                print("http://image.tmdb.org/t/p/w500\(x.movie_image)")
            //
            //            }
            
            self.collection.reloadData()
        }        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MOVIE_ARRAY.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as? MovieCell {
            
            
            let movie : Movie
            
            movie = MOVIE_ARRAY[indexPath.row]
            
            cell.yearLabel.text = "\(movie.release_year)"
            
            
            
            cell.moviePoster.image =  UIImage(data: movie.movie_data as Data)
            
            
            
            
            
            
            return cell
        } else {
            return UICollectionViewCell()
        }
        
    }
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //        return CGSize(width: 105, height: 105)
    //    }
}

