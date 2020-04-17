//
//  User+CoreDataProperties.swift
//  Core-Data
//
//  Created by Jacob on 15/04/2020.
//  Copyright © 2020 Jacob Reilly-Cooper. All rights reserved.
//
//

import Foundation
import CoreData

/*
 NSManagedObjectModel - schema description
 NSManagedObjectContext - changes monitor - CRUD
    -> Create, Read, Update & Delete
    -> Post, Get, Put / Patch & Delete
 NSPersistentStoreCoordinator - Save and retrieve our data
 
 NSPersistenContainer - context, model and our coordinator all in one ^^^
 */


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var userName: String?
    @NSManaged public var posts: Set<Post>

}

// MARK: Generated accessors for posts
extension User {

    @objc(addPostsObject:)
    @NSManaged public func addToPosts(_ value: Post)

    @objc(removePostsObject:)
    @NSManaged public func removeFromPosts(_ value: Post)

    @objc(addPosts:)
    @NSManaged public func addToPosts(_ values: NSSet)

    @objc(removePosts:)
    @NSManaged public func removeFromPosts(_ values: NSSet)

}
