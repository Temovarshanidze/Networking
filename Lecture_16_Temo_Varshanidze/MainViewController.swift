

import UIKit

class MainViewController: UIViewController {
    var selectedIndex: IndexPath?
    let jsonTableView = UITableView()
    var jsonData:[Posts] = []
    //let jsonInfo = jsonBigData
    override func viewDidLoad() {
        super.viewDidLoad()
        callAllFuncs()
    }
    func callAllFuncs() {
        view.backgroundColor = .white
        setUpTableView()
        callAllJasonFuncs()
    }
    
    func setUpTableView() {
        jsonTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(jsonTableView)
        jsonTableView.dataSource = self
        jsonTableView.delegate = self
        jsonTableView.register(JsonCell.self, forCellReuseIdentifier: "JsonCell")
        jsonTableView.backgroundColor = .cyan
        
        
        NSLayoutConstraint.activate([
            jsonTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            jsonTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0),
            jsonTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            jsonTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0)
        ])
    }
    
    func callAllJasonFuncs() {
        //setUpJson()
        setUpJsonWithURL()
    }
    func setUpJson() {
        
        if let data = jsonBigData.data(using: .utf8) {
            do {
                jsonData = try JSONDecoder().decode([Posts].self, from: data)
                jsonTableView.reloadData()
            } catch {
                print(error)
            }
        }
        
    }
    func setUpJsonWithURL() {
        let urlString = "https://jsonplaceholder.typicode.com/posts"
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        let something = URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                self.jsonData = try JSONDecoder().decode([Posts].self, from: data!)
                //  self.jsonTableView.reloadData()
                DispatchQueue.main.async {
                    self.jsonTableView.reloadData()
                }
            } catch {
                print(error)
            }
            
        }
        something.resume()
    }
}

extension MainViewController: UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JsonCell", for: indexPath) as! JsonCell
        let info = jsonData[indexPath.row]
        cell.configure(post: info)
        cell.backgroundColor = UIColor(
            red: CGFloat.random(in: 0.5...1),
            green: CGFloat.random(in: 0.5...1),
            blue: CGFloat.random(in: 0.5...1),
            alpha: 1.0
        )
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = jsonData[indexPath.row]
        let detailVC = CommentsViewController()
        detailVC.urlLink =  "https://jsonplaceholder.typicode.com/posts/\(selectedItem.id)/comments"
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
