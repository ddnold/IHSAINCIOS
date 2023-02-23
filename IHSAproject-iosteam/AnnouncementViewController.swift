//
//  AnnouncementScene.swift
//  IHSAproject-iosteam
//
//  Created by Reason on 2/21/23.
//

import UIKit
import SwiftUI

class AnnouncementViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        var announcements = ["Announcement 1", "Announcement 2", "Announcement 3"]
    @IBOutlet weak var AnnouncementLabel: UILabel!
    var label: UILabel!
    
    @IBOutlet weak var AnnouncementView: UITableView!
    var tableView: UITableView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            tableView = UITableView(frame: view.bounds, style: .plain)
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
            view.addSubview(tableView)
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return announcements.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = announcements[indexPath.row]
            return cell
        }
    }

    



