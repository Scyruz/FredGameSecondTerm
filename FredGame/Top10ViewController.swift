//
//  Top10ViewController.swift
//  FredGame
//
//  Created by user188455 on 3/15/21.
//

import UIKit
import CoreData

class Top10ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var scoreTableView: UITableView!
    var managedObjectContext : NSManagedObjectContext!
    
    
    func configureView() {
       
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
        //let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        //managedObjectContext = appDelegate.persistentContainer.viewContext as NSManagedObjectContext
    }
    
    var top10data : Top10? {
        didSet {

        }   
    }
    
    // MARK: Table View
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (top10data?.getList().count)!;
            
        

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let score: Score = (top10data?.getList()[indexPath.row])!
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        cell.textLabel!.text = df.string(from: score.date)+" "+score.name+" "+String(score.points)
        return cell
    }
}
