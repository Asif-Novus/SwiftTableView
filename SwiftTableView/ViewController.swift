//
//  ViewController.swift
//  SwiftTableView
//
//  Created by UsFromMini on 5/31/16.
//  Copyright © 2016 Jamil. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{

    var tableView: UITableView  =   UITableView()
    let animals : [String] = ["Dogs","Cats","Mice"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenSize:CGRect = UIScreen.mainScreen().bounds
        
        //tableView = UITableView(frame: CGRectMake(0, 0, screenSize.width, screenSize.height), style: UITableViewStyle.Plain)
        tableView.frame = CGRectMake(0, 50, screenSize.width, screenSize.height-50)
        tableView.delegate      =   self
        tableView.dataSource    =   self
        //tableView.registerClass(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.registerClass(CustomTableViewCell.classForCoder(), forCellReuseIdentifier: "cell")

        self.view.addSubview(self.tableView)
        
        
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return animals.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {

        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomTableViewCell

        cell.labName.text = animals [indexPath.row]
        
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        print(animals[indexPath.row])
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



class CustomTableViewCell: UITableViewCell {
    
    var labName = UILabel();
    
   
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.labName = UILabel(frame: CGRectMake(10, 10, 216, 31))
        labName.backgroundColor = UIColor.grayColor()
        
        
        self.addSubview(self.labName)
    }
    
    required init(coder aDecoder: NSCoder)
    {
        //Just Call Super
        super.init(coder: aDecoder)
    }
}
