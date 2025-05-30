

import UIKit

class JsonCell: UITableViewCell {
    let userId: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    let id: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        return label
    }()
    let title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    let body: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           setUpUI()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }

        private func setUpUI() {
               contentView.addSubview(userId)
               contentView.addSubview(id)
               contentView.addSubview(title)
               contentView.addSubview(body)
               
               NSLayoutConstraint.activate([
                userId.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                userId.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
                   
                id.topAnchor.constraint(equalTo: userId.bottomAnchor, constant: 5),
                id.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
                
                title.topAnchor.constraint(equalTo: id.bottomAnchor, constant: 5),
                title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
                  
                   
                body.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5),
                body.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
                body.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
               ])
           }
}

extension JsonCell:JsonInputInfoDelegate  {
  
    
    func configure(post: Posts) {
        userId.text = " UserId: \(post.userId)"
        id.text = "Id: \(post.id)"
        title.text = "Title: \(post.title)"
        body.text = "Body: \(post.body)"
    }
}
