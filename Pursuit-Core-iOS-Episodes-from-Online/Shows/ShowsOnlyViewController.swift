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
    
    var searchInput = ""
    
    var shows = [Shows]() 
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

