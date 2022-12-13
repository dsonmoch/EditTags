//
//  TagsCollectionViewCell.swift
//  EditTags
//
//  Created by Davidson on 09/12/22.
//

import UIKit

class TagsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var tagsLabel: UILabel!
    @IBOutlet weak var tagsCollectionViewCellHeight: NSLayoutConstraint!
    
    static let cellIdentifier = "TagsCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "TagsCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tagsCollectionViewCellHeight.constant = 20
    }
    
    func configure(tags: Tags){
        tagsLabel.text = tags.tag
        self.layer.cornerRadius = 10
        print(tags.tag)
    }

}
