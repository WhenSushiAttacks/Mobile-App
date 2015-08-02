//
//  Note.swift
//  Loci
//
//  Created by Jonathan Kingsley on 01/08/2015.
//  Copyright (c) 2015 WhenSushiAttacks. All rights reserved.
//

import UIKit

class Note: NSObject {
    
    var title: NSString
    var type: NSString
    var subtitle: NSString
    var loc: NSString
    var id: Int32
    
    init(fromString title: NSString, type: NSString, subtitle: NSString, id: Int32) {
        self.title = title
        self.type = type
        self.subtitle = subtitle
        self.id = id
        self.loc = "  "
    }
   
}
