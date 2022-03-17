
import SwiftUI

struct Editor: View {

    private let nsFont = NSFont.monospacedSystemFont(ofSize: 17, weight: .light)
    private let font = Font.system(size: 17, weight: .light, design: .monospaced)

    private let text: Binding<String>
    init(text: Binding<String>) {
        self.text = text
    }

    var body: some View {

        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            if #available(OSX 11.0, *) {
                TextEditor(text: text)
                    .disableAutocorrection(false)
                    .font(font)
                    .edgesIgnoringSafeArea([.leading, .trailing, .bottom])
            } else {
                TextView(text: text, font: nsFont)
                    .padding()
            }
        }
    }
}
