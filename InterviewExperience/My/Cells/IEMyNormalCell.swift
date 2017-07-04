//
//  IEMyNormalCell.swift
//  InterviewExperience
//
//  Created by huangrensheng on 2017/7/4.
//  Copyright © 2017年 note. All rights reserved.
//

import UIKit

class IEMyNormalCell: IEBaseCell {
    
    var icon:UIImageView!;
    var title:UILabel!;
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        self.icon = UIImageView();
        self.contentView.addSubview(self.icon);
        self.icon.mas_makeConstraints { (make) in
            make?.centerY.equalTo()(self.contentView.mas_centerY);
            make?.leading.equalTo()(self.contentView.mas_leading)?.offset()(16)
            make?.width.offset()(22);
            make?.height.offset()(22);
        }
        
        self.title = UILabel.label(text: "", textColor: LabelMainColor, font: 14);
        self.contentView.addSubview(self.title);
        self.title.mas_makeConstraints { (make) in
            make?.leading.equalTo()(self.icon.mas_trailing)?.offset()(8);
            make?.centerY.equalTo()(self.contentView.mas_centerY)
            make?.trailing.equalTo()(self.rightArrow.mas_leading)?.offset()(-8)
        }
    }
    
    func setTitleAndIcon(icon:String,title:String) -> Void {
        let image = UIImage(named: icon)
        self.icon.mas_updateConstraints { (make) in
            make?.width.offset()((image?.size.width)!);
            make?.height.offset()((image?.size.height)!);
        }
        self.icon.image = image;
        self.title.text = title;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
