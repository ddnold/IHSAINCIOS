//
//  ViewController.swift
//  IHSAproject-iosteam
//
//  Created by student on 1/24/23.
//

import UIKit
import PhotosUI
import Firebase

class ViewController: UIViewController{
    
    //ihsalabel
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var searchBar: UISearchBar!

    
    @IBOutlet weak var tableView: UITableView!
    let database = Database.database().reference()
    let data = ["Black Hawk College Western Show","Show 2","Show 3","Show 4","1","2","3","4","5","6","7","8"]
    var filteredData: [String]!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        filteredData = data
        tableView.backgroundColor = .white // or any other color
        tableView.bounces = true
        setupImageSlider()
        self.hideKeyboardWhenTappedAround()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        imageView.addGestureRecognizer(tapGesture)
        imageView.isUserInteractionEnabled = true
        }
    // Function to handle the tap gesture
    @objc func imageTapped() {
    guard let url = URL(string: "https://www.ihsainc.com/about-us/general-information") else { return }
    UIApplication.shared.open(url, options: [:], completionHandler: nil)
}
    
    @IBAction func onInfoPress(_ sender: UIButton) {
        guard let infoViewController = storyboard?.instantiateViewController(withIdentifier: "infoViewController") as? infoViewController else { return }
        

        // Get a reference to the navigation controller for the first tab
        if let navController = tabBarController?.viewControllers?[0] as? UINavigationController {
            navController.pushViewController(infoViewController, animated: true)
        }
    }
    let infoBtn = UIButton(type: .infoLight)
    var imageArray = [UIImage]()
    var currentIndex = 0
    func setupImageSlider() {
        // Add images to the imageArray
        //imageArray = [UIImage(named: "image1")!.resize(to: CGSize(width: 400, height: 200)),
            //UIImage(named: "image2")!,
            //UIImage(named: "image3")!]
        if let image = UIImage(named: "image1") {
            if let resizedImage = image.resize(to: CGSize(width: imageView.bounds.width, height: 150)) {
                imageArray.append(resizedImage)
            }
        }
        if let image = UIImage(named: "image2") {
            if let resizedImage = image.resize(to: CGSize(width: imageView.bounds.width, height: 150)) {
                imageArray.append(resizedImage)
            }
        }
        if let image = UIImage(named: "image3") {
            if let resizedImage = image.resize(to: CGSize(width: imageView.bounds.width, height: 150)) {
                imageArray.append(resizedImage)
            }
        }
        // Set the initial image
        imageView.image = imageArray[currentIndex]
            
        // Start the auto slideshow
        startSlideshow()
        }
        
        func startSlideshow() {
            Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { [weak self] timer in
                guard let self = self else { return }
                
                self.currentIndex += 1
                
                if self.currentIndex >= self.imageArray.count {
                    self.currentIndex = 0
                }
                
                UIView.transition(with: self.imageView,
                                  duration: 0.5,
                                  options: .transitionCrossDissolve,
                                  animations: { self.imageView.image = self.imageArray[self.currentIndex] },
                                  completion: nil)
            }
        }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath)
        cell.textLabel?.text = filteredData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Get the selected cell and its text label
        let cell = tableView.cellForRow(at: indexPath)
        guard let textLabel = cell?.textLabel else { return }
        
        // Show a new view with the selected text as the title
        guard let detailViewController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        detailViewController.title = textLabel.text
        
        // Get a reference to the navigation controller for the first tab
        if let navController = tabBarController?.viewControllers?[0] as? UINavigationController {
            navController.pushViewController(detailViewController, animated: true)
        }
    }




    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if !scrollView.isScrollEnabled {
            scrollView.isScrollEnabled = true
        }
    }

    
}

extension ViewController: UISearchBarDelegate{
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.tableView.isHidden = false
        filteredData = []
        if searchText == ""
        {
            filteredData = data
        }
        for word in data{
            if word.uppercased().contains(searchText.uppercased()){
                filteredData.append(word)
            }
        }
        if filteredData.isEmpty{
            filteredData = data
        }
        self.tableView.reloadData()
        
    }
}
extension UIImage {
    func resize(to size: CGSize) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
//extension to hide keyboard if tapped anywhere else on screen
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
    



