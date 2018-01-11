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
    
    
    let viewModel = LiveStreamingViewModel()
    

    fileprivate  lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.blue
        return tableView
    }()
}
//MARK: - 生命周期方法
extension LiveViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        //MARK: - 添加子控件
        view.addSubview(tableView)
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        tableView.frame = view.bounds
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
