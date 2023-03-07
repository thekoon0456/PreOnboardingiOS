//
//  MainViewController.swift
//  PreOnboardingiOSChallenge
//
//  Created by Deokhun KIM on 2023/02/28.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var items: [PictureLink] = PictureLink.links
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    typealias Item = PictureLink
    enum Section {
        case main
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LoadPictureCell", for: indexPath) as? LoadPictureCell else {
                return UICollectionViewCell()
            }
            cell.loadButton.tag = indexPath.row
            cell.loadButton.addTarget(self, action: #selector(self.loadImage), for: .touchUpInside)
//            cell.loadImage(self.loadImage(sender: UIButton()))
            return cell
        })
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(items, toSection: .main)
        dataSource.apply(snapshot)
        
        collectionView.collectionViewLayout = layout()
        
    }
    
    @objc func loadImage(sender: UIButton) {
        print(sender.tag)
        
        

        
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(100))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    @IBAction func LoadAllImagesButton(_ sender: Any) {

    }
    
}
