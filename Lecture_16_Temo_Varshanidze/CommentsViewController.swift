

import UIKit

class CommentsViewController: UIViewController {
    
    var urlLink: String?
    let jsonCommnetsTableView = UITableView()
    var jsonData:[Comments] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        callAllFunctions()
        
    }
    private func callAllFunctions() {
        view.backgroundColor = .white
        setUpTableView()
        setUpJsonWithURL()
    }
    
    func setUpTableView() {
        jsonCommnetsTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(jsonCommnetsTableView)
        jsonCommnetsTableView.dataSource = self
        jsonCommnetsTableView.delegate = self
        jsonCommnetsTableView.register(JsonCommentsCell.self, forCellReuseIdentifier: "JsonCommentsCell")
        jsonCommnetsTableView.backgroundColor = .cyan
        
        
        NSLayoutConstraint.activate([
            jsonCommnetsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            jsonCommnetsTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0),
            jsonCommnetsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            jsonCommnetsTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0)
        ])
    }
    
    func setUpJsonWithURL() {
        let urlString = urlLink!
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        let something = URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                self.jsonData = try JSONDecoder().decode([Comments].self, from: data!)
                //  self.jsonTableView.reloadData()
                DispatchQueue.main.async {
                    self.jsonCommnetsTableView.reloadData()
                }
            } catch {
                print(error)
            }
        }
        something.resume()
    }
}

extension CommentsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        jsonData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JsonCommentsCell", for: indexPath) as! JsonCommentsCell
        let info = jsonData[indexPath.row]
        cell.configure(comment: info)
        cell.backgroundColor = UIColor(
            red: CGFloat.random(in: 0.5...1),
            green: CGFloat.random(in: 0.5...1),
            blue: CGFloat.random(in: 0.5...1),
            alpha: 1.0)
        return cell
    }
}
