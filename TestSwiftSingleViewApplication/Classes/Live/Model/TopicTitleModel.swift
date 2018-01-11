//
//  TopicTitleModel.swift
//  TestSwiftSingleViewApplication
//
//  Created by lin peng on 2018/1/10.
//  Copyright © 2018年 lin peng. All rights reserved.
//

import UIKit

class TopicTitleModel {
    var category: String?
    
    var tip_new: Int?
    
    var concern_id: String?
    
    var web_url: String?
    
    var icon_url: String?
    
    var flags: Int?
    
    var type: Int?
    
    var name: String?
    
    init(dict: [String: AnyObject]) {
        
        category = dict["category"] as? String
        tip_new = dict["tip_new"] as? Int
        concern_id = dict["concern_id"] as? String
        
        web_url = dict["web_url"] as? String
        icon_url = dict["icon_url"] as? String
        flags = dict["flags"] as? Int
        type = dict["type"] as? Int
        name = dict["name"] as? String
    }
}
