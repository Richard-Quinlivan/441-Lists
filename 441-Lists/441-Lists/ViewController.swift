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
    
    
    var selectedCells: [UITableViewCell] = []
    var selectedIndexes: [IndexPath] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        table.dataSource = self
        table.delegate = self
        
        selectedCells = []
        
    }
    
    @IBAction func deleteRows(){
//        table.deleteRows(at: selectedIndexes!, with: UITableView.RowAnimation(rawValue: 1)!)
    }
}


extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let cell = tableView.cellForRow(at: indexPath)
//        print(indexPath)
        print(cell?.isHighlighted)
        if(cell?.isHighlighted == true){
            print("here")
            cell?.isHighlighted = false
            selectedCells = selectedCells.filter{$0 == cell}
        }
        else{
            cell?.isHighlighted = true
            selectedCells.append(cell!)
            print(selectedCells.count)
        }
//        print(cell == selectedCells![0])

    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath)
        
        cell.textLabel?.text = "hello World"
        
        return cell
    }
    
    
}

