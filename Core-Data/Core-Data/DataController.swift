//
//  DataController.swift
//  Core-Data
//
//  Created by Jacob on 15/04/2020.
//  Copyright © 2020 Jacob Reilly-Cooper. All rights reserved.
//

import Foundation
import CoreData

/*
NSManagedObjectModel - schema description
NSManagedObjectContext - changes monitor - CRUD
   -> Create, Read, Update & Delete
   -> Post, Get, Put / Patch & Delete
NSPersistentStoreCoordinator - Save and retrieve our data

NSPersistentContainer - context, model and our coordinator all in one ^^^
*/

class DataController {
    
    // new instance of NSPersistentContainer
    let persistentContainer = NSPersistentContainer(name: "OurDataModel")
    
    
    func initialiseStack() {
        
        /* In case we use SQLite...
         
         let description = NSPersistentStoreDescription()
         description.type = NSInMemoryStoreType // allow us to set the type we want
         
         MORE TO COME
         
         */
        
        // initialisation with method of loadPersistentStores
        self.persistentContainer.loadPersistentStores {
            description, error in
            
            // has it succeeded?
            if let error = error {
                print("could not load store \(error.localizedDescription)")
                return
            }
            print("Successfully loaded store")
        }
        
    }
    
    // CRUD
    
    var context: NSManagedObjectContext {
        return self.persistentContainer.viewContext
    }
    
    
    // Create / POST / Insert
    func createUser(withPost: Bool) throws {
        let user = User(context: self.context)
        // dataModel of user
        // save the firstName + save the lastName + save the userName
        // to the entinty - User
        user.firstName = "Jacob"
        user.lastName = "Reilly-Cooper"
        user.userName = "jacob404"
        
        
        // use the Post entity
        // to store a post title
        // add to the post, the user that posted it
        if withPost {
            let post = Post(context: self.context)
            post.title = "Another post"
            user.addToPosts(post)
        }
        
        self.context.insert(user)
        try self.context.save()
    }
    
    // generic fetch
    
    func grabUsers() throws -> [User] {
        let users = try self.context.fetch(User.fetchRequest() as NSFetchRequest<User>)
        return users
    }
    
    // efficient fetch
    
    func grabUsers(withName name: String) throws -> [User] {
        let request = NSFetchRequest<User>(entintyName: "User")
        request.predicate = NSPredicate(format: "firstName == %@", name)
        
        let users = try self.context.fetch(request)
        return users
    }
    
    // update - think Twitter bio or Twitch bio - when you can change details of something that already exists - edit posts etc
    
    func update(user: User) throws {
        user.firstName = "Jacob Benjamin"
        try self.context.save()
    }
    
    // delete - single deletion
    func delete(user: User) throws {
        self.context.delete(user)
        try self.context.save()
    }
    
    // delete in bulk
    func deleteUsers(withName name: String) throws {
        let fetchRequest = User.fetchRequest() as NSFetchRequest<NSFetchRequestResult>
        fetchRequest.predicate = NSPredicate(format: "firstName == %@", name)
        
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        try self.context.execute(deleteRequest)
        try self.context.save()
    }
    
    /*
     transactions:
        save(), undo(), redo(), rollback()
     */
    
    
    
}
