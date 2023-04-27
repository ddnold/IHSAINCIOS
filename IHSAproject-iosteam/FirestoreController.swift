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
    
    struct Rider: Codable {
        let Id: String
        let FirstName: String
        let LastName: String
        let School: String
        let RiderId: Int
        
        var name: String {
            return "\(FirstName) \(LastName)"
        }
        
        // Define CodingKeys enumeration to map struct's properties to keys in the encoded data
        enum CodingKeys: String, CodingKey {
            case Id
            case FirstName
            case LastName
            case School
            case RiderId
        }
        
        // Implement the encode(to:) method to encode struct's properties using CodingKeys enumeration
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Id, forKey: .Id)
            try container.encode(FirstName, forKey: .FirstName)
            try container.encode(LastName, forKey: .LastName)
            try container.encode(School, forKey: .School)
            try container.encode(RiderId, forKey: .RiderId)
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
    
    func getUnsavedRiders(completion: @escaping ([Rider]) -> Void) {
        getAllRiders { (riders) in
            var unsavedRiders: [Rider] = []
            for rider in riders {
                if !UserDefaults.standard.bool(forKey: rider.Id) {
                    unsavedRiders.append(rider)
                }
            }
            completion(unsavedRiders)
        }
    }

    func getSavedRiders(completion: @escaping ([Rider]) -> Void) {
        getAllRiders { (riders) in
            var savedRiders: [Rider] = []
            for rider in riders {
                if UserDefaults.standard.bool(forKey: rider.Id) {
                    savedRiders.append(rider)
                }
            }
            completion(savedRiders)
        }
    }

    func saveRiderLocally(rider: Rider) {
        UserDefaults.standard.set(true, forKey: rider.Id)
    }
    
    func removeRiderLocally(rider: Rider) {
        if var savedRiders = UserDefaults.standard.object(forKey: "savedRiders") as? [String] {
            // Remove the rider ID from the saved riders array
            savedRiders.removeAll(where: { $0 == rider.Id })
            
            // Save the updated saved riders array back to user defaults
            UserDefaults.standard.set(savedRiders, forKey: "savedRiders")
            
            // Remove the rider from the locally stored riders array
            if var localRiders = UserDefaults.standard.object(forKey: "localRiders") as? [Rider] {
                localRiders.removeAll(where: { $0.Id == rider.Id })
                UserDefaults.standard.set(try? PropertyListEncoder().encode(localRiders), forKey: "localRiders")
            }
        }
    }


}
