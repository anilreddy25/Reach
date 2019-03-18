//
//  DBProvider.swift
//  sample_videocalling
//
//  Created by Antony on 3/8/18.
//  Copyright © 2018 Antony. All rights reserved.
//

import Foundation


protocol fetchData: class {
    func dataReceived(contacts:[Contact]);
}
class DBProvider {
    private static let _instace = DBProvider()
    private init(){}
    weak var delegate:fetchData?
    static var Instace:DBProvider {
        return _instace
    }


}

