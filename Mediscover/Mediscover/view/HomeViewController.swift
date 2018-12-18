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
    @IBOutlet weak var ActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var SearchBarView: UISearchBar!
    var Medicines:[Medicine] = []
    var PageNum = NetworkClient.ParameterValues.DefaultPage
    var Count = NetworkClient.ParameterValues.DefaultSize
    let PagingSpinner = UIActivityIndicatorView(style: .gray)
    var IsFetchingNextPage = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.delegate = self
        TableView.dataSource = self
        TableView.prefetchDataSource = self
        ActivityIndicator.isHidden = false
        ActivityIndicator.startAnimating()
        SearchBarView.delegate = self
        PagingSpinner.color = UIColor(red: 22.0/255.0, green: 106.0/255.0, blue: 176.0/255.0, alpha: 1.0)
        PagingSpinner.hidesWhenStopped = true
        TableView.tableFooterView = PagingSpinner
        getMedicines()
    }
    
    func getMedicines(){
        HomeController.Shared.getMedicines(pageNum: PageNum, count: Count){
            (isSuccess,medicineArray,errorString) in
            self.IsFetchingNextPage = false
            if (!isSuccess){
                self.displayAlerMessage(message: errorString!)
            }else if let medicineArray = medicineArray {
                self.Medicines.append(contentsOf: medicineArray)
                DispatchQueue.main.async {
                    self.TableView.reloadData()
                }
            }
            DispatchQueue.main.async {
                self.ActivityIndicator.stopAnimating()
                if(self.PagingSpinner.isAnimating){
                    self.PagingSpinner.stopAnimating()
                }
            }
        }
    }
}
