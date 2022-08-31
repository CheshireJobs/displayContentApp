import UIKit

final class PhotoTableViewCell: UITableViewCell {
    
    let photoImageView: UIImageView = {
        let photoImageView = UIImageView()
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.contentMode = .scaleAspectFit
        return photoImageView
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
        
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),
            photoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            photoImageView.heightAnchor.constraint(equalToConstant: 134)
        ])
    }
}
