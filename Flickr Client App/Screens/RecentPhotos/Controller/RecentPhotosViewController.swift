//
//  RecentPhotosViewController.swift
//  Flickr Client App
//
//  Created by Mehmet Ergün on 6.06.2022.
//

import UIKit

class RecentPhotosViewController: UITableViewController, UISearchResultsUpdating {
    
    private var response: PhotosResponse? {
        
        didSet {
            tableView.reloadData()
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupSearchController()
        fetchRecentPhotos()
        
   
        

    }
    
    private func setupSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Type something here to search"
        navigationItem.searchController = searchController
    }
    
    // MARK: - Network Request
    
    private func fetchRecentPhotos() {
        guard let url = URL(string: "https://www.flickr.com/services/rest/?method=flickr.photo.getRecent&api_key=1caa45278dffc66b60f9b56da559211f&format=json&nojsoncallback=1&extras=description,license,date_upload,date_taken,owner_name,icon_server,original_format,last_update, geo, tags, machine_tags, o_dims,views,media,path_alias,url_sq,url_t,url_s,url_q,url_m,url_n,url_z,url_c,url_l,url_o") else {return}
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                debugPrint(error)
                return
            }
            if let data = data, let responsePhotos = try? JSONDecoder().decode(PhotosResponse.self, from: data) {
                self.response = responsePhotos
                }
                
        }.resume()
        }
    
    
    private func searchPhotos(with text:String) {
        guard let url = URL(string: "https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=1caa45278dffc66b60f9b56da559211f&text=flower&format=json&nojsoncallback=1extras=description,license,date_upload,date_taken,owner_name,icon_server,original_format,last_update, geo, tags, machine_tags, o_dims,views,media,path_alias,url_sq,url_t,url_s,url_q,url_m,url_n,url_z,url_c,url_l,url_o") else {return}
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                debugPrint(error)
                return
            }
           
                if let data = data, let responsePhotos = try? JSONDecoder().decode(PhotosResponse.self, from: data) {
                    self.response = responsePhotos
                }
                
        }.resume()
    }
    
    
    

    //MARK: - UITableViewDataSource & UITableViewDelegate
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PhotoTableViewCell
        cell.ownerImageView.backgroundColor = .darkGray
        cell.photoImageView.backgroundColor = .gray
        cell.ownerNameLabel.text = "User Name"
        cell.titleLabel.text = "It was great day"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "photoDetailSegue", sender: nil)
    }
    
    
    // MARK: - Navigation
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? PhotoDetailViewController {
            
        }
    }
    

    // MARK: - UISeacrhController
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {return }
        if text.count > 2 {
            searchPhotos(with: text)
        }

    }
    


}
