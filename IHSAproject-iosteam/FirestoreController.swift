//
//  FirestoreController.swift
//  IHSAproject-iosteam
//
//  Created by Nold,Dustin J on 4/27/23.
//

import Foundation
import Firebase
import FirebaseFirestore

class FirestoreController {
    
    struct Event {
        let Id: String
        let Description: String
        let Location: String
        let EventTime: String
        let RidingPattern: String
        let Zone: Int
        let EventOrder: [[String: Any]]
    }
    
    struct Rider {
        let Id: String
        let FirstName: String
        let LastName: String
        let School: String
        let RiderId: Int
        
        var name: String {
                return "\(FirstName) \(LastName)"
            }
    }

    /* Announcments is not present currently in the database but will need to be added as well for full app functionality*/
    
    func getAllEvents(completion: @escaping ([Event]) -> Void) {
        let db = Firestore.firestore()
        db.collection("events").getDocuments { (snapshot, error) in
            if let error = error {
                print("Error getting events: \(error)")
                completion([])
            } else {
                var events: [Event] = []
                for document in snapshot!.documents {
                    let data = document.data()
                    let eventOrder = data["EventOrder"] as? [[String: Any]] ?? []
                    let event = Event(Id: document.documentID,
                                       Description: data["Description"] as! String,
                                       Location: data["Location"] as! String,
                                       EventTime: data["EventTime"] as! String,
                                       RidingPattern: data["RidingPattern"] as! String,
                                       Zone: data["Zone"] as! Int,
                                       EventOrder: eventOrder )
                    events.append(event)
                }
                completion(events)
            }
        }
    }

    func getAllRiders(completion: @escaping ([Rider]) -> Void) {
        let db = Firestore.firestore()
        db.collection("riders").getDocuments { (snapshot, error) in
            if let error = error {
                print("Error getting riders: \(error)")
                completion([])
            } else {
                var riders: [Rider] = []
                for document in snapshot!.documents {
                    let data = document.data()
                    let rider = Rider(Id: document.documentID,
                                      FirstName: data["FirstName"] as! String,
                                      LastName: data["LastName"] as! String,
                                      School: data["PlaysFor"] as! String,
                                      RiderId: data["RiderId"] as! Int)
                    riders.append(rider)
                }
                completion(riders)
            }
        }
    }

}
