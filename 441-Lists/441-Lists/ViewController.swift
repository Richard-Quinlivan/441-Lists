//
//  ViewController.swift
//  441-Lists
//
//  Created by Richard Quinlivan on 3/8/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var deleteButton: UIButton!
    
    var items = ["Test1", "Test2", "Test3", "Test4", "Test5", "Test6"]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        table.delegate = self
        table.dataSource = self
        
        
    }
    
    @IBAction func deleteRows(){
        let selectedIndexes:[IndexPath] = table.indexPathsForSelectedRows ?? []
//        print(selectedIndexes)
        var deleteRow = 0
        if(selectedIndexes.count > 0){
            var i = 0
            while i < items.count{
                print(items[i], table.cellForRow(at: selectedIndexes[deleteRow])?.textLabel!.text)
                if(items[i] == table.cellForRow(at: selectedIndexes[deleteRow])?.textLabel!.text){
                    items = items.filter{$0 != items[i]}
                    i -= 1
                    deleteRow += 1
                    if(deleteRow >= selectedIndexes.count) {
                        break
                    }
                }
                i += 1
            }
            table.deleteRows(at: selectedIndexes, with: .right)

        }
    }
}


extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
    }
}

extension ViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath)
        
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
}

