//
//  EventCell.swift
//  Event_mobile_dev_project
//
//  Created by Camille Omnes on 31/01/2022.
//

import Foundation
import UIKit

class EventCell: UITableViewCell {
    @IBOutlet weak var eventLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    var event: Event?
        
    func setUpCell(event: Event) {
        self.event = event
        self.eventLabel.text = event.title;
        self.timeLabel.text = event.start_time;
        self.typeLabel.text = event.type.rawValue;

        self.eventLabel.textColor = UIColor.init(red: 0.749, green: 0.235, blue: 0.122, alpha: 1);
        self.timeLabel.textColor = UIColor.init(red: 1, green: 0.647, blue: 0, alpha: 1);
        self.typeLabel.textColor = UIColor.white;

        self.typeLabel.backgroundColor = ColorType(type : event.type);
        self.typeLabel.layer.cornerRadius = 8;
        self.typeLabel.layer.borderWidth = 2;
        self.typeLabel.layer.borderColor = ColorType(type: event.type).cgColor;
        self.typeLabel.layer.masksToBounds = true;
    }
}
