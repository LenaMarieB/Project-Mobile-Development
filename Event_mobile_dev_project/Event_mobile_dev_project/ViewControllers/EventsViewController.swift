//
//  EventsViewController.swift
//  Event_mobile_dev_project
//
//  Created by Antoine Montes on 31/01/2022.
//

import UIKit
import Foundation

class EventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var events : [Event] = [Event]();
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        events = [Event(title : "event", type : "type", location:"location", speaker:"speaker", start_time:"10h20", finish_time:"11h20", notes : "Blablabla, this is a note", topic : "topic", day: "15 novembre")]
        
        self.title = "Event"
        self.dayLabel.text = events[0].day
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(events.count)
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: EventCell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! EventCell
        let event = events[indexPath.row]
        
        cell.setUpCell(event: event)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
