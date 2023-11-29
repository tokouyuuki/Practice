//
//  ViewController.swift
//  practice
//
//  Created by 都甲裕希 on 2023/11/25.
//

import UIKit

enum Section {
    case main
}

struct ItemModel: Hashable, Sendable, Equatable {
    struct RGB: Hashable, Sendable, Equatable {
        let red: CGFloat
        let blue: CGFloat
        let green: CGFloat
        
        static var mock: RGB {
            .init(red: 0.1, blue: 0.52, green: 0.7)
        }
    }
    let image: String
    let backgroundColor: RGB
    let text: String
    
    static func mock(index: Int) -> ItemModel {
        .init(image: "sample1.jpg", backgroundColor: .mock, text: "\(index)番目まさしまさしまさしまさしまさしまさしまさしまさし")
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    private lazy var dataSource: UICollectionViewDiffableDataSource = {
        return UICollectionViewDiffableDataSource<Section, ItemModel>.init(collectionView: collectionView) { [weak self] collectionView, indexPath, itemIdentifier in
            self?.createCell(index: indexPath.row)
        }
    }()
    private let list: [ItemModel] = [ItemModel.mock(index: 0), ItemModel.mock(index: 1), ItemModel.mock(index: 2), ItemModel.mock(index: 3), ItemModel.mock(index: 4), ItemModel.mock(index: 5), ItemModel.mock(index: 6), ItemModel.mock(index: 7)]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setUpCollectionView() {
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
    }
    
    private func createCell(index: Int) -> UICollectionViewCell {
        
    }
}

