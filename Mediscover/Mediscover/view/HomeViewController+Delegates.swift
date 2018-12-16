//
//  HomeViewController+Delegates.swift
//  Mediscover
//
//  Created by Rajeev Ranganathan on 16/12/18.
//  Copyright © 2018 Rajeev Ranganathan. All rights reserved.
//

import Foundation
import UIKit

extension HomeViewController:UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate{
    //MARK: TableView delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return medicines.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let medicineCell = tableView.dequeueReusableCell(withIdentifier: "MedicineCell") as! MedicineTableViewCell
        let medicine = medicines[indexPath.row]
        setImageBasedOnType(cell: medicineCell, type: medicine.Form)
        medicineCell.NameText.text = medicine.Name
        medicineCell.CostText.text = "₹\(medicine.Price)"
        medicineCell.CostText.layer.masksToBounds = true
        medicineCell.CostText.layer.cornerRadius = 5
        medicineCell.ManufacturerText.text = medicine.Manufacturer
        return medicineCell
    }
    
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
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
}
