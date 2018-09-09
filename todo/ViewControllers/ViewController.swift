//
//  ViewController.swift
//  CoreData
//
//  Created by Jitendra on 05/08/18.
//  Copyright © 2018 Jitendra. All rights reserved.
//

import UIKit

var data=[String]()
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 125
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell=tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath) as! Cell
        cell.label.text=data[indexPath.row]
        return cell
    }
    

    @IBOutlet weak var tableV: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data.append("Jitendra")
        data.append("Arvind")
        data.append("Amit")
        data.append("Suresh")
        let nib = UINib(nibName: "cell", bundle: nil)
       self.tableV.register(nib, forCellReuseIdentifier: "Cell")
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
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

