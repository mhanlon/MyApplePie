import SwiftUI

@available(iOS 14.0, *)
public struct TreeView: View {
    @Binding var guessesRemaining: Int
    
    public init(guessesRemaining: Binding<Int>) {
        self._guessesRemaining = guessesRemaining
    }
    
    public var body: some View {
        Image("Tree \(guessesRemaining)", bundle: Bundle.init(for: ApplePieGameViewModel.self))
            .resizable()
            .scaledToFit()
    }
}



