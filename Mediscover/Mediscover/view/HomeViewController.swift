//
//  HomeViewController.swift
//  Mediscover
//
//  Created by Rajeev Ranganathan on 15/12/18.
//  Copyright © 2018 Rajeev Ranganathan. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    //MARK: Properties
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var SearchBarView: UISearchBar!
    var medicines:[Medicine] = []
    var pageNum = NetworkClient.ParameterKeys.Page
    var count = NetworkClient.ParameterKeys.Size
    
    //MARK: Methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.delegate = self
        TableView.dataSource = self
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        SearchBarView.delegate = self
        getMedicines()
    }
    
    fileprivate func getMedicines(){
        HomeController.Shared.getMedicines(pageNum: pageNum, count: count){
            (isSuccess,medicineArray,errorString) in
            self.activityIndicator.stopAnimating()
            if (!isSuccess){
                self.displayAlerMessage(message: errorString!)
            }else if let medicineArray = medicineArray {
                self.medicines = medicineArray
                DispatchQueue.main.async {
                    self.TableView.reloadData()
                }
            }
        }
    }
}
