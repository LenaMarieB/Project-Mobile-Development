//
//  EventsViewController.swift
//  Event_mobile_dev_project
//
//  Created by Camille Omnes on 31/01/2022.
//

import UIKit
import Foundation

class EventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var events : [Event] = [Event]();
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad();
        self.title = "Schedules";
        self.loadEvents();
        print(self.events);
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(events.count)
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! EventCell
        let event = events[indexPath.row]
        
        cell.setUpCell(event: event)
        
        return cell
    }
    
    func loadEvents(){
        let requestFactory = RequestFactory()
        requestFactory.getEventList { (errorHandle, eventList) in
            if let _ = errorHandle.errorType, let errorMessage =
             errorHandle.errorMessage {
                print(errorMessage);
            }
            else if let eventList : [Event] = eventList {
                self.events = eventList;
                DispatchQueue.main.async {
                    self.tableView?.reloadData()
                }
            }
            else {
                print("Not working");
        } }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let senderCell = sender as? EventCell,
           let controller: DetailViewController = segue.destination as? DetailViewController {
            controller.event = senderCell.event
        }
    }
}
