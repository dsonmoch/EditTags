//
//  MainCollectionViewCell.swift
//  EditTags
//
//  Created by Davidson on 09/12/22.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mainCellContentUIView: UIView!
    @IBOutlet weak var mainCellContentUIViewHeight: NSLayoutConstraint!
    @IBOutlet weak var listTagsUIView: UIView!
    @IBOutlet weak var listTagsUiViewHeightConstraints: NSLayoutConstraint!
    @IBOutlet weak var editTagsButton: UIButton!
    @IBOutlet weak var tagsInputField: UITextField!
    @IBOutlet weak var addTagsButton: UIButton!
    @IBOutlet weak var addTagUIView: UIView!
    @IBOutlet weak var addTagUIViewHeight: NSLayoutConstraint!
    @IBOutlet weak var editTagsButtonHeight: NSLayoutConstraint!
    var mainCollectionView: UICollectionView!
    var tagsCollectionView: UICollectionView!
    static let cellIdentifier = "MainCollectionViewCell"

    static func nib() -> UINib {
        return UINib(nibName: "MainCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainCellContentUIViewHeight.constant = 65
        self.layer.cornerRadius = 15
    }
    
    func configure(collectionView: UICollectionView, tagCollectionView: UICollectionView){
        mainCollectionView = collectionView
        tagsCollectionView = tagCollectionView
    }
    
    @IBAction func didTapEditTagsButton(_ sender: Any) {
        if(listTagsUIView.isHidden){
            mainCellContentUIViewHeight.constant = 224
        }else{
            if(tags.count > 4){
                mainCellContentUIViewHeight.constant = 290
            }else{
                mainCellContentUIViewHeight.constant = 250
            }
        }
        addTagUIView.isHidden = false
        addTagUIViewHeight.constant = 160
        mainCollectionView.performBatchUpdates(nil, completion: nil)
    }
    
    @IBAction func didTapAddTagButton(_ sender: Any) {
        addTagUIView.isHidden = true
        addTagUIViewHeight.constant = 0
        mainCellContentUIViewHeight.constant = 65
        addTagsCollectionView()
        if(tags.count < 4){
            mainCellContentUIViewHeight.constant = 95
        }else{
            mainCellContentUIViewHeight.constant = 140
        }
        tagsCollectionView.performBatchUpdates({
            guard let input = tagsInputField.text, !input.isEmpty else {return}
            tags.append(Tags(tag: input))
            let indexPath = IndexPath(item: tags.count - 1, section: 0)
            tagsCollectionView.insertItems(at: [indexPath])
        })
        mainCollectionView.performBatchUpdates(nil, completion: nil)
    }
    
    func addTagsCollectionView(){
        if(tags.count < 4){
            listTagsUiViewHeightConstraints.constant = 30
        }else{
            listTagsUiViewHeightConstraints.constant = 60
        }
        listTagsUIView.isHidden = false
        self.listTagsUIView.addSubview(tagsCollectionView)
        addTagsCollectionViewConstraints(tagsCollectionView: tagsCollectionView)
    }
    
    func addTagsCollectionViewConstraints(tagsCollectionView: UICollectionView){
        tagsCollectionView.leadingAnchor.constraint(equalTo: self.listTagsUIView.leadingAnchor).isActive = true
        tagsCollectionView.trailingAnchor.constraint(equalTo: self.listTagsUIView.trailingAnchor).isActive = true
        tagsCollectionView.topAnchor.constraint(equalTo: self.listTagsUIView.topAnchor).isActive = true
        tagsCollectionView.widthAnchor.constraint(equalTo: self.listTagsUIView.widthAnchor).isActive = true
        tagsCollectionView.heightAnchor.constraint(equalTo: self.listTagsUIView.heightAnchor).isActive = true
    }
    
}
