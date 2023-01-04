//
//  Cell.swift
//  SnapKit MVVM RickAndMorty
//
//  Created by Kaan Yalçınkaya on 5.09.2022.
//

import UIKit
import AlamofireImage

class RickandMortyTableViewCell: UITableViewCell {
    
    private let randomImage: String = "https://picsum.photos/200/300"
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var title: UILabel = {
        let title = UILabel()
        title.text = ""
        title.font = UIFont.systemFont(ofSize: 18)
        title.textColor = .black
        return title
    }()
    
    private lazy var customDescription: UILabel = {
        let customDescription = UILabel()
        customDescription.text = ""
        customDescription.font = UIFont.italicSystemFont(ofSize: 10)
        customDescription.textColor = .black
        return customDescription
    }()
    
    private lazy var customImage: UIImageView = {
        let customImage = UIImageView()
        customImage.image = UIImage(named: "")
        customImage.contentMode = UIView.ContentMode.scaleToFill
        customImage.snp.makeConstraints { make in
        make.height.equalTo(150)
        }
        
        return customImage
    }()
    
    lazy var stackViews: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [customImage,
                                                      title,
                                                      customDescription])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 20
        return stackView
    }()
    
enum Identifier: String {
    case custom = "KY"
}

override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    configure()
    setUpContainerView()
    setUpStackViews()
}

required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}


//MARK: - addSubView

private func configure() {
    addSubview(containerView)
    containerView.addSubview(stackViews)
}

func saveModel(model: Result) {
    title.text = model.name
    customDescription.text = model.status
    customImage.af.setImage(withURL: URL(string: model.image ?? randomImage) ?? URL(string: randomImage)!)
}

}

//MARK: - Const Func
extension RickandMortyTableViewCell {
    
    fileprivate func setUpContainerView() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
//    fileprivate func setUpCustomImage() {
//        customImage.snp.makeConstraints { make in
//            make.height.equalTo(100)
//            make.left.right.equalToSuperview()
//            make.top.equalTo(containerView)
//        }
//    }
//
//    fileprivate func setUpTitle() {
//        title.snp.makeConstraints { make in
//            make.top.equalTo(customImage.snp.top).offset(10)
//            make.right.left.equalTo(containerView)
//
//        }
//    }
//
//    fileprivate func setUpcustomDescription() {
//        customDescription.snp.makeConstraints { make in
//            make.top.equalTo(title).offset(5)
//            make.right.left.equalTo(title)
//            make.bottom.equalToSuperview()
//        }
//    }
    
    fileprivate func setUpStackViews() {
        stackViews.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
}
