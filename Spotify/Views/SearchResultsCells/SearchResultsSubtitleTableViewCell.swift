//
//  SearchResultDefaultTableViewCell.swift
//  Spotify
//
//  Created by Bryan Guerra on 6/24/21.
//

import UIKit
import SDWebImage



class SearchResultsSubtitleTableViewCell: UITableViewCell {
    static let identifier = "SearchResultsSubtitleTableViewCell"
   
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    private let subTitlelabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.numberOfLines = 1
        return label
    }()
    
    private let iconImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(iconImageView)
        contentView.addSubview(subTitlelabel)
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let imageSize = contentView.height-10
        
        iconImageView.frame = CGRect(x: 10, y: 5, width:imageSize, height: imageSize)
//        iconImageView.layer.cornerRadius = imageSize/2
//        iconImageView.layer.masksToBounds = true
        
        let labelHeight = contentView.height/2
        label.frame = CGRect(
            x: iconImageView.right + 10,
            y: 0,
            width: contentView.width-iconImageView.right - 15,
            height: labelHeight
        )
        
        subTitlelabel.frame = CGRect(
            x: iconImageView.right + 10,
            y: labelHeight,
            width: contentView.width-iconImageView.right - 15,
            height: labelHeight
        )
        
        
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
        subTitlelabel.text = nil
    }
    
    func configure(with viewModel: SearchResultsSubtitleTableViewCellViewModel){
        label.text = viewModel.title
        subTitlelabel.text = viewModel.subtitle
        iconImageView.sd_setImage(with: viewModel.imageURL, completed: nil)
    }
    
    
}
