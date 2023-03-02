//
//  AnnouncementScene.swift
//  IHSAproject-iosteam
//
//  Created by Reason on 2/21/23.
//

import UIKit
import SwiftUI

class AnnouncementViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    struct Announcement: Codable {
        let id: Int
        let name: String
        let date: String
        let content: String
    }
    
    var announcements = [Announcement]()
    @IBOutlet weak var AnnouncementView: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
            
        AnnouncementView.delegate = self
        AnnouncementView.dataSource = self
        
        // Create sample announcements
        let announcement1 = Announcement(id: 1, name: "Announcement 1", date: "2023-03-02", content: "Announcement sample 1 Announcement sample 1 Announcement sample 1 Announcement sample 1 Announcement sample 1")
        let announcement2 = Announcement(id: 2, name: "Announcement 2", date: "2023-03-01", content: "This is announcement sample 2")
        let announcement3 = Announcement(id: 3, name: "Announcement 3 Announcement 3", date: "2023-03-03", content: "This is announcement sample 3")
        announcements = [announcement1, announcement2, announcement3]
    }
        
    func tableView(_ AnnouncementView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return announcements.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60 // adjust the height as needed
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let announcement = announcements[indexPath.row]
        // Get reference to title label using tag
            if let titleLabel = cell.contentView.viewWithTag(1001) as? UILabel {
                titleLabel.text = announcement.name
                titleLabel.font = UIFont.boldSystemFont(ofSize: titleLabel.font.pointSize)

            }
            
            // Get reference to date label using tag
            if let dateLabel = cell.contentView.viewWithTag(1002) as? UILabel {
                dateLabel.text = announcement.date
            }
            
            // Get reference to description label using tag
            if let descriptionLabel = cell.contentView.viewWithTag(1003) as? UILabel {
                descriptionLabel.text = announcement.content
            }
        return cell
    }
}
