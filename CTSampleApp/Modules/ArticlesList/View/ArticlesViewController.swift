//
//  ArticlesViewController.swift
//  CTSampleApp
//
//  Created by Lokesh on 12/08/2020.
//  Copyright © 2020 Lokesh Vunnam. All rights reserved.
//

import UIKit

class ArticlesViewController: CTBaseViewController, ArticlesPresenterOutput {

    var presenter : ArticlesPresenterInput!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.tableFooterView = UIView()
    }
    
    //MARK:- ArticlesPresenterOutput
    
    func updateContent() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension ArticlesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.getArticlesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell") as! ArticleCell
        
        if let article = self.presenter.getArticle(indexPath.row) {
            cell.setArticle(article)
        }
        
        return cell
    }
}
