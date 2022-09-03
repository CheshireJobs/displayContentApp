import UIKit

final class PhotoTableViewCell: UITableViewCell {
    let photoImageView: UIImageView = {
        let photoImageView = UIImageView()
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.contentMode = .scaleToFill
        return photoImageView
    }()
    
    let photoNameLabel: UILabel = {
        let photoNameLabel = UILabel()
        photoNameLabel.translatesAutoresizingMaskIntoConstraints = false
        photoNameLabel.textColor = .black
        photoNameLabel.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        photoNameLabel.numberOfLines = 0
        return photoNameLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension PhotoTableViewCell {
    func setupConstraints() {
        contentView.addSubview(photoImageView)
        contentView.addSubview(photoNameLabel)
        
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            photoImageView.heightAnchor.constraint(equalToConstant: 134),
            photoImageView.widthAnchor.constraint(equalToConstant: 134),
            
            photoNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            photoNameLabel.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 20),
            photoNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6),
            photoNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant:  -6)
        ])
    }
}
