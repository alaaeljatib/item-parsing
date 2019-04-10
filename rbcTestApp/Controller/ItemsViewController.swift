//
//  ViewController.swift
//  rbcTestApp
//
//  Created by Alaa Eljatib Etmaz Alsebaei on 2019-03-29.
//  Copyright © 2019 Alaa Eljatib Etmaz Alsebaei. All rights reserved.
//

import UIKit

class ItemsViewController: UIViewController {
    
    var items : [Item]?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup(self.tableView)
        
        DataService.instance.provideData { (items) in
            self.items = items
            
            DispatchQueue.main.async { [weak self] in
                guard let _ = self else {return}
                
                self?.tableView.reloadData()
            }
        }
        
    }
    
    func setup(_ tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: itemNibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: itemCellIdentifier)
    }
    
}

extension ItemsViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: itemCellIdentifier) as? ItemTableViewCell else
        { return UITableViewCell()
        }
        let item = self.items![indexPath.row]
        cell.configure(with: item.name) { [weak cell] in
            DispatchQueue.main.async {
                print("action triggered from desktop")
                cell?.textLabel?.text = " clicked!"
            }
        }
        
        return cell
    }
}

