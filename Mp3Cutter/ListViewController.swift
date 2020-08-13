//
//  ListViewController.swift
//  Mp3Cutter
//
//  Created by Chac Ngo Dang on 8/11/20.
//  Copyright © 2020 Chac Ngo Dang. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class ListViewController: UIViewController {
    
    private let viewSearch = UIView()
    private let tfSearch = UITextField()
    private let tableView = UITableView()
    private let btnAction = UIButton()
    var mainColor : UIColor? = UIColor.red.withAlphaComponent(0.5)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
}

/*
 @objc func
 */
extension ListViewController {
    @objc func actSearch(){
        self.view.endEditing(true)
    }
}

extension ListViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ItemTableViewCell.cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.id, for: indexPath) as! ItemTableViewCell
        cell.selectionStyle = .none
        cell.bind(title: "Name.mp3", sub: "Kích thước: 5MB", checkColor: mainColor, showCheck: true)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        (tableView.cellForRow(at: indexPath) as? ItemTableViewCell)?.checkOn()
    }
}

extension ListViewController {
    func setupUI(){
        self.view.backgroundColor = .white
        self.view.addSubview(viewSearch)
        viewSearch.snp.makeConstraints({
            $0.top.centerX.width.equalToSuperview()
            $0.height.equalTo(72)
        })
        viewSearch.backgroundColor = mainColor
        let vSearch = UIView()
        viewSearch.addSubview(vSearch)
        vSearch.snp.makeConstraints({
            $0.width.equalToSuperview().offset(-16)
            $0.height.equalToSuperview().offset(-32)
            $0.bottom.equalToSuperview().offset(-8)
            $0.centerX.equalToSuperview()
//            $0.width.equalToSuperview().multipliedBy(0.8)
        })
        vSearch.layer.cornerRadius = 18
        vSearch.backgroundColor = UIColor.white
        vSearch.addSubview(tfSearch)
        tfSearch.snp.makeConstraints({
            $0.centerY.height.equalToSuperview()
            $0.leading.equalToSuperview().offset(22)
        })
        tfSearch.textColor = .white
        tfSearch.placeholder = "Nhập từ khoá tìm kiếm"
        let btnSearch = UIButton()
        btnSearch.setImage(UIImage(named: "ic_cut")?.withRenderingMode(.alwaysTemplate).withTintColor(.white), for: .normal)
        vSearch.addSubview(btnSearch)
        btnSearch.snp.makeConstraints({
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(tfSearch.snp.trailing).offset(4)
            $0.height.equalToSuperview().multipliedBy(-8)
            $0.trailing.equalToSuperview().offset(-4)
            $0.width.equalTo(btnSearch.snp.height)
        })
        btnSearch.imageView?.contentMode = .scaleAspectFit
        btnSearch.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.actSearch)))
        
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: ItemTableViewCell.id)
        tableView.separatorInset = .zero
        tableView.tableFooterView = UIView()
        tableView.snp.makeConstraints({
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(viewSearch.snp.bottom)
        })
        
        self.view.addSubview(btnAction)
        btnAction.snp.makeConstraints({
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-42)
            $0.height.equalTo(42)
            $0.top.equalTo(tableView.snp.bottom).offset(28)
            $0.width.equalTo(btnAction.snp.height).multipliedBy(3.5)
        })
        btnAction.layer.cornerRadius = 4
        btnAction.backgroundColor = mainColor
        btnAction.setTitle("Action", for: .normal)
        btnAction.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
    }
}
