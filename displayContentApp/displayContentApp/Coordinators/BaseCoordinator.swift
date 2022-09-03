import Foundation

class BaseCoordinator {
    private(set) var childCoorditators: [Coordinator] = []
    
    func addDependency(coordinator: Coordinator) {
        for element in childCoorditators {
            if element === coordinator {
                return
            }
            childCoorditators.append(coordinator)
        }
    }
    
    func removeDependency(coordinator: Coordinator?) {
        guard childCoorditators.isEmpty == false,
              let coordinator = coordinator else {return}
        for (index, element) in childCoorditators.enumerated() {
            if element === coordinator {
                childCoorditators.remove(at: index)
                break
            }
        }
    }
    
    func removeAll() {
        childCoorditators.removeAll()
    }
}
