import SwiftUI
import Combine

class AppState: ObservableObject {
    
    @Published var isLogin = false
    
    func reloadDashboard() {
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.reloadDashboard()
    }
}
