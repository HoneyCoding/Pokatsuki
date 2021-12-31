//
//  ViewController.swift
//  Pokatsuki
//
//  Created by 김진태 on 2021/12/26.
//

import UIKit

// MARK: - Property and Initializer
class MainViewController: UIViewController {

    private var memberList = [Member]()
    @IBOutlet weak var tableView: UITableView!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupMemberList()
    }
    
    private func setupMemberList() {
        let memberList = [
            Member(name: "윤원상",
                   description: "ㅈㅌ형 제발 구원좀 이러다다죽어~",
                   imageAssetName: AssetName.Image.wonsangProfile),
            Member(name: "김진태",
                   description: """
                                ?????????????????????????????
                                나 뭔가 했어?!
                                """),
            Member(name: "문건하",
                   description: "메이플해야됨ㅅㄱ"),
            Member(name: "박경호",
                   description: "@이후영 라프텔이라는 서비스 들어봤어?",
                   imageAssetName: AssetName.Image.gyeonghoProfile),
            Member(name: "이후영",
                   description: "그걸 어디서 듣고 온 거야 ㄷ"),
            Member(name: "누리",
                   description: "ㅎㅇㅂㅂ",
                   imageAssetName: AssetName.Image.nuriProfile),
        ]
        let repeatedMemberList = Array(repeating: memberList, count: 5).flatMap { $0 }
        self.memberList = repeatedMemberList
    }
}

// MARK: - ViewController Lifecycle
extension MainViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
}

// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as? MainTableViewCell else {
            return tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath)
        }
        let member = memberList[indexPath.row]
        cell.nameText = member.name
        cell.descriptionText = member.description
//        if cell.isSelected {
//            tableView.deselectRow(at: indexPath, animated: false)
//        }
        if let imageAssetName = member.imageAssetName {
            cell.profileImage = UIImage(named: imageAssetName)
        } else {
            cell.profileImage = nil
        }
        return cell
    }
}

// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

// MARK: - Segue
extension MainViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DetailViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let member = memberList[indexPath.row]
        destination.member = member
    }
}


