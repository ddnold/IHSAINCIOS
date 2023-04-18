//
//  AnnouncementDetailViewController.swift
//  IHSAproject-iosteam
//
//  Created by Reason on 3/30/23.
//

import Foundation

import UIKit
class AnnouncementDetailViewController: UIViewController {

    var announcement: Announcement? // Add this property to store the selected announcement
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!

        override func viewDidLoad() {
            super.viewDidLoad()
            titleLabel.text = announcement?.name
            contentLabel.text = announcement?.content
        }
        
}
