//
//  Contact.swift
//  sample_videocalling
//
//  Created by Antony on 3/8/18.
//  Copyright © 2018 Antony. All rights reserved.
//

import Foundation
class Contact {
    private var _id = ""
    private var _idfinal = ""

    private var _name = ""
    
    init(name:String,id:String,idfinal:String)
    {
       _id = id
        _name = name
        _idfinal = idfinal

    }
    
    var name : String {
        get{
            return _name;
        }
    }
    var id : String {
        get{
            return _id;
        }
    }
    var idfinal : String {
        get{
            return _idfinal;
        }
    }
    
    
}
