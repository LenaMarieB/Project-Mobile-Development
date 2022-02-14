//
//  ViewController.swift
//  Event_mobile_dev_project
//
//  Created by Camille Omnes on 31/01/2022.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var topicLabel : UILabel!
    @IBOutlet weak var startLabel : UILabel!
    @IBOutlet weak var finishLabel : UILabel!
    @IBOutlet weak var locationLabel : UILabel!
    @IBOutlet weak var speakerLabel : UILabel!
    @IBOutlet weak var notesLabel : UITextView!
    @IBOutlet weak var locationImage : UIImageView!
    
    var event : Event?
    var topic : Topic?
    var speaker : Speaker?
    var location : Location?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let event = event {
            if let t = topic?.fields.topic {
                self.topicLabel.text = t
            }
            self.titleLabel.text = event.fields.activity
            if let date = event.fields.start {
                if let d = formatter.date(from: date) {
                    self.startLabel.text = String(NSCalendar.current.component(.hour, from: d as Date)) + "h" + String(NSCalendar.current.component(.minute, from: d as Date));
                } else {
                    print("error while converting date")
                }
            }
            if let date = event.fields.end {
                if let d = formatter.date(from: date) {
                    self.finishLabel.text = String(NSCalendar.current.component(.hour, from: d as Date)) + "h" + String(NSCalendar.current.component(.minute, from: d as Date));
                } else {
                    print("error while converting date")
                }
            }
            self.notesLabel.text = event.fields.notes
        }
        if let speaker = speaker {
            if let speakerName = speaker.fields.name {
                self.speakerLabel.text = speakerName
            }
        }
        
        if let location = location {
            if let spaceName = location.fields.space {
                self.locationLabel.text = spaceName
            }
        }
        if let location = location {
            if let urlImage = location.fields.photos?.first?.url {
                let url = URL(string : urlImage)!
                getData(from: url) { data, response, error in
                        guard let data = data, error == nil else { return }
                        print(response?.suggestedFilename ?? url.lastPathComponent)
                        print("Download Finished")
                        // always update the UI from the main thread
                        DispatchQueue.main.async() { [weak self] in
                            self?.locationImage.image = UIImage(data: data)
                        }
                }
                print(urlImage)
            }
        }
            self.topicLabel.textColor = UIColor.init(red: 0.820, green: 0.306, blue: 0.008, alpha: 1);
            self.titleLabel.textColor = UIColor.init(red: 0.749, green: 0.235, blue: 0.122, alpha: 1);
            self.startLabel.textColor = UIColor.init(red: 0.820, green: 0.306, blue: 0.008, alpha: 1);
            self.speakerLabel.textColor = UIColor.init(red: 0.820, green: 0.306, blue: 0.008, alpha: 1);
            self.finishLabel.textColor = UIColor.init(red: 0.820, green: 0.306, blue: 0.008, alpha: 1);
            self.locationLabel.textColor = UIColor.init(red: 0.820, green: 0.306, blue: 0.008, alpha: 1);
            self.notesLabel.textColor = UIColor.init(red: 0.820, green: 0.306, blue: 0.008, alpha: 1);

            self.titleLabel.font = UIFont.boldSystemFont(ofSize: 20.0);


        self.view.backgroundColor = UIColor.init(red: 0.976, green: 0.882, blue: 0.863, alpha: 1);
        self.notesLabel.backgroundColor = UIColor.init(red: 0.976, green: 0.882, blue: 0.863, alpha: 1);
        }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}

