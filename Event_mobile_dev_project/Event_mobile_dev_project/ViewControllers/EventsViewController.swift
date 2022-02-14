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
    var locations: [Location] = [Location]();

    
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
            if speakers.count > indexPath.row {
                let s = speakers[indexPath.row]
                if locations.count > indexPath.row {
                    let l = locations[indexPath.row]
                    cell.setUpCell(event: event, topic: topic, speaker: s, location: l)
                }
                else {
                    cell.setUpCell(event: event, topic: topic, speaker: s, location: nil)
                }
            }
            else {
                cell.setUpCell(event: event, topic: topic, speaker: nil, location: nil)
            }
        }
        else {
            cell.setUpCell(event: event, topic: nil, speaker: nil, location: nil)
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
                    if let speakers = event.fields.speakers {
                        for s in speakers {
                            self.loadSpeaker(id: s)
                        }
                    }
                    if let locations = event.fields.location {
                        for l in locations {
                            print(l)
                            self.loadLocation(id: l)
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
            }
            else {
                print("Cannot retrieve speaker");
        } }
    }

    func loadLocation(id: String){
        let requestFactory = RequestFactory()
        requestFactory.getLocation(id: id){ (errorHandle, location) in
            if let _ = errorHandle.errorType, let errorMessage =
             errorHandle.errorMessage {
                print(errorMessage);
            }
            else if let location : Location = location {
                self.locations.append(location);
                DispatchQueue.main.async {
                    self.tableView?.reloadData()
                }
                print(self.locations)
            }
            else {
                print("Cannot retrieve location");
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
            controller.speaker = senderCell.speaker
            controller.location = senderCell.location
        }
    }
}
