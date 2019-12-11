//
//  ViewController.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Benjamin Stone on 9/5/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ShowsOnlyViewController: UIViewController {
    
    @IBOutlet weak var showSearch: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var currentSearch = ""
    
    var shows = [Shows]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        showSearch.delegate = self
    }
    
    func getShows(searchInput: String) {
        currentSearch = searchInput
        _ = ShowsAPI.getShows(userSearch: searchInput) { (result) in
            switch result {
            case .failure(let appError):
                print("\(appError)")
            case .success(let show):
                DispatchQueue.main.async {
                    self.shows = show
                }
            }
        }
    }
    
    func searchingShows() {
        shows = shows.filter {$0.name.lowercased().contains(currentSearch.lowercased())}
    }
}

extension ShowsOnlyViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let showCell = tableView.dequeueReusableCell(withIdentifier: "showCell", for: indexPath) as? CustomShowTableViewCell else {
            fatalError()
        }
        let aShow = shows[indexPath.row]
        showCell.loadCell(show: aShow)
        return showCell
    }
}

extension ShowsOnlyViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        currentSearch = searchText
        searchingShows()
        getShows(searchInput: searchText)
    }
}
