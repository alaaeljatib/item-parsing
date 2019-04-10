//
//  ItemTableViewCell.swift
//  rbcTestApp
//
//  Created by Alaa Eljatib Etmaz Alsebaei on 2019-03-29.
//  Copyright © 2019 Alaa Eljatib Etmaz Alsebaei. All rights reserved.
//

import UIKit

typealias buttonAction = ()->()

class ItemTableViewCell: UITableViewCell {
    
    var buttonAction : buttonAction?
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBAction func playPressed(_ sender: Any) {
        self.buttonAction!()
    }
    
    func configure(with name: String,action: @escaping buttonAction) {
        self.buttonAction = action
        self.nameLabel.text = name
        
        //TODO audio stuff
    }
}
