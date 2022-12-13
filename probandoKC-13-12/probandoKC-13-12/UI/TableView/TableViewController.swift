//
//  TableViewController.swift
//  probandoKC-13-12
//
//  Created by Markel Juaristi on 13/12/22.
//

import UIKit

struct CustomItem {
    let image: UIImage
    let text: String
}

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    @IBOutlet weak var tableView: UITableView!
    
    //let singleRows = [ "lunes", "martes", "miercoles", "jueves", "viernes", "sabado", "domingo"]
    let customRows =  [CustomItem(image: UIImage(systemName: "pencil.circle")!, text: "lunes"),
                       CustomItem(image: UIImage(systemName: "trash.circle")!, text: "martes"),
                       CustomItem(image: UIImage(systemName: "folder.circle")!, text: "miércoles"),
                       CustomItem(image: UIImage(systemName: "paperplane.circle")!, text: "jueves"),
                       CustomItem(image: UIImage(systemName: "doc.circle")!, text: "viernes"),
                       CustomItem(image: UIImage(systemName: "terminal")!, text: "sábado"),
                       CustomItem(image: UIImage(systemName: "book.closed")!, text: "domingo") ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self /* el viewcontroller*/
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell") // identifier is unique
        
        let xib = UINib(nibName: "TableCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "customeTableCell")
    }
    //Delegate and DataSource methos
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customRows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let weekDayName = singleRows[indexPath.row]
        cell.textLabel?.text = weekDayName
        
        return cell*/
        let cell = tableView.dequeueReusableCell(withIdentifier: "customeTableCell", for: indexPath) as! TableCell
        let customItem = customRows[indexPath.row]
        cell.tableImage.image = customItem.image /* en vez de table el profesor usa icon*/
        cell.tableLabel.text = customItem.text
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    

}
