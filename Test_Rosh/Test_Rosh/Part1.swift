//
//  Part1.swift
//  Test_Rosh
//
//  Created by MacBook Pro on 12/06/21.
//

import UIKit

class Part1: UIViewController {
   // var str = ""
    private let eveodd : UITextField = {
        let eveodd = UITextField()
        eveodd.placeholder = "Enter Even or Odd No"
        eveodd.backgroundColor = .brown
        return eveodd
    } ()
    
    private let btn_sample : UIButton = {
        let btn_sample = UIButton()
        btn_sample.setTitle("Check", for: .normal)
        btn_sample.backgroundColor = .brown
        
        btn_sample.addTarget(self, action: #selector(validation), for: .touchUpInside)
        return btn_sample
    } ()
    
    @objc func validation(){
        let str = eveodd.text!
        var res = ""
        if(Int(str) != nil)
        {
            if(Int(str)! % 2 == 0){
                res = "Even Number"
            }
            else
            {
                res = "Odd number"
            }
            let vc = result()
            vc.eveodd = res
            navigationController?.pushViewController(vc, animated: true)
        }
        else{
            print(str)
            let alert = UIAlertController(title: "Please enter a number", message: "You Have written a string", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            

            self.present(alert, animated: true)
        }
        
    }
    /*func isStringAnInt(string: String) -> Bool {
        return Int(string) != nil
    }*/
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(btn_sample)
        view.addSubview(eveodd)
        self.view.backgroundColor = .black
        title = "Even or Odd number"

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        eveodd.frame = CGRect(x: 20, y: 250, width: view.width - 40, height: 40)
        btn_sample.frame = CGRect(x: 20, y: eveodd.bottom + 20, width: view.width - 40, height: 40)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
