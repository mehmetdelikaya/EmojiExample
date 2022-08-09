//
//  ViewController.swift
//  EmojiExample
//
//  Created by Mehmet Delikaya on 8.08.2022.
//

import UIKit
import Streamoji

class ViewController: UIViewController {

    @IBOutlet weak var tblList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareList()
    }

    func prepareList(){
        self.tblList.dataSource = self
        self.tblList.delegate = self
        self.tblList.separatorStyle = .none
        self.tblList.register(UINib.init(nibName: "EmojiCellView", bundle: nil),  forCellReuseIdentifier: "EmojiCellViewIdentifier")
        self.tblList.contentInsetAdjustmentBehavior = .never
    }

}

//MARK: - TableView Events
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 86.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 54
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tblList.dequeueReusableCell(withIdentifier: "EmojiCellViewIdentifier",for: indexPath) as! EmojiCellView
        
        
        cell.setCell(text : "\(indexPath.row) Remote file :let_me_in:")
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
        print("LIST POSITION ", indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}

let exampleEmojis: [String: EmojiSource] = [
    // from assets [animated GIF]
    "baby_yoda": .imageAsset("baby-yoda-soup.gif"),
    "banana_dance": .imageAsset("bananadance.gif"),
    "excuse_me": .imageAsset("excuseme.gif"),
    "party_parrot": .imageAsset("party_parrot.gif"),
    "this_is_fine": .imageAsset("this-is-fine-fire.gif"),
    "homer_disappear": .imageAsset("homer-disappear.gif"),
    "carlton": .imageAsset("carlton.gif"),
    
    // from assets [still image (jpg, png, etc)]
    "what": .imageAsset("what.png"),
    
    // from remote url
    "let_me_in": .imageUrl("https://github.com/GetStream/Streamoji/blob/main/meta/emojis/let_me_in.gif?raw=true"),
    
    // from unicode
    "smiley": .character("😄"),
    "heart": .character("❤️"),
    
    // aliases
    "banana": .alias("banana_dance"),
    "parrot": .alias("party_parrot")
]
