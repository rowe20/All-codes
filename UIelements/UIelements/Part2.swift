//
//  Part2.swift
//  UIelements
//
//  Created by MacBook Pro on 09/06/21.
//

import UIKit

class Part2: UIViewController {
    
    private let trial : UIButton = {
        let trial = UIButton()
        trial.setTitle("Click for action", for: .normal)
        trial.backgroundColor = .black
        trial.addTarget(self, action: #selector(spin), for: .touchUpInside)
        return trial
    } ()

    @objc func spin() {
        //main thread
        DispatchQueue.main.async {
            self.activityIndicator.isHidden = !self.activityIndicator.isHidden //here "!" mark is used for negation
            self.activityIndicator.isHidden ? self.activityIndicator.stopAnimating() : self.activityIndicator.startAnimating()
        }
        //Background thread
        /*activityIndicator.isHidden = !activityIndicator.isHidden
        activityIndicator.isHidden ? activityIndicator.stopAnimating() : activityIndicator.startAnimating()*/
        // condition ? true-part : falseport
    }
    
    private let activityIndicator : UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.style = .large
        activity.color = .blue
        return activity
    } ()
    
    
    private let imageview : UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill // if using fills we have to use "clipstobounds"
        imageview.clipsToBounds = true
        imageview.image = UIImage(named: "1")
        return imageview
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Part 2"
        self.view.backgroundColor = .white
        view.addSubview(trial)
        view.addSubview(activityIndicator)
        view.addSubview(imageview)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        trial.frame = CGRect(x: 20, y: 80, width: view.width - 40, height: 40)
        activityIndicator.frame = CGRect(x: 20, y: trial.bottom + 20, width: view.width - 40, height: 40)
        imageview.frame = CGRect(x: 20, y: activityIndicator.bottom + 20, width: view.width - 40, height: 80)
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
