//
//  HomeViewController.swift
//  TestLogin
//
//  Created by Muhammad Reynaldi on 08/11/19.
//  Copyright © 2019 Meh. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var dataArray:[Any?] = []
    var tutor:Tutor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        cellDelegate()
        registerCell()
        // Do any additional setup after loading the view.
    }
    
    func registerCell() {
        tableView.register(UINib(nibName: "ProfileHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileHeaderTableViewCell")
        tableView.register(UINib(nibName: "ProfilePictureTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfilePictureTableViewCell")
        tableView.register(UINib(nibName: "ProfileContentTItleTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileContentTItleTableViewCell")
        tableView.register(UINib(nibName: "ProfileAddressTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileAddressTableViewCell")
        tableView.register(UINib(nibName: "SpecificContentTitleTableViewCell", bundle: nil), forCellReuseIdentifier: "SpecificContentTitleTableViewCell")
        tableView.register(UINib(nibName: "ContentTableViewCell", bundle: nil), forCellReuseIdentifier: "ContentTableViewCell")
        tableView.register(UINib(nibName: "AchievementTableViewCell", bundle: nil), forCellReuseIdentifier: "AchievementTableViewCell")
    }
    
    func setupData() {
        dataArray.removeAll()
        dataArray.append("Profile")
        dataArray.append(tutor)
        dataArray.append(("Address",0))
        dataArray.append(false)
        dataArray.append(("Skill",1))
        dataArray.append(true)
        dataArray.append(("Language",1))
        dataArray.append(true)
        dataArray.append(("Education",1))
        dataArray.append(true)
        dataArray.append(("Experience",1))
        dataArray.append(true)
        dataArray.append(("Achievement",1))
        dataArray.append(0)
        tableView.reloadData()
    }
    
 
}
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func cellDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let string = dataArray[indexPath.row] as? String{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileHeaderTableViewCell", for: indexPath) as! ProfileHeaderTableViewCell
            cell.setCell(text: string)
            return cell
        }else if let tutor = dataArray[indexPath.row] as? Tutor?{
            if let value = tutor{
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProfilePictureTableViewCell", for: indexPath) as! ProfilePictureTableViewCell
                cell.setProfile(tutor: value)
                return cell
            }
        }else if let keyValue = dataArray[indexPath.row] as? (key:String, value:Int){
            if keyValue.value == 0{
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileContentTItleTableViewCell", for: indexPath) as! ProfileContentTItleTableViewCell
                cell.setLabel(contentTitle: keyValue.key)
                return cell
            }else if keyValue.value == 1{
                let cell = tableView.dequeueReusableCell(withIdentifier: "SpecificContentTitleTableViewCell", for: indexPath) as! SpecificContentTitleTableViewCell
                cell.setText(text: keyValue.key)
                return cell
            }
        }else if let value = dataArray[indexPath.row] as? Bool{
            if value == false{
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileAddressTableViewCell", for: indexPath) as! ProfileAddressTableViewCell
                return cell
            }else if value == true{
                let cell = tableView.dequeueReusableCell(withIdentifier: "ContentTableViewCell", for: indexPath) as! ContentTableViewCell
                return cell
            }
        }else if let _ = dataArray[indexPath.row] as? Int{
            let cell = tableView.dequeueReusableCell(withIdentifier: "AchievementTableViewCell", for: indexPath) as! AchievementTableViewCell
            return cell
        }
        return UITableViewCell()
    }

}
