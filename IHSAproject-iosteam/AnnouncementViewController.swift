//
//  AnnouncementScene.swift
//  IHSAproject-iosteam
//
//  Created by Reason on 2/21/23.
//

import UIKit
import SwiftUI

class AnnouncementViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        var announcements = ["Announcement 1", "Announcement 2", "Announcement 3", "Announcement 2", "Announcement 3", "Announcement 2", "Announcement 3", "Announcement 2", "Announcement 3"]
    @IBOutlet weak var AnnouncementView: UITableView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            AnnouncementView.delegate = self
            AnnouncementView.dataSource = self
        
        }
        
        func tableView(_ AnnouncementView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return announcements.count
        }
        
        func tableView(_ AnnouncementView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = AnnouncementView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = announcements[indexPath.row]
            return cell
        }
    }

    



