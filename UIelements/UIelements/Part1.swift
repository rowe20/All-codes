//
//  ViewController.swift
//  UIelements
//
//  Created by MacBook Pro on 04/05/21.
//

import UIKit
import SQLite

class Part1: UIViewController {

    var database : Connection!
    /*table and its columns */
    let usersTable = Table("axy")
    let id = Expression<Int>("id")
    let name = Expression<String>("name")
    let email = Expression<String>("email")
    /*----------*/
    
   /* private let mylabel: UILabel = {
        let label = UILabel()
        label.text="Hi there"
        label.textAlignment = .center
        label.backgroundColor = .systemFill
        return label
        
    }()
    
    private let mytext: UITextField = {
        let text = UITextField()
        text.borderStyle = .roundedRect
        text.backgroundColor = .systemFill
        text.placeholder = "Enter Your Name"
        return text
        
    } ()
    
    private let mytxtview : UITextView = {
        let txtview = UITextView()
        txtview.text = "hello there"
        txtview.backgroundColor = .systemFill
        txtview.textAlignment = .center
        return txtview
    } ()*/
    
    private let btn : UIButton = {
        let btn = UIButton()
        btn.setTitle("create table", for: .normal)
        btn.backgroundColor = .systemRed
        btn.addTarget(self, action: #selector(btncon), for: .touchUpInside)
        return btn
    } ()
    
    private let ins_btn : UIButton = {
        let ins_btn = UIButton()
        ins_btn.setTitle("insert user", for: .normal)
        ins_btn.backgroundColor = .systemRed
        ins_btn.addTarget(self, action: #selector(insertuser), for: .touchUpInside)
        return ins_btn
    } ()
    
    private let lst_btn : UIButton = {
        let lst_btn = UIButton()
        lst_btn.setTitle("list user", for: .normal)
        lst_btn.backgroundColor = .black
        lst_btn.addTarget(self, action: #selector(listuser), for: .touchUpInside)
        return lst_btn
    } ()
    
    private let up_btn : UIButton = {
        let up_btn = UIButton()
        up_btn.setTitle("update user", for: .normal)
        up_btn.backgroundColor = .black
        up_btn.addTarget(self, action: #selector(updateuser), for: .touchUpInside)
        return up_btn
    } ()
    
    private let del_btn : UIButton = {
        let del_btn = UIButton()
        del_btn.setTitle("delete user", for: .normal)
        del_btn.backgroundColor = .black
        del_btn.addTarget(self, action: #selector(deleteuser), for: .touchUpInside)
        return del_btn
    } ()
    
    private let part2_btn : UIButton = {
        let part2_btn = UIButton()
        part2_btn.setTitle("Part 2", for: .normal)
        part2_btn.backgroundColor = .black
        part2_btn.addTarget(self, action: #selector(part2), for: .touchUpInside)
        return part2_btn
    } ()
    /*UI elements 2*/
    /*private let datep :UIDatePicker = {
        let datep = UIDatePicker()
        datep.datePickerMode = .dateAndTime
        datep.timeZone = TimeZone(secondsFromGMT: 0)
        datep.addTarget(self, action: #selector(handledata), for: .valueChanged)
        return datep
    }()
    
    private let pgcontrol : UIPageControl = {
        let pgcontrol = UIPageControl()
        pgcontrol.numberOfPages = 3
        pgcontrol.backgroundStyle = .prominent
        pgcontrol.addTarget(self, action: #selector(pgcall), for: .valueChanged)
        return pgcontrol
    } ()
    private let segment:UISegmentedControl = {
        let segment = UISegmentedControl()
        segment.insertSegment(withTitle: "Hi there", at: 0, animated: true)
        segment.insertSegment(withTitle: "second one", at: 1, animated: true)
        return segment
    }()
    
    private let slider : UISlider = {
        let slider = UISlider()
        slider.maximumValue = 10
        slider.minimumValue = 0
        slider.addTarget(self, action: #selector(slidercall), for: .valueChanged)
        return slider
    }()
    
    private let switche : UISwitch = {
        let switche = UISwitch()
        return switche
    }() */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*view.addSubview(mylabel)
        view.addSubview(mytext)
        view.addSubview(mytxtview)*/
        view.addSubview(btn)
        view.addSubview(ins_btn)
        view.addSubview(lst_btn)
        view.addSubview(up_btn)
        view.addSubview(del_btn)
        view.addSubview(part2_btn)
        /*view.addSubview(datep)
        view.addSubview(pgcontrol)
        view.addSubview(segment)
        view.addSubview(slider)
        view.addSubview(switche)*/
        // Do any additional setup after loading the view.
        
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileURL = documentDirectory.appendingPathComponent("users").appendingPathExtension("sqlite3")
            
            let database = try Connection(fileURL.path)
            self.database = database
            
        } catch {
            print("error")
        }
        
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        /*mylabel.frame = CGRect(x:20, y:40, width: view.width - 40, height: 40)
        mytext.frame = CGRect(x:20, y:mylabel.bottom + 20, width: view.width - 40, height: 40)
        mytxtview.frame = CGRect(x:20, y:mytext.bottom + 20, width: view.width - 40, height: 40)*/
        btn.frame = CGRect(x:20, y:80/*mytxtview.bottom + 20*/, width: view.width - 40, height: 40)
        ins_btn.frame = CGRect(x:20, y:btn.bottom + 20, width: view.width - 40, height: 40)
        lst_btn.frame = CGRect(x:20, y:ins_btn.bottom + 20, width: view.width - 40, height: 40)
        up_btn.frame = CGRect(x:20, y:lst_btn.bottom + 20, width: view.width - 40, height: 40)
        del_btn.frame = CGRect(x:20, y:up_btn.bottom + 20, width: view.width - 40, height: 40)
        part2_btn.frame = CGRect(x:20, y:del_btn.bottom + 20, width: view.width - 40, height: 40)
        /*datep.frame = CGRect(x:20, y:btn.bottom + 20, width: view.width - 40, height: 40)
        pgcontrol.frame = CGRect(x:20, y:datep.bottom + 20, width: view.width - 40, height: 40)
        segment.frame = CGRect(x:20, y:pgcontrol.bottom + 20, width: view.width - 40, height: 40)
        slider.frame = CGRect(x:20, y:segment.bottom + 20, width: view.width - 40, height: 40)
        switche.frame = CGRect(x:20, y:slider.bottom + 20, width: view.width - 40, height: 40)*/
        
    }
    @objc func part2() {
        let vc = Part2()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func btncon() {
        print("create table")
        
        let createTable = self.usersTable.create { (table) in
            table.column(self.id, primaryKey: true)
            table.column(self.name)
            table.column(self.email, unique: true)
        }
        
        do {
            try self.database.run(createTable)
            print("created table")
        } catch {
            print("error table")
        }
        //mytext.placeholder = "Great"
    }
    
    @objc func insertuser()
    {
        print("insert tapped")
        let alert = UIAlertController(title: "Insert User", message: nil, preferredStyle: .alert)
        alert.addTextField { (tf) in tf.placeholder = "name"}
        alert.addTextField { (tf) in tf.placeholder = "email"}
        let action = UIAlertAction(title: "submit", style: .default) { (_) in
            guard let name = alert.textFields?.first?.text,
                  let email = alert.textFields?.last?.text
            else { return }
            print(name)
            print(email)
            
            let insertUser = self.usersTable.insert(self.name <- name , self.email <- email)
            
            do{
                try self.database.run(insertUser)
                print("inserted user")
                
            } catch {
                print("error")
            }
            
        }
        alert.addAction(action)
        present(alert , animated: true , completion: nil)
    }
    
    @objc func listuser()
    {
        print("list tapped")
        
        do {
            let users = try self.database.prepare(self.usersTable)
            for user in users {
                print("userId: \(user[self.id]) , name: \(user[self.name]), email: \(user[self.email]) ")
            }
            
        } catch {
            print ("error")
        }
        
    }
    
    
    @objc func updateuser()
    {
        print("insert tapped")
        let alert = UIAlertController(title: "Insert User", message: nil, preferredStyle: .alert)
        alert.addTextField { (tf) in tf.placeholder = "User id"}
        alert.addTextField { (tf) in tf.placeholder = "email"}
        let action = UIAlertAction(title: "submit", style: .default) { (_) in
            guard let useridstring = alert.textFields?.first?.text,
                  let userId = Int(useridstring),
                  let email = alert.textFields?.last?.text
            else { return }
            print(userId)
            print(email)
            
            let user = self.usersTable.filter(self.id == userId)
            
            let updateUser = user.update(self.email <- email)
            
            do{
                try self.database.run(updateUser)
                print("updated user")
                
            } catch {
                print("error")
            }
            
        }
        alert.addAction(action)
        present(alert , animated: true , completion: nil)
    }
    
    @objc func deleteuser()
    {
        print("delete tapped")
        let alert = UIAlertController(title: "delete User", message: nil, preferredStyle: .alert)
        alert.addTextField { (tf) in tf.placeholder = "User id"}
        
        let action = UIAlertAction(title: "submit", style: .default) { (_) in
            guard let useridstring = alert.textFields?.first?.text,
                  let userId = Int(useridstring)
                  
            else { return }
            print(userId)
            
            
            let user = self.usersTable.filter(self.id == userId)
            let deleteUser = user.delete()
            do {
                try self.database.run(deleteUser)
            } catch {
                print(error)
            }
        }
        alert.addAction(action)
        present(alert , animated: true , completion: nil)
    }
    
    @objc func handledata()
    {
        print("date clicked")
       // mytext.placeholder = "Date"
    }
    @objc func pgcall()
    {
        print("function called")
    }
    
    @objc func slidercall(){
        //print(slider.value)
    }
}

