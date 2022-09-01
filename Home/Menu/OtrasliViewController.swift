//
//  OtrasliViewController.swift
//  Belarusianlawyers
//
//  Created by Maksimilian on 31.08.22.
//

//
//  OtraslViewController.swift
//  Belarusianlawyers
//
//  Created by Maksimilian on 19.08.22.
//

import UIKit

class OtraslViewController:UIViewController, UITableViewDataSource, UITableViewDelegate {
    var filteredPreset:[String] = ["Авто и ГАИ", "Авторское право","Административное право","Амнистия","Банковское право","Брачный контракт","Образование и распределение","Гражданское право","Жилищное право","Защита прав потребителей","Земельное право","Интеллектуальная собственность","Информационное право","Исполнительное производство","Конституционное право", "Корпоративное право","Медиация","Международное право","Миграционное право (беженцы)","Налоговое право","Наследственное право","Пенсионное обеспечение","Приватизация жилья","Призыв и прохождение воинской службы","Семейное право","Страховое право","Таможенное право","Трудовое право","Уголовное право","Финансовое право","Хозяйственное право","Экономическое право","Оформление наследственных прав граждан РБ по наследствам", "открывшимся за границей,Экономические споры,Недвижимое имущество","Защита прав несовершеннолетних","Банкротство","Спортивное право","Транспортное право","Медицинское право","Защита чести", "достоинства", "деловой репутации","Арбитражные споры","Интеграционное право","Образование и распределение"]
    var filteredforlawyers:[[String]] = []
    let tableView: UITableView = .init()
    weak var delegate: LawyerViewControllerFilterOtraslDelegate?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPreset.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellOtrasli", for: indexPath as IndexPath)
        cell.textLabel?.text = filteredPreset[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.font = UIFont.systemFont(ofSize: 12)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = LawyerViewController()
        detailVC.lawyers = lawyersGlobal.filter { $0[18].contains(filteredPreset[indexPath.row]) }
        detailVC.lawyersFilterSave = lawyersGlobal.filter { $0[18].contains(filteredPreset[indexPath.row]) }
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellOtrasli")
        print(filteredPreset.count)
        tableView.dataSource = self
        tableView.delegate = self
        setup()
        // Do any additional setup after loading the view.
    }
    func setup()
    {
        view.addSubview(tableView)
        self.tableView.rowHeight = 60
        self.tableView.backgroundColor = .clear
        tableView.snp.makeConstraints {
            make in
            make.right.equalToSuperview().inset(10)
            make.left.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(55)
            make.bottom.equalToSuperview().inset(20)
        }
    }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    