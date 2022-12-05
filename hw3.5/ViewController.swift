//
//  ViewController.swift
//  hw3.5
//
//  Created by Айбек Шакиров on 5/12/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
        
        title = "Ваши заказы Glovo"
        
        
    }


}

extension ViewController:UITableViewDataSource{
    
    //количество ячеек в таблице
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderArray.count
    }
    
    //настройка ячейки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "cell_id", for: indexPath) as! cellInTV
        cell.nameLabel.text = orderArray[indexPath.row].name
        cell.descriptionLabel.text = orderArray[indexPath.row].description
        cell.costLabel.text = orderArray[indexPath.row].cost
       
        cell.imgView.image = UIImage(named: orderArray[indexPath.row].image)
        cell.repeatButton.setTitle("Заказать", for: .normal)
        
        
        return cell
    }
    
    
}

//Размер каждой ячейки в таблице
extension ViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
