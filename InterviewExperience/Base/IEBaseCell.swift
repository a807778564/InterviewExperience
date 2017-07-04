//
//  IEBaseCell.swift
//  InterviewExperience
//
//  Created by huangrensheng on 2017/7/4.
//  Copyright © 2017年 note. All rights reserved.
//

import UIKit

class IEBaseCell: UITableViewCell {
    
    var bottomLine:UIView!;
    var rightArrow:UIImageView!;
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCellSelectionStyle.none;
        
        self.rightArrow = UIImageView(image:UIImage(named: "ie_icon_right_arrow"));
        self.contentView.addSubview(self.rightArrow);
        self.rightArrow.mas_makeConstraints { (make) in
            make?.trailing.equalTo()(self.contentView.mas_trailing)?.offset()(-16)
            make?.centerY.equalTo()(self.contentView.mas_centerY);
            make?.width.offset()(8);
            make?.height.offset()(13);
        }
        
        self.bottomLine = UIView();
        self.bottomLine.backgroundColor = LineColor;
        self.contentView.addSubview(self.bottomLine);
        self.bottomLine.mas_makeConstraints { (make) in
            make?.height.offset()(1);
            make?.bottom.equalTo()(self.contentView.mas_bottom)
            make?.leading.and().trailing().equalTo()(self.contentView);
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
