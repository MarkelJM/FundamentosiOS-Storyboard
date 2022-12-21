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
    
    var heroes: [Heroe] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self /* el viewcontroller*/
        tableView.dataSource = self
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell") // identifier is unique
        
        
        navigationItem.title = "Heroes"
        
        let xib = UINib(nibName: "TableCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "customeTableCell")
        
        let token = LocalDataLayer.shared.getToken()
        /* esto se usa para los casoos en la que esta vista se carga una vez que no la necesitemos o ya se ha desaparecdido(por que las apis no son instantaneas). creamos  un self por si ésta desaparece*/
        NetworkLayer.shared.fetchHeroes(token: token) {[weak self] allHeroes, error in
            guard let self = self else{return}
            
            if let allHeroes = allHeroes{
                self.heroes = allHeroes
                LocalDataLayer.shared.save(heroes: allHeroes)
                
                NotificationCenter.default.post(Notification(name: Notification.Name("fetchHeroes")))
                //refresh tableview with new data fetched from the API
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } else {
                print("Error fetching heroes : ", error?.localizedDescription ?? "")
            }
            
        }
    }
    //Delegate and DataSource methos
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let weekDayName = singleRows[indexPath.row]
        cell.textLabel?.text = weekDayName
        
        return cell*/
        let cell = tableView.dequeueReusableCell(withIdentifier: "customeTableCell", for: indexPath) as! TableCell
        let heroe = heroes[indexPath.row]
        cell.tableImage.setImage(url: heroe.photo)
        cell.tableLabel.text = heroe.name
        cell.descLabel.text = heroe.description
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let heroe = heroes[indexPath.row]
        let detailsView = DetailsViewController()
        detailsView.heroe = heroe
        navigationController?.pushViewController(detailsView, animated: true)
    }
    

}

extension UIImageView{
    func setImage(url: String){
        guard let url = URL(string: url) else {return}
        downloadImage(url: url){ [weak self] image in
            guard let self = self else {return}
            
            DispatchQueue.main.async {
                self.image = image
            }
            
        }
        
    }
    private func downloadImage(url: URL, completion: @escaping(UIImage?)->Void){
        
        /*para corregir video lunes David lo soluciono -- Proyecto info...allow y booleano!!!!!!!!!*/
        URLSession.shared.dataTask(with: url) {data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            completion(image)
        }.resume()
    }
}
