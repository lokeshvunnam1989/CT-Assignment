//
//  HomeViewController.swift
//  CTSampleApp
//
//  Created by Lokesh on 12/08/2020.
//  Copyright © 2020 Lokesh Vunnam. All rights reserved.
//

import UIKit

class HomeViewController: CTBaseViewController, HomePresenterOutput {

    var presenter : HomePresenterInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }

    @IBAction func showArticlesButtonPressed(_ sender: Any) {
        DispatchQueue.global(qos: .background).async {
            self.presenter.fetchArticles()
            DispatchQueue.main.async {
                self.presenter.showArticlesView()
            }
        }
    }
    
}
