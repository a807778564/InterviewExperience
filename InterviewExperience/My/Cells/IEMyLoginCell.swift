//
//  IEMyLoginCell.swift
//  InterviewExperience
//
//  Created by huangrensheng on 2017/6/22.
//  Copyright © 2017年 note. All rights reserved.
//

import UIKit

class IEMyLoginCell: UITableViewCell {
    var userInfo:IEUserModel?{
        didSet{
            self.titleLabel.text = userInfo?.userName;
            self.desLabel.text = userInfo?.phoneNumber;
        }
    }
    
    var icon = UIImageView(image: UIImage(named: "ie_icon_my_default"));
    var rightArrow = UIImageView(image: UIImage(named: "ie_icon_right_arrow"));
    var titleLabel = UILabel.label(text: "登录/注册", textColor: LabelMainColor, font: 15);
    var desLabel = UILabel.label(text: "登陆后查看更多信息>>", textColor: LabelDesColor, font: 12);
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        self.selectionStyle = UITableViewCellSelectionStyle.none;
        
        self.contentView.addSubview(self.icon);
        self.contentView.addSubview(self.rightArrow);
        self.contentView.addSubview(self.titleLabel);
        self.contentView.addSubview(self.desLabel);
        
        self.icon.mas_makeConstraints { (make) in
            make?.centerY.equalTo()(self.contentView.mas_centerY);
            make?.leading.equalTo()(self.contentView.mas_leading)?.offset()(16);
            make?.width.offset()(44);
            make?.height.offset()(44);
        }
        
        self.rightArrow.mas_makeConstraints { (make) in
            make?.centerY.equalTo()(self.contentView.mas_centerY);
            make?.trailing.equalTo()(self.contentView.mas_trailing)?.offset()(-16);
            make?.width.offset()(10);
            make?.height.offset()(14);
        }
        
        self.titleLabel.mas_makeConstraints { (make) in
            make?.leading.equalTo()(self.icon.mas_trailing)?.offset()(10);
            make?.top.equalTo()(self.icon.mas_top);
            make?.trailing.equalTo()(self.rightArrow.mas_leading)?.offset()(-10)
        }
        
        self.desLabel.mas_makeConstraints { (make) in
            make?.leading.equalTo()(self.icon.mas_trailing)?.offset()(10);
            make?.bottom.equalTo()(self.icon.mas_bottom);
            make?.trailing.equalTo()(self.rightArrow.mas_leading)?.offset()(-10)
        }
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
