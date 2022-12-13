//
//  TagsCollectionView.swift
//  EditTags
//
//  Created by Davidson on 09/12/22.
//

import UIKit

class TagsCollectionView: UICollectionView {

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        initCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initCollectionView() {
        register(TagsCollectionViewCell.nib(), forCellWithReuseIdentifier: TagsCollectionViewCell.cellIdentifier)
        dataSource = self
        delegate = self
    }
    
}

extension TagsCollectionView: UICollectionViewDataSource{
    override var numberOfSections: Int{
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagsCollectionViewCell.cellIdentifier, for: indexPath) as! TagsCollectionViewCell
        cell.configure(tags: tags[indexPath.row])
        return cell
    }
    
    
}

extension TagsCollectionView: UICollectionViewDelegate{
    
}
