//
//  ViewController.swift
//  CoreDataSample
//
//  Copyright (c) 2014年 oratta. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    var memoField: UITextField!;
    
    var memoList:   [NSString]  = [];
    var dateList:      [NSDate]    = [];
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        memoField               = UITextField(frame: CGRectMake(100,100,200,30));
        memoField.borderStyle   = UITextBorderStyle.RoundedRect;
        self.view.addSubview(memoField);
        
        let writeBtn: UIButton      = UIButton(frame: CGRectMake(100,150,200,30));
        writeBtn.backgroundColor    = UIColor.magentaColor();
        writeBtn.setTitle("書くぞ", forState: UIControlState.Normal);
        writeBtn.addTarget(self, action: "writeData", forControlEvents: UIControlEvents.TouchUpInside);
        self.view.addSubview(writeBtn);
        
        let readBtn: UIButton       = UIButton(frame: CGRectMake(100,200,200,30));
        readBtn.backgroundColor     = UIColor.cyanColor();
        readBtn.setTitle("読むぞ", forState: UIControlState.Normal);
        readBtn.addTarget(self, action: "readData", forControlEvents: UIControlEvents.TouchUpInside);
        self.view.addSubview(readBtn);
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func writeData()
    {
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate;
        let memoContext:    NSManagedObjectContext = appDel.managedObjectContext!;
        let memoEntity: NSEntityDescription! = NSEntityDescription.entityForName("MemoStore", inManagedObjectContext: memoContext);
        var newData = MemoStore(entity: memoEntity, insertIntoManagedObjectContext: memoContext);
        newData.memo = memoField.text;
        newData.date = NSDate();
    }
    
    func readData()
    {
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate;
        let memoContent:    NSManagedObjectContext  = appDel.managedObjectContext!;
        let memoRequest:    NSFetchRequest          = NSFetchRequest(entityName: "MemoStore");
        memoRequest.returnsObjectsAsFaults          = false;
        
        var results: NSArray! = memoContent.executeFetchRequest(memoRequest, error: nil);
        
        memoList = [];
        dateList = [];
        
        for data in results {
            memoList.append(data.memo);
            dateList.append(data.date);
        }
        
        println(memoList);
        println(dateList);
    }
}

