import UIKit

class PhotoListViewController: UIViewController, UINavigationControllerDelegate {
    
    private let photoListView = PhotoListView()
    private var imagePickerController = UIImagePickerController()
    private var fileManager = FileManagerService.shared
    
    private lazy var addPhotoButton: UIBarButtonItem = {
        var addPhotoButton = UIBarButtonItem(title: "Добавить фотографию", style: .done, target: self, action: #selector(addPhoto))
        return addPhotoButton
    }()
    
    @objc func addPhoto() {
        present(imagePickerController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoListView.photoTableView.dataSource = self
        photoListView.photoTableView.register(PhotoTableViewCell.self, forCellReuseIdentifier: String(describing: PhotoTableViewCell.self))
        imagePickerController.delegate = self
        navigationItem.rightBarButtonItem = addPhotoButton
    }
    
    override func loadView() {
        super.loadView()
        view = photoListView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension PhotoListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fileManager.content.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PhotoTableViewCell.self), for: indexPath) as! PhotoTableViewCell
        cell.photoImageView.image = fileManager.content[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            fileManager.removeFromDocumets(index: indexPath.row)
            tableView.reloadData()
        }
    }
}

extension PhotoListViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }
        guard let infoPath = info[.imageURL] as? URL else { return }
        fileManager.saveToDocumets(image: image, name: infoPath.lastPathComponent)
        photoListView.reloadData()
        dismiss(animated: true)
    }
}
