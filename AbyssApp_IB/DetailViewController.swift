//
//  DetailViewController.swift
//  AbyssApp_IB
//
//  Created by Ian Campbell Brothers on 3/18/19.
//  Copyright © 2019 Ian Campbell Brothers. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        detailsetup()
    }
    
    override func viewDidAppear(_ animated: Bool){
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.yellow
    }
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieFormat: UILabel!
    @IBOutlet weak var movieEpisodes: UILabel!
    @IBOutlet weak var movieStudio: UILabel!
    @IBOutlet weak var movieDesc: UITextView!
    @IBOutlet weak var movieSummary: UITextView!

    var details: Entries?

    
    func detailsetup() {
        if let details = details {
            self.navigationItem.title = details.name
            movieTitle.text = details.name
            movieYear.text = details.yearStart
            movieFormat.text = details.format
            movieDesc.text = details.description
            movieSummary.text = details.summary
            if let EpNum = details.episodes {
                movieEpisodes.text = "\(EpNum)"
            }
            movieStudio.text = details.network
            getImage (url: URL(string: details.imageURL!)!) { (image, error) in
                if error != nil {
                    print(error?.localizedDescription ?? "error")
                    return
                }
                
                DispatchQueue.main.async {
                    self.movieImage.image = image
                }
            }
        }
    }
    
    func getImage(url:URL, completion: @escaping (_ image: UIImage?, _ error: Error? ) -> Void) {
        var pic: UIImage?
        let session = URLSession.shared
        let task = session.downloadTask(with: url) { (fileURL, response, error) in
            if error != nil {
                completion(pic,error)
                return
            }
            if let fileURL = fileURL {
                do {
                    let data = try Data(contentsOf: fileURL)
                    pic = UIImage(data: data)
                } catch {
                    completion(pic,error)
                    return
                }
            }
            completion(pic,error)
        }
        task.resume()
    }
}

