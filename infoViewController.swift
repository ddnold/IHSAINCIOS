//
//  infoViewController.swift
//  IHSAproject-iosteam
//
//  Created by Nicholas Taylor on 2/28/23.
//

import UIKit

class infoViewController: UIViewController {
    @IBOutlet weak var myLabel1: UILabel!
    @IBOutlet weak var myLabel2: UILabel!
    
    //ihsalogo
    @IBOutlet weak var infoimg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //creating url for first label; ISHA website
        let infoImageView = UIImageView(frame: CGRect(x:0, y:0, width: 200, height: 200))
        infoimg.image = UIImage(named: "image1")
        let attributedString = NSMutableAttributedString(string: "IHSA website")
        let url = URL(string: "https://www.ihsainc.com/about-us/general-information")!
        let range = NSRange(location: 0, length: attributedString.length)
        attributedString.addAttribute(.link, value: url, range: range)
        myLabel1.attributedText = attributedString
        //creating second url for second label; app website
        let attributedString2 = NSMutableAttributedString(string: "App website")
        let url2 = URL(string: "https://futuresite.com")!
        let range2 = NSRange(location: 0, length: attributedString2.length)
        attributedString2.addAttribute(.link, value: url2, range: range2)
        myLabel2.attributedText = attributedString2
    }
}
