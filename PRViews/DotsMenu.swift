//
//  DotsMenu.swift
//  Doctor Cloud
//
//  Created by Pedro on 03-01-17.
//  Copyright © 2017 Pedro Rothen. All rights reserved.
//

import UIKit

//private let sharedInstance = DotsMenu(frame: CGRect.zero)

public protocol DotsMenuDelegate {
    func didSelectItem(index: Int)
}

public class DotsMenu: UIView, UITableViewDelegate, UITableViewDataSource {
    let cellIdentifier = "cell"
    
    var tableView: UITableView!
    var backgroundView: UIView!
    var menuView: UIView!
    var initialFrame: CGRect!
    var delegate: DotsMenuDelegate?
    var menuRows:[String]
    var x:CGFloat?
    var y:CGFloat?
    var tapHanlder: (Int -> Void)?
    var width:CGFloat = 150
    
    public init(x: CGFloat?, y: CGFloat?, width: CGFloat? = nil, menuRows: [String], tapHanlder:(Int -> Void)? = nil) {
        self.x = x
        self.y = y
        self.menuRows = menuRows
        self.tapHanlder = tapHanlder
        if let width = width {
            self.width = width
        }
        super.init(frame: CGRect.zero)
        self.setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        let window = UIApplication.sharedApplication().keyWindow!
        
        self.frame = window.frame
        
        let x = self.x ?? window.frame.maxX - (self.width + 20)
        var y = self.y ?? CGFloat(20)
        let width = self.width ?? CGFloat(self.width)
        //let height = window.bounds.height * 0.7
        let height = 44 * CGFloat(self.menuRows.count)
        
        let maxY = y + height
        if maxY > window.frame.maxY {
            y = window.frame.maxY - height
        }
        
        self.initialFrame = CGRectMake(x, y, width, 0)
        let targetFrame = CGRectMake(x, y, width, height)
        self.menuView = UIView(frame: initialFrame)
        self.menuView.backgroundColor = UIColor(red:0.96, green:0.96, blue:0.98, alpha:1.0)
        self.menuView.clipsToBounds = true
        
        self.tableView = UITableView(frame: CGRectMake(0, 0, width, 0), style: .Plain)
        //let nib = UINib(nibName: "EntryViewCell", bundle: nil)
        //self.tableView.registerNib(nib, forCellReuseIdentifier: self.cellIdentifier)
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .None
        //self.tableView.allowsSelection = false
        self.tableView.bounces = false
        
        self.menuView.addSubview(self.tableView)
        
        ViewUtils.addLightShadow(self.menuView)
        
        self.backgroundView = UIView(frame: window.bounds)
        self.backgroundView.backgroundColor = .blackColor()
        self.backgroundView.alpha = 0.0
        
        self.addSubview(self.backgroundView)
        self.addSubview(self.menuView)
        
        window.addSubview(self)
        
        UIView.animateWithDuration(0.3, animations: {
            self.menuView.frame = targetFrame
            self.tableView.frame = CGRectMake(0, 0, width, height)
            self.backgroundView.alpha = 0.2
        })
        
        backgroundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.closeMenu)))
    }
    
    func closeMenu() {
        UIView.animateWithDuration(0.3, animations: {
            self.menuView.frame = self.initialFrame
            self.tableView.frame = CGRectMake(0, 0, self.initialFrame.width, 0)
            self.backgroundView.alpha = 0
            
            }, completion: { _ in
                self.removeFromSuperview()
        })
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier, forIndexPath: indexPath)
        cell.textLabel?.font = UIFont.boldSystemFontOfSize(14)
        cell.textLabel?.textColor = UIColor(red:0.37, green:0.37, blue:0.36, alpha:1.0)
        cell.textLabel?.text = self.menuRows[indexPath.row]
        //cell.selectionStyle = .None
        return cell
    }
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menuRows.count
    }
    
    public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //tableView.deselectRowAtIndexPath(indexPath, animated: false)
        if let handler = self.tapHanlder {
            self.closeMenu()
            handler(indexPath.row)
        } else {
            self.delegate?.didSelectItem(indexPath.row)
            self.closeMenu()
        }
    }
}