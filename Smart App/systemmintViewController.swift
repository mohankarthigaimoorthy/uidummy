//
//  systemmintViewController.swift
//  Smart App
//
//  Created by Mohan K on 26/11/22.
//

import UIKit

class systemmintViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var minttableview: UITableView!
    
    var models = [
        "Hello world",
        "Hello world",
        "Hello world",
        "Hello world",
        "Hello world",
        "Hello world",
        "Hello world",
        "Hello world",
        "Hello world",
        "Hello world"
    ]
    
    var modelsText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//       title = "syatemmintscreen"
        
        minttableview.delegate = self
        minttableview.dataSource = self
        
        minttableview.rowHeight = 60
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let modelsSelected = models[indexPath.row]
        
        
        let dialogMessage=UIAlertController(title: "Edit Operation", message: "Edit and NAME The Operation ",preferredStyle: .alert)
        let update = UIAlertAction(title: "Update", style: .default) {(action) in
            
            let updatedModels = self.modelsText.text
            
            self.models[indexPath.row] = updatedModels ?? ""
            
            DispatchQueue.main.async {
                self.minttableview.reloadData()
                print("Data has Been Updated")
            }
        }
        let cancel=UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print("Edit operation cancelled by user")
        }
        dialogMessage.addAction(update)
        
        dialogMessage.addAction(cancel)
        dialogMessage.addTextField { (textfield) in
            self.modelsText = textfield
            self.modelsText.placeholder = "Update name here"
            self.modelsText.text = modelsSelected
        }
        
        self.present(dialogMessage,animated: true,completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            models.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
}
