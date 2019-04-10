//
//  DataService.swift
//  rbcTestApp
//
//  Created by Alaa Eljatib Etmaz Alsebaei on 2019-03-29.
//  Copyright © 2019 Alaa Eljatib Etmaz Alsebaei. All rights reserved.
//

import Foundation

typealias dataHandler = ([Item]) ->()
class DataService {
    static let instance = DataService()
    
    func provideData(handler: dataHandler) -> () {
        let item1 = Item(name: "Hi", audioUrl: "")
        let item2 = Item(name: "Hello", audioUrl: "")
        let item3 = Item(name: "How are you?", audioUrl: "")
        
        handler([item1, item2, item3])
    }
}
