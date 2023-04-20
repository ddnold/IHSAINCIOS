import UIKit
import Foundation
import UserNotifications
import IHSAproject_iosteam

struct Announcement: Codable {
    let id: Int
    let title: String
    let date: String
    let text: String
}
class AnnouncementViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var announcements = [Announcement]()
    @IBOutlet weak var AnnouncementView: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        AnnouncementView.delegate = self
        AnnouncementView.dataSource = self
        
        // Create sample announcements
        let announcement1 = Announcement(id: 1, title: "Announcement 1", date: "2023-03-02", text: "Announcement sample 1 Announcement sample 1 Announcement sample 1 Announcement sample 1 Announcement sample 1 Announcement sample 1 Announcement sample 1 Announcement sample 1 Announcement sample 1 Announcement sample 1 Announcement sample 1 Announcement sample 1 Announcement sample 1 Announcement sample 1 Announcement sample 1 Announcement sample 1 Announcement sample 1 Announcement sample 1 Announcement sample 1 Announcement sample 1 Announcement sample 1 Announcement sample 1 Announcement sample 1 Announcement sample 1 Announcement sample 1 Announcement sample 1 Announcement sample 1 Announcement sample 1 Announcement sample 1 Announcement sample 1 Announcement sample 1 Announcement sample 1 Announcement sample 1 Announcement sample 1 Announcement sample 1")
        let announcement2 = Announcement(id: 2, title: "Announcement 2", date: "2023-03-01", text: "This is announcement sample 2")
        let announcement3 = Announcement(id: 3, title: "Announcement 3 Announcement 3", date: "2023-03-03", text: "This is announcement sample 3")
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
            titleLabel.text = announcement.title
            titleLabel.font = UIFont.boldSystemFont(ofSize: titleLabel.font.pointSize)

        }
        
        // Get reference to date label using tag
        if let dateLabel = cell.contentView.viewWithTag(1002) as? UILabel {
            dateLabel.text = announcement.date
        }
        
        // Get reference to description label using tag
        if let descriptionLabel = cell.contentView.viewWithTag(1003) as? UILabel {
            descriptionLabel.text = announcement.text
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Perform segue to AnnouncementDetailViewController
        performSegue(withIdentifier: "announcementDetail", sender: indexPath)
        sendNotification(title: "New message", body: "You have a new message from John", timeInterval: 5)

    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "announcementDetail" {
            if let indexPath = AnnouncementView.indexPathForSelectedRow {
                let destinationController = segue.destination as! AnnouncementDetailViewController
                // Pass the selected announcement to the AnnouncementDetailViewController
                destinationController.announcement = announcements[indexPath.row]

            }
        }
    }
}
