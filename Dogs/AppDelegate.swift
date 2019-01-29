//
//  AppDelegate.swift
//  Dogs
//
//  Created by steve on 2018-07-11.
//  Copyright © 2018 steve. All rights reserved.
//

import UIKit
import CoreData

/*
 CRUD
 - create
 - fetch
  - simple
  - sorted
  - filtered
 - update
 - delete
 */

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  var context: NSManagedObjectContext!
  
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    context = persistentContainer.viewContext
    //    createDogs()
    //    simpleFetch()
//    fetchWithSort()
//    guard let zeke = fetchWithPredicate() else { return true}
//    update(dog: zeke)
//    delete(dog: zeke)
    guard let nav = window?.rootViewController as? UINavigationController, let rootController = nav.topViewController as? MainViewController else { return false }
    rootController.dataManager = DataManager(context: context)
    return true
  }
  
  func applicationWillTerminate(_ application: UIApplication) {
    self.saveContext()
  }
  
  // MARK: - Core Data stack
  
  lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "Dogs")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    return container
  }()
  
  // MARK: - Core Data Saving support
  
  func saveContext () {
    if context.hasChanges {
      do {
        try context.save()
      } catch {
        let nserror = error as NSError
        fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
      }
    }
  }
  
}


