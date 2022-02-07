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
        if let event = event {
            self.topicLabel.text = event.topic
            self.titleLabel.text = event.title
            self.startLabel.text = event.start_time
            self.speakerLabel.text = event.speaker
            self.finishLabel.text = event.finish_time
            self.locationLabel.text = event.location
            self.notesLabel.text = event.notes
        }
            self.topicLabel.textColor = UIColor.init(red: 0.820, green: 0.306, blue: 0.008, alpha: 1);
            self.titleLabel.textColor = UIColor.init(red: 0.749, green: 0.235, blue: 0.122, alpha: 1);
            self.startLabel.textColor = UIColor.init(red: 0.820, green: 0.306, blue: 0.008, alpha: 1);
            self.speakerLabel.textColor = UIColor.init(red: 0.820, green: 0.306, blue: 0.008, alpha: 1);
            self.finishLabel.textColor = UIColor.init(red: 0.820, green: 0.306, blue: 0.008, alpha: 1);
            self.locationLabel.textColor = UIColor.init(red: 0.820, green: 0.306, blue: 0.008, alpha: 1);
            self.notesLabel.textColor = UIColor.init(red: 0.820, green: 0.306, blue: 0.008, alpha: 1);

        
        }


}

