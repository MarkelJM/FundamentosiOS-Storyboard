//
//  TransformationViewController.swift
//  probandoKC-13-12
//
//  Created by Markel Juaristi on 21/12/22.
//

import UIKit

class TransformationViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    var transformations : [Transformation] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.title = "Transformations"
        
        
        let xib = UINib(nibName: "TableCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "customeTableCell")
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transformations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let weekDayName = singleRows[indexPath.row]
        cell.textLabel?.text = weekDayName
        
        return cell*/
        let cell = tableView.dequeueReusableCell(withIdentifier: "customeTableCell", for: indexPath) as! TableCell
        let heroe = transformations[indexPath.row]
        let nameSort : String = quitarNumerosTitulo(titulo: heroe.name)
        
        cell.tableImage.setImage(url: heroe.photo)
        cell.tableLabel.text = nameSort
        cell.descLabel.text = heroe.description
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    /* funcin para quitar numeracion y puntos*/
    
    /* funcion para quitar numeracion de los titlos de las trandformaciones*/
    func quitarNumerosTitulo(titulo: String)-> String{
        var originalString : String = titulo
        let editedName = originalString.suffix(from: originalString.index(originalString.startIndex, offsetBy: 2))
        return String(editedName)
     }
     
    
    
        
    
   
   
    
}
