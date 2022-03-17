
import SwiftUI

struct Editor: View {

    private let font = Font.system(size: 17, weight: .light, design: .monospaced)

    private let text: Binding<String>
    init(text: Binding<String>) {
        self.text = text
    }

    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            TextEditor(text: text)
                .disableAutocorrection(false)
                .font(font)
                .edgesIgnoringSafeArea([.leading, .trailing, .bottom])
        }
    }
}
