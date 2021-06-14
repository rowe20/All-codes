//
//  genrebuttonscreen.swift
//  musicplayer
//
//  Created by MacBook Pro on 13/05/21.
//

import UIKit
import MediaPlayer

class genrebuttonscreen: UIViewController {
    
    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer

    private let btn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .black
        btn.setTitle("Genre", for: .normal)
        
        btn.addTarget(self, action: #selector(btncon), for: .touchUpInside)
        return btn
    } ()
    
    private let btn1: UIButton = {
        let btn1 = UIButton()
        btn1.backgroundColor = .blue
        btn1.setTitle("hello1", for: .normal)
    
        btn1.addTarget(self, action: #selector(btncon), for: .touchUpInside)
        return btn1
    } ()
    
    private let btn2: UIButton = {
        let btn2 = UIButton()
        btn2.backgroundColor = .green
        btn2.setTitle("hello2", for: .normal)
    
        btn2.addTarget(self, action: #selector(btncon), for: .touchUpInside)
        return btn2
    } ()
    
    private let btnstp: UIButton = {
        let btnstp = UIButton()
        btnstp.backgroundColor = .red
        btnstp.setTitle("Stop", for: .normal)
    
        btnstp.addTarget(self, action: #selector(btnstop), for: .touchUpInside)
        return btnstp
    } ()
    
    private let btnnxt: UIButton = {
        let btnnxt = UIButton()
        btnnxt.backgroundColor = .darkGray
        btnnxt.setTitle("Next", for: .normal)
        
        btnnxt.addTarget(self, action: #selector(btnnext), for: .touchUpInside)
        return btnnxt
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(btn)
        view.addSubview(btn1)
        view.addSubview(btn2)
        view.addSubview(btnstp)
        view.addSubview(btnnxt)

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        btn.frame = CGRect(x: 20, y: 40, width: view.width - 40, height: 40)
        btn1.frame = CGRect(x: 20, y: btn.bottom + 10, width: view.width - 40, height: 40)
        btn2.frame = CGRect(x: 20 , y: btn1.bottom + 10, width: view.width - 40, height: 40)
        btnstp.frame = CGRect(x: 20, y: btn2.bottom + 50, width: 320/2, height: 40)
        
        btnnxt.frame = CGRect(x: view.width/2 + 10, y: btn2.bottom + 50, width: 320/2, height: 40)
        //mylabel.frame = CGRect(x:20, y:40, width: view.width - 40, height: 40)
    }
    
    @objc func btncon() {
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized {
                self.playgenre(genre: "Pop")
            }
            else
            {
            print("nott connected")
            }
        }
        
    }

    @objc func btnstop() {
        musicPlayer.stop()
    }
   
    
    @objc func btnnext() {
        print("nxt")
        musicPlayer.skipToNextItem()
    }
    
    func playgenre(genre : String)
    {
        musicPlayer.stop()
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        query.addFilterPredicate(predicate)
        
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
        
    }

}
