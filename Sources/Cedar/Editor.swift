
import SwiftUI

struct Editor: View {

    private let font = NSFont.monospacedSystemFont(ofSize: 17, weight: .light)

    @State private var isEditing = false
    @State private var text = ""

    var body: some View {

        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            TextView(text: $text, font: font)
                .padding()
        }
    }
}
