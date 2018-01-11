//
//  LiveViewController.swift
//  TestSwiftSingleViewApplication
//
//  Created by lin peng on 2018/1/10.
//  Copyright © 2018年 lin peng. All rights reserved.
//

import UIKit

class LiveViewController: UIViewController {
    
    fileprivate let identifier = "LSFunctionCell"
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
            tableView.backgroundColor = UIColor.white
        }
    }
    
    
    let viewModel = LiveStreamingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //加载数据
        loadData()
        
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: identifier)
        tableView.register(UINib.init(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
        NetworkTool.loadLiveData(fromViewController: String(describing: LiveViewController.self)) { (topTitles, homeTopicVCs) in
            //
            for childVc in homeTopicVCs {
                self.addChildViewController(childVc)
            }
            
        }
        
    }
    
    
    
}

extension LiveViewController {
    
    fileprivate func loadData() {
        
    }
}

extension LiveViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! LSFunctionCell
        
        
        return cell
    }
}
