//
//  ImageManagedObject.swift
//  OpenStack Summit
//
//  Created by Alsey Coleman Miller on 11/1/16.
//  Copyright © 2016 OpenStack. All rights reserved.
//

import Foundation
import CoreData

public final class ImageManagedObject: Entity {
    
     @NSManaged public var url: String
}

extension Image: CoreDataDecodable {
    
    public init(managedObject: ImageManagedObject) {
        
        self.identifier = managedObject.identifier
        self.url = managedObject.url
    }
}

extension Image: CoreDataEncodable {
    
    public func save(context: NSManagedObjectContext) throws -> ImageManagedObject {
        
        let managedObject = try cached(context)
        
        managedObject.url = url
        
        managedObject.didCache()
        
        return managedObject
    }
}