//
//  NetworkTool.swift
//  TestSwiftSingleViewApplication
//
//  Created by lin peng on 2018/1/10.
//  Copyright © 2018年 lin peng. All rights reserved.
//
import Alamofire
import SwiftyJSON

protocol NetworkToolProtocol {
    
// MARK: - -------------------------- 首 页 Live -------------------------
    static func loadLiveData(fromViewController: String, completionHandler:@escaping (_ topTitles:[TopicTitleModel], _ homeTopicVCs: [TopicViewController]) -> ())
// MARK: - -------------------------- 发现 Discover -------------------------
}

class NetworkTool: NetworkToolProtocol {
    class func loadLiveData(fromViewController: String, completionHandler: @escaping ([TopicTitleModel], [TopicViewController]) -> ()) {
        let url = BASE_URL + "article/category/get_subscribed/v1/?"
        let params = ["device_id" : device_id,
                      "aid" : 13,
                      "iid" : IID] as [String : AnyObject]
        
        Alamofire.request(url, parameters: params).responseJSON { (response) in
            guard response.result.isSuccess else {
                return
            }
            if let value = response.result.value {
                let json = JSON(value)
                let dataDict = json["data"].dictionary
                if let data = dataDict!["data"]!.arrayObject {
                    var titles = [TopicTitleModel]()
                    var homeTopicVCs = [TopicViewController]()
                    // 添加推荐标题
                    let recommendDict = ["category": "", "name": "推荐"]
                    let recommend = TopicTitleModel(dict: recommendDict as [String : AnyObject])
                    titles.append(recommend)
                    // 添加控制器
                    let firstVC = TopicViewController()
                    firstVC.topicTitleModel = recommend
                    homeTopicVCs.append(firstVC)
                    for dict in data {
                        let topicTitle = TopicTitleModel(dict: dict as! [String: AnyObject])
                        titles.append(topicTitle)
                        let homeTopicVC = TopicViewController()
                        homeTopicVC.topicTitleModel = topicTitle
                        homeTopicVCs.append(homeTopicVC)
                    }
                    completionHandler(titles, homeTopicVCs)
                }
            }
        }
        
    }
}
