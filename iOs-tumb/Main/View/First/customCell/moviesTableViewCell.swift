//
//  moviesTableViewCell.swift
//  iOs-tumb
//
//  Created by Flavio Gomez on 16/09/2021.
//

import UIKit

class moviesTableViewCell: UITableViewCell {

    @IBOutlet weak var nameMovie: UILabel!
    
    private var url: String = ""
        

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
