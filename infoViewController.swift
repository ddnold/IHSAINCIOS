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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let attributedString = NSMutableAttributedString(string: "IHSA website")
        let url = URL(string: "https://www.ihsainc.com/about-us/general-information")!
        let range = NSRange(location: 0, length: attributedString.length)
        attributedString.addAttribute(.link, value: url, range: range)
        myLabel1.attributedText = attributedString
        let attributedString2 = NSMutableAttributedString(string: "App website")
        let url2 = URL(string: "https://futuresite.com")!
        let range2 = NSRange(location: 0, length: attributedString2.length)
        attributedString2.addAttribute(.link, value: url2, range: range2)
        myLabel2.attributedText = attributedString2

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
