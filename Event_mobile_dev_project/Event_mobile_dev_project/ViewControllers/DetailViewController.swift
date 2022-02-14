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
    
    var event : Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let event = event {
            self.topicLabel.text = event.fields.topic?.first
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
            self.speakerLabel.text = event.fields.speakers?.first
            self.locationLabel.text = event.fields.location?.first
            self.notesLabel.text = event.fields.notes
        }
    }


}

