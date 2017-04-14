//
//  VenueFloorJSON.swift
//  OpenStackSummit
//
//  Created by Gabriel Horacio Cutrini on 10/4/16.
//  Copyright © 2016 OpenStack. All rights reserved.
//

import JSON

public extension VenueFloor {
    
    enum JSONKey: String {
        
        case id, name, description, number, image, venue_id, rooms
    }
}

extension VenueFloor: JSONDecodable {
    
    public init?(json JSONValue: JSON.Value) {
        
        guard let JSONObject = JSONValue.objectValue,
            let identifier = JSONObject[JSONKey.id.rawValue]?.integerValue,
            let name = JSONObject[JSONKey.name.rawValue]?.rawValue as? String,
            let number = JSONObject[JSONKey.number.rawValue]?.integerValue,
            let venueIdentifier = JSONObject[JSONKey.venue_id.rawValue]?.integerValue
            else { return nil }
        
        self.identifier = identifier
        self.name = name
        self.number = Int(number)
        self.venue = venueIdentifier
        
        // optional
        self.imageURL = JSONObject[JSONKey.image.rawValue]?.rawValue as? String
        
        if let roomsJSONArray = JSONObject[JSONKey.rooms.rawValue]?.arrayValue {
            
            guard let rooms = Identifier.from(json: roomsJSONArray)
                else { return nil }
            
            self.rooms = Set(rooms)
            
        } else {
            
            self.rooms = []
        }
        
        self.descriptionText = JSONObject[JSONKey.description.rawValue]?.rawValue as? String
    }
}
