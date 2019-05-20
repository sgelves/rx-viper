//
//  ResultsViewController.swift
//  test tabela
//
//  Created by user155532 on 5/11/19.
//  Copyright © 2019 sgelves. All rights reserved.
//

import UIKit
import Kingfisher
import CoreLocation

class ResultsViewController: UIViewController,
UITableViewDataSource, UITableViewDelegate,
CLLocationManagerDelegate, LocaisModel {
    
    @IBOutlet weak var tableView: UITableView!

    var resultData: [Local] = []
    var currentPage: Int = 0
    var isFetchingLoais: Bool = false
    var searchString: String = ""
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    
    private var coordinate: CLLocationCoordinate2D?
    var locationManager: CLLocationManager = CLLocationManager()
    
    
    var searchController : UISearchController! = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.requestLocation()
        self.createSearhBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // the bar hidden behavior is deactivated in viewdiedload, then here is gets hidden when scrolling again
        navigationItem.hidesSearchBarWhenScrolling = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath) as! ResultCellTableViewCell
        let result = resultData[indexPath.row]
        cell.title.text = result.placeName
        
        if (result.placePhoto != nil) {
            cell.thumbnail.kf.setImage(with: URL(string: result.placePhoto!), options: [.diskCacheExpiration(.days(9))])
        }
        
        return cell
    }
    
    func loadData () {
        if self.coordinate != nil {
            self.getNextPage() {
                self.tableView.reloadData()
            }
        }
    }
    
    /*
        Infinite scroll functionality
    */
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offset > contentHeight - scrollView.frame.height * 2{
            self.loadData()
        }
        
    }
    
    /*
        Requesting location functionality
    */
    func requestLocation () {
        if CLLocationManager.locationServicesEnabled() == true {
            
            switch CLLocationManager.authorizationStatus() {
            case .notDetermined:
                // Request when-in-use authorization initially
                locationManager.requestWhenInUseAuthorization()
                break
                
            case .restricted, .denied:
                // Disable location features, in this case ask for permissions again
                locationManager.requestWhenInUseAuthorization()
                break
                
            case .authorizedWhenInUse, .authorizedAlways:
                // Enable basic location features
                locationManager.desiredAccuracy = kCLLocationAccuracyBest
                locationManager.delegate = self
                locationManager.startUpdatingLocation()
                break
            @unknown default:
                self.errorUserCoordinateMessage()
                break
            }
            
        } else {
            self.enableGPSMessage()
        }
    }
    
    /*
        Responding to request location result
     */
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.locationManager.stopUpdatingLocation()
        self.setUserCoordinate(coordinate: locations[0].coordinate)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.errorUserCoordinateMessage()
    }
    
    
    /*
        Presenting the results with the qeuried location.
     */
    func setUserCoordinate (coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        self.startLocaisState(latitude: coordinate.latitude, longitude: coordinate.longitude, searchString: self.searchString)
        self.loadData()
    }
    
    /*
        Ask the user for activating the GPS
     */
    func enableGPSMessage () {
        
    }
    
    /*
        Tell the user that there were ane error while getting his location.
     */
    func errorUserCoordinateMessage () {
        
    }
    
    func createSearhBar() {
        
        self.searchController.searchResultsUpdater = self // changing text event
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.searchBar.placeholder = "Buscar um local"
        self.searchController.searchBar.delegate = self // search button pressed event
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        definesPresentationContext = true
        
    }
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        guard self.coordinate != nil else {
            return
        }
        self.startLocaisState(latitude: self.coordinate!.latitude, longitude: self.coordinate!.longitude, searchString: searchText)
        loadData()
    }
}

extension ResultsViewController: UISearchBarDelegate,  UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        if (searchController.searchBar.text!.isEmpty && !self.searchString.isEmpty) {
            // Clear the search filter when the model is not empty
            print("cleaning search filter")
            filterContentForSearchText(searchController.searchBar.text!)
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // search only when the search button is hit
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
