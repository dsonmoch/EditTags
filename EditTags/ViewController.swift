//
//  ViewController.swift
//  EditTags
//
//  Created by Davidson on 08/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    func createTagsLayout() -> UICollectionViewCompositionalLayout{
        let widthDimension = NSCollectionLayoutDimension.absolute(80)
        let heightDimension = NSCollectionLayoutDimension.absolute(25)
        let itemSize = NSCollectionLayoutSize(widthDimension: widthDimension, heightDimension: heightDimension)
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0)
        let groupSize = NSCollectionLayoutSize(widthDimension: NSCollectionLayoutDimension.fractionalWidth(1), heightDimension: heightDimension)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(CGFloat(5))
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    lazy var tagsCollectionView: TagsCollectionView = {
        let collectionView = TagsCollectionView(frame: CGRect.zero, collectionViewLayout: createTagsLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    @IBOutlet weak var mainCollectionView: UICollectionView!
    let PADDING = CGFloat(8.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainCollectionView.register(MainCollectionViewCell.nib(), forCellWithReuseIdentifier: MainCollectionViewCell.cellIdentifier)
        mainCollectionView.collectionViewLayout = getMainLayout()
        mainCollectionView.dataSource = self
    }
    
    private func getMainLayout() -> UICollectionViewCompositionalLayout {
        let size = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(50)
        )
        let item = NSCollectionLayoutItem(layoutSize: size)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: size, repeatingSubitem: item, count: 1)
        group.interItemSpacing = .fixed(0)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(
            top: PADDING * 2,
            leading: PADDING,
            bottom: PADDING * 2,
            trailing: PADDING
        )
        section.interGroupSpacing = PADDING
        let compositionalLayout = UICollectionViewCompositionalLayout(section: section)
        return compositionalLayout
    }
}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.cellIdentifier, for: indexPath) as! MainCollectionViewCell
        cell.configure(collectionView: collectionView, tagCollectionView: tagsCollectionView)
        return cell
    }
    
    
}

