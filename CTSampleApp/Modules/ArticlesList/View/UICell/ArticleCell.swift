//
//  ArticleCell.swift
//  CTSampleApp
//
//  Created by Lokesh on 12/08/2020.
//  Copyright © 2020 Lokesh Vunnam. All rights reserved.
//

import UIKit
import AlamofireImage

class ArticleCell: UITableViewCell {

    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var savedImageView: UIImageView!
    @IBOutlet weak var likedImageView: UIImageView!
    @IBOutlet weak var authorImageView: UIImageView!
    @IBOutlet weak var likesCount: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var updateDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setArticle(_ article: Article) {
        self.category.text = article.category
        self.title.text = article.title
        self.authorName.text = article.author.authorName
        self.likesCount.text = "\(article.likesCount)"
        
        self.savedImageView.image = article.isSaved ? #imageLiteral(resourceName: "saved") : #imageLiteral(resourceName: "save")
        self.likedImageView.image = article.isLiked ? #imageLiteral(resourceName: "liked") : #imageLiteral(resourceName: "like")

        let placeholderImage = UIImage(named: "placeholder")!
        self.articleImageView.af.setImage(withURL: URL(string: article.imageUrl)!, placeholderImage: placeholderImage)
        self.authorImageView.af.setImage(withURL: URL(string: article.author.authorAvatar.imageUrl)!, placeholderImage: placeholderImage)
        
        self.updateDate.text = dateFormatter.clServerDate(string: article.metaData.updateTime)
    }

}
