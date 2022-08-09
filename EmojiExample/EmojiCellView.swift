//
//  EmojiCellView.swift
//  EmojiExample
//
//  Created by Mehmet Delikaya on 8.08.2022.
//

import UIKit
import Streamoji

class EmojiCellView: UITableViewCell {

    @IBOutlet weak var textView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        textView.attributedText = nil
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(text : String){
        textView.attributedText = NSAttributedString(string: text)
        textView.textAlignment = .left
        textView.font = .systemFont(ofSize: 22)
        textView.configureEmojisWithDelay(exampleEmojis, rendering: .lowQuality, delay: 0.5)
        //textView.configureEmojis(exampleEmojis, rendering: .lowQuality)
    }
    
}
