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
    var topics : [Topic] = [Topic]();
    var speakers: [Speaker] = [Speaker]();
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad();
        self.title = "Schedules";
        self.loadEvents();
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! EventCell
        let event = events[indexPath.row]
        if topics.count > indexPath.row {
            let topic = topics[indexPath.row]
            cell.setUpCell(event: event, topic: topic)
        }
        else {
            cell.setUpCell(event: event, topic: nil)
        }
        
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
                for event in self.events {
                    if let topics = event.fields.topic {
                        for t in topics {
                            self.loadTopic(id: t)
                        }
                    }
                    if let speakers = event.fields.name {
                        for s in speakers {
                            self.loadSpeaker(id: s)
                        }
                    }
                }
            }
            else {
                print("Not working");
        } }
    }
    
    func loadTopic(id: String){
        let requestFactory = RequestFactory()
        requestFactory.getTopic(id: id){ (errorHandle, topic) in
            if let _ = errorHandle.errorType, let errorMessage =
             errorHandle.errorMessage {
                print(errorMessage);
            }
            else if let topic : Topic = topic {
                self.topics.append(topic);
                DispatchQueue.main.async {
                    self.tableView?.reloadData()
                }
            }
            else {
                print("Cannot retrieve topic");
        } }
    }

    func loadSpeaker(id: String){
        let requestFactory = RequestFactory()
        requestFactory.getSpeaker(id: id){ (errorHandle, name) in
            if let _ = errorHandle.errorType, let errorMessage =
             errorHandle.errorMessage {
                print(errorMessage);
            }
            else if let name : Speaker = name {
                self.speakers.append(name);
                DispatchQueue.main.async {
                    self.tableView?.reloadData()
                }
                print(self.speakers)
            }
            else {
                print("Cannot retrieve speaker");
        } }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let senderCell = sender as? EventCell,
           let controller: DetailViewController = segue.destination as? DetailViewController {
            controller.event = senderCell.event
            controller.topic = senderCell.topic
        }
    }
}
