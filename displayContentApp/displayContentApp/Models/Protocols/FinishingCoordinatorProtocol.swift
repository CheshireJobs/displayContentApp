import Foundation

protocol FinishingCoordinator: Coordinator {
    var onFinish: (() -> Void)? {get set}
}
