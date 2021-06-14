//
//  result.swift
//  Test_Rosh
//
//  Created by MacBook Pro on 12/06/21.
//

import UIKit

class result: UIViewController {
    
    
    var eveodd = ""
    private let result : UILabel = {
        let result = UILabel()
        result.text = ""
        result.backgroundColor = .brown
        result.textAlignment = .center
        return result
    } ()
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(result)
        self.view.backgroundColor = .black
        title = "Result Of EVEN & ODD"
        
        result.text = eveodd

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        result.frame = CGRect(x: 20, y: 80, width: view.width - 40, height: 40)
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
