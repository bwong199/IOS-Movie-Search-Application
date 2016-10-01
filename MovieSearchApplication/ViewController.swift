//
//  ViewController.swift
//  MovieSearchApplication
//
//  Created by Ben Wong on 2016-09-28.
//  Copyright © 2016 Ben Wong. All rights reserved.
//

import UIKit
import ImageLoader

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.dataSource = self
        collection.delegate = self
        searchBar.delegate = self
        
        activityIndicatorView.isHidden = true
        
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        dismissKeyboard()
        activityIndicatorView.startAnimating()
        self.activityIndicatorView.isHidden = false
        print("SEARCH \(searchBar.text)")
        var query = searchBar.text!
        MOVIE_ARRAY.removeAll()
        self.collection.reloadData()
        Movie().downloadMovieDetails(query: query) {
            self.collection.reloadData()
            self.activityIndicatorView.stopAnimating()
            self.activityIndicatorView.isHidden = true
        }
        searchBar.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "MovieDetailSegue" {
            if let detailsVC = segue.destination as? DetailMovieController {
                if let movie = sender as? Movie {
                    detailsVC.movie = movie
                }
                
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let movie : Movie
        
        movie = MOVIE_ARRAY[indexPath.row]

//        print(movie.plot)
        performSegue(withIdentifier: "MovieDetailSegue", sender: movie)

        
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

