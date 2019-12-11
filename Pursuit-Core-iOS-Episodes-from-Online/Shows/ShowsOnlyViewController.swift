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
    
    var currentSearch = "" {
        didSet {
            ShowsAPI.getShows(userSearch: currentSearch) { (result) in
                switch result {
                case .failure(let appError):
                    print("\(appError)")
                case .success(let shows):
                    DispatchQueue.main.async {
                        self.shows = shows.filter {($0.show?.name.lowercased().contains(self.currentSearch.lowercased()) ?? false)}
                    }
                }
            }
        }
    }
    
    var shows = [ShowsData]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self 
        showSearch.delegate = self
    }
    
    func getShows(searchInput: String) {
        ShowsAPI.getShows(userSearch: searchInput) { (result) in
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
}

extension ShowsOnlyViewController : UITableViewDataSource, UITableViewDelegate {
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
}

extension ShowsOnlyViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        currentSearch = searchBar.text!
       
    }
}
