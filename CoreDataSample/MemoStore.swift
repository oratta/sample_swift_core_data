//
//  MemoStore.swift
//  CoreDataSample
//
//  Copyright (c) 2014年 oratta. All rights reserved.
//

import CoreData

@objc(MemoStore)
class MemoStore: NSManagedObject {
    @NSManaged var memo:    String;
    @NSManaged var date:    NSDate;
}