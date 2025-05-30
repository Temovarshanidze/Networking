

import UIKit

class JsonCommentsCell: UITableViewCell {
    
    let postId: UILabel = {
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
    let name: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    let email: UILabel = {
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
        contentView.addSubview(postId)
        contentView.addSubview(id)
        contentView.addSubview(name)
        contentView.addSubview(email)
        contentView.addSubview(body)
        
        NSLayoutConstraint.activate([
            postId.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            postId.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            
            id.topAnchor.constraint(equalTo: postId.bottomAnchor, constant: 5),
            id.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            
            name.topAnchor.constraint(equalTo: id.bottomAnchor, constant: 5),
            name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            
            email.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 5),
            email.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            
            
            body.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 5),
            body.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            body.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
}

extension JsonCommentsCell: JsonCommentDelegate {
    func configure(comment: Comments) {
        postId.text = " Post Id: \(comment.postId)"
        id.text = "Id: \(comment.id)"
        name.text = "Name: \(comment.name)"
        email.text = "Email: \(comment.email)"
        body.text = "Body: \(comment.body)"
    }
}
