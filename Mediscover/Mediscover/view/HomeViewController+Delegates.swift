//
//  HomeViewController+Delegates.swift
//  Mediscover
//
//  Created by Rajeev Ranganathan on 16/12/18.
//  Copyright © 2018 Rajeev Ranganathan. All rights reserved.
//

import Foundation
import UIKit

extension HomeViewController:UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UITableViewDataSourcePrefetching{
    
    //MARK: TableView delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Medicines.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let medicineCell = tableView.dequeueReusableCell(withIdentifier: "MedicineCell") as! MedicineTableViewCell
        let medicine = Medicines[indexPath.row]
        setImageBasedOnType(cell: medicineCell, type: medicine.Form)
        medicineCell.NameText.text = medicine.Name
        medicineCell.CostText.text = "₹\(medicine.Price)"
        medicineCell.CostText.layer.masksToBounds = true
        medicineCell.CostText.layer.cornerRadius = 5
        medicineCell.ManufacturerText.text = medicine.Manufacturer
        return medicineCell
    }
    
    
    //TODO: Refractor this to get UIImage from type in another function & just the image here
    fileprivate func setImageBasedOnType(cell:MedicineTableViewCell ,type:String){
        if(type == Constants.MedicineType.Tablet.rawValue || type == Constants.MedicineType.Capsule.rawValue
            || type == Constants.MedicineType.TabletMD.rawValue){
            cell.imageView?.image = UIImage(imageLiteralResourceName: "ic_tablets")
        }else if (type == Constants.MedicineType.Cream.rawValue || type == Constants.MedicineType.Gel.rawValue || type == Constants.MedicineType.Lotion.rawValue ||
            type == Constants.MedicineType.ointment.rawValue){
            cell.imageView?.image = UIImage(imageLiteralResourceName: "ic_lotion")
        }else if (type == Constants.MedicineType.Infusion.rawValue){
            cell.imageView?.image = UIImage(imageLiteralResourceName: "ic_infusion")
        }else if (type == Constants.MedicineType.EyeDrop.rawValue || type == Constants.MedicineType.NasalDrop.rawValue){
            cell.imageView?.image = UIImage(imageLiteralResourceName: "ic_drop")
        }else if (type == Constants.MedicineType.Injection.rawValue){
            cell.imageView?.image = UIImage(imageLiteralResourceName: "ic_injection")
        }else{
            cell.imageView?.image = UIImage(imageLiteralResourceName: "ic_general_50")
        }
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row  == Medicines.count - 1{
            fetchNextPage()
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        PagingSpinner.isHidden = false
        PagingSpinner.startAnimating()
    }
    
    func tableView(_ tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
        PagingSpinner.stopAnimating()

    }
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
//        print("Index:\(indexPaths[0].row)")
//        let needsFetch = indexPaths.contains{
//            $0.row+2 >= Medicines.count
//        }
//
//        if needsFetch {
//            fetchNextPage()
//        }
    }

    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        
    }

    
    fileprivate func fetchNextPage(){
        PageNum = "\((PageNum as NSString).integerValue + 1)"
        guard !IsFetchingNextPage else {
            return
        }
        IsFetchingNextPage = true
        ActivityIndicator.isHidden = false
        getMedicines()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
}
