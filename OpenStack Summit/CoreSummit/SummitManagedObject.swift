//
//  SummitManagedObject.swift
//  OpenStack Summit
//
//  Created by Alsey Coleman Miller on 11/1/16.
//  Copyright © 2016 OpenStack. All rights reserved.
//

import Foundation
import CoreData
import SwiftFoundation

public final class SummitManagedObject: Entity {
    
    /// The date this summit was fetched from the server.
    @NSManaged public var initialDataLoad: NSDate?
    
    @NSManaged public var name: String
    
    @NSManaged public var timeZone: String
    
    @NSManaged public var start: NSDate
    
    @NSManaged public var end: NSDate
    
    @NSManaged public var webpageURL: String
    
    @NSManaged public var startShowingVenues: NSDate?
    
    @NSManaged public var sponsors: Set<CompanyManagedObject>
    
    @NSManaged public var speakers: Set<SpeakerManagedObject>
    
    @NSManaged public var summitTypes: Set<SummitTypeManagedObject>
    
    @NSManaged public var ticketTypes: Set<TicketTypeManagedObject>
    
    @NSManaged public var locations: Set<LocationManagedObject>
    
    @NSManaged public var tracks: Set<TrackManagedObject>
    
    @NSManaged public var trackGroups: Set<TrackGroupManagedObject>
    
    @NSManaged public var eventTypes: Set<EventTypeManagedObject>
    
    @NSManaged public var schedule: Set<EventManagedObject>
}

extension Summit: CoreDataDecodable {
    
    public init(managedObject: SummitManagedObject) {
        
        self.identifier = managedObject.identifier
        self.name = managedObject.name
        self.timeZone = managedObject.timeZone
        self.start = Date(foundation: managedObject.start)
        self.end = Date(foundation: managedObject.end)
        self.webpageURL = managedObject.webpageURL
        
        if let startShowingVenues = managedObject.startShowingVenues {
            self.startShowingVenues = Date(foundation: startShowingVenues)
        } else {
            self.startShowingVenues = nil
        }
        
        self.sponsors = Company.from(managedObjects: managedObject.sponsors)
        self.speakers = Speaker.from(managedObjects: managedObject.speakers)
        self.summitTypes = SummitType.from(managedObjects: managedObject.summitTypes)
        self.ticketTypes = TicketType.from()
    }
}

extension Summit: CoreDataEncodable {
    
    public func save(context: NSManagedObjectContext) throws -> SummitManagedObject {
        
        
    }
}

