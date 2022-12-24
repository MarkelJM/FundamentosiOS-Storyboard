//
//  CollectionViewController.swift
//  probandoKC-13-12
//
//  Created by Markel Juaristi on 13/12/22.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var heroes: [Heroe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        navigationItem.title = "Heroes"
        heroes = LocalDataLayer.shared.getHeroes()
        
        let xib = UINib(nibName: "CollectionCellCollectionViewCell", bundle: nil)
        collectionView.register(xib, forCellWithReuseIdentifier: "customCollectionCell")
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        heroes = LocalDataLayer.shared.getHeroes()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCollectionCell", for: indexPath) as! CollectionCellCollectionViewCell
        let heroe = heroes[indexPath.row]
        cell.iconImageView.setImage(url: heroe.photo)
        cell.titleLabel.text = heroe.name
        
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsInRow: CGFloat = 2
        let spacing : CGFloat = 10
        let totalSpacing : CGFloat = ( itemsInRow - 1) * spacing
        let finalWidth = ( collectionView.frame.width - totalSpacing) /  itemsInRow
        
        return CGSize(width: finalWidth, height: 140)
        
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectRowAt indexPath: IndexPath) {
        let heroe = heroes[indexPath.row]
        let detailsView = DetailsViewController()
        detailsView.heroe = heroe
        navigationController?.pushViewController(detailsView, animated: true)
    }
}
