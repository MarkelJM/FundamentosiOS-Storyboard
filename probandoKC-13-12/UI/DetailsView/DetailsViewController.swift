//
//  DetailsViewController.swift
//  probandoKC-13-12
//
//  Created by Markel Juaristi on 19/12/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var heroeDescriptionLabel: UILabel!
    @IBOutlet weak var heroeNameLabel: UILabel!
    @IBOutlet weak var heroeImageView: UIImageView!
    @IBOutlet weak var transformationsButton: UIButton!
    var heroe: Heroe!
    var transformations: [Transformation] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        transformationsButton.alpha = 0
        title = heroe.name
        
        heroeImageView.setImage(url: heroe.photo)
        heroeNameLabel.text = heroe.name
        heroeDescriptionLabel.text = heroe.description

        let token = LocalDataLayer.shared.getToken()
        NetworkLayer.shared.fetchTransformation(token: token, heroeId: heroe.id){ [weak self] allTrans, error in
            guard let self = self else{return}
            
            if let allTrans = allTrans{
                self.transformations = allTrans
                
                if !self.transformations.isEmpty{
                    DispatchQueue.main.async {
                        self.transformationsButton.alpha = 1
                    }
                    
                }
                
                
            } else {
                print("Error fetching transformations : ", error?.localizedDescription ?? "")
            }
        }
    }

    @IBAction func transformationsButtonTapped(_ sender: Any) {
        let transView = TransformationViewController()
        transView.transformations = self.transformations
        
        navigationController?.pushViewController(transView, animated: true)
    }
    
   
}
