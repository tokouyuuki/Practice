//
//  ViewController.swift
//  practice
//
//  Created by 都甲裕希 on 2023/11/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var campaignLavel: UILabel!
    @IBOutlet weak var imageScrollView: UIScrollView!
    @IBOutlet weak var wholeScroll: UIScrollView!
    
    let numberOfPickUpContents = 8
    let pickUpContentColorList: [UIColor] = [.yellow, .gray, .red, .blue, .brown, .green, .systemPink, .systemOrange]
    let pickUpScrollViewPadding: CGFloat = 70
    let pickUpContentPadding:CGFloat = 60
    let pickUpViewHeight: CGFloat = 200
    let pickUpContentWidth:CGFloat = 170
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPickUpScrollView()
        // Do any additional setup after loading the view.
    }
    
    func createPickUpScrollView() {
        // ScrollView生成
        let pickUpScrollView = UIScrollView()
        pickUpScrollView.contentInset = UIEdgeInsets(top: 0, left: pickUpScrollViewPadding, bottom: 0, right: 10)
        pickUpScrollView.translatesAutoresizingMaskIntoConstraints = false
        wholeScroll.addSubview(pickUpScrollView)
        
        // ScrollViewに必要な全体のViewを生成
        let pickUpView = UIView()
        let pickUpViewWidth = (pickUpContentWidth + pickUpContentPadding) * CGFloat(numberOfPickUpContents) - pickUpContentPadding
        pickUpView.translatesAutoresizingMaskIntoConstraints = false
        pickUpScrollView.addSubview(pickUpView)
        
        // Contentを生成
        for index in 0..<numberOfPickUpContents {
            let pickUpContent = createPickUpContent(pickUpContentIndex: index)
            pickUpView.addSubview(pickUpContent)
        }
        
        
        NSLayoutConstraint.activate([
            // スクロールビューの制約
            pickUpScrollView.topAnchor.constraint(equalTo: imageScrollView.safeAreaLayoutGuide.bottomAnchor, constant: 30),
            pickUpScrollView.trailingAnchor.constraint(equalTo: wholeScroll.safeAreaLayoutGuide.trailingAnchor),
            pickUpScrollView.leadingAnchor.constraint(equalTo: wholeScroll.safeAreaLayoutGuide.leadingAnchor),
            pickUpScrollView.bottomAnchor.constraint(equalTo: campaignLavel.safeAreaLayoutGuide.topAnchor, constant: -30),
            pickUpScrollView.widthAnchor.constraint(equalToConstant: pickUpViewWidth),
            pickUpScrollView.heightAnchor.constraint(equalToConstant: pickUpViewHeight),
            
            // containerViewの制約
            pickUpView.topAnchor.constraint(equalTo: pickUpScrollView.contentLayoutGuide.topAnchor),
            pickUpView.trailingAnchor.constraint(equalTo: pickUpScrollView.contentLayoutGuide.trailingAnchor),
            pickUpView.leadingAnchor.constraint(equalTo: pickUpScrollView.contentLayoutGuide.leadingAnchor),
            pickUpView.bottomAnchor.constraint(equalTo: pickUpScrollView.contentLayoutGuide.bottomAnchor),
            pickUpView.widthAnchor.constraint(equalToConstant: pickUpViewWidth),
            pickUpView.heightAnchor.constraint(equalToConstant: pickUpViewHeight),
            
        ])
    }
    
    func createPickUpContent(pickUpContentIndex: Int) -> UIView {
        let pickUpContent = UIView()
        let positionX = (pickUpContentWidth + pickUpContentPadding) * CGFloat(pickUpContentIndex)
        let position = CGPoint(x: positionX, y: 0)
        let contentSize = CGSize(width: pickUpContentWidth, height: pickUpViewHeight)
        pickUpContent.frame = CGRect(origin: position, size: contentSize)
        pickUpContent.backgroundColor = pickUpContentColorList[pickUpContentIndex]
        
        let topContent = UIView()
        let topContentSize = CGSize(width: 154, height: 50)
        topContent.backgroundColor = .white
        topContent.frame = CGRect(origin: .zero, size: topContentSize)
        topContent.translatesAutoresizingMaskIntoConstraints = false
        let image: UIImage = UIImage(named: "sample1.jpg")!
        let imageView = UIImageView(image: image)
        let rect: CGRect = CGRect(x: 50, y: 10, width: 50, height: 50)
        imageView.frame = rect
        topContent.addSubview(imageView)
        pickUpContent.addSubview(topContent)
        
        let text =  "山口まさし山口まさし山口まさし山口まさし山口まさし"
        let textLabel: UILabel = UILabel()
        textLabel.frame = CGRect(x: 10, y: 80, width: 154, height: 90)
        textLabel.numberOfLines = 0
        textLabel.text = text.count > 24 ? String(text.prefix(24) + "...") : text
        pickUpContent.addSubview(textLabel)
        
        
        NSLayoutConstraint.activate([
            topContent.topAnchor.constraint(equalTo: pickUpContent.topAnchor, constant: 8),
            topContent.leadingAnchor.constraint(equalTo: pickUpContent.leadingAnchor, constant: 8),
            topContent.rightAnchor.constraint(equalTo: pickUpContent.rightAnchor, constant: -8),
            topContent.widthAnchor.constraint(equalToConstant: 154),
            topContent.heightAnchor.constraint(equalToConstant: 70)
        ])
        return pickUpContent
    }
}

