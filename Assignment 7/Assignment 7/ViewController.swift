//
//  ViewController.swift
//  Assignment 7
//
//  Created by Justin.Hensley on 2025-07-03.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var meals = [
            Food("Chicken and Rice", 266),
            Food("Pintos and Greens", 176),
            Food("Ham Sandwhich", 409),
            Food("Bowl of Cereal", 377),
            Food("Two Egg and Toast", 319),
            Food("Sugar Free Jello", 10),
            Food("Pepperoni Pizza Slice", 313),
            Food("Water with Flavoring", 5),
            Food("Diet Soda", 0),
            Food("Snickers Bar", 215)
            ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = meals[indexPath.row].name
        content.secondaryText = "\(meals[indexPath.row].cal)"
        cell.contentConfiguration = content
        return cell
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "toResults",
            let resultsVC = segue.destination as? ResultsViewController,
            let cell      = sender as? UITableViewCell,
            let ip        = tableView.indexPath(for: cell)
        else {return}
            resultsVC.f = meals[ip.row].name
    }


    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            //tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath)!
        performSegue(withIdentifier: "toResults", sender: cell)
        
    }
    
    
    
    
    
}

