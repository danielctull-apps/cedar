// Inspired by Thiago Holanda
// https://gist.github.com/unnamedd/6e8c3fbc806b8deb60fa65d6b9affab0

import AppKit
import SwiftUI

struct TextView: View {

    private var text: Binding<String>
    private let font: NSFont

    init(text: Binding<String>, font: NSFont = .systemFont(ofSize: NSFont.systemFontSize)) {
        self.text = text
        self.font = font
    }

    var body: some View {
        Representable(text: text, font: font)
    }
}

private struct Representable: NSViewRepresentable {

    @Binding var text: String
    let font: NSFont

    func makeCoordinator() -> Coordinator {
        Coordinator(text: $text)
    }

    func makeNSView(context: Context) -> ScrollingTextView {
        let textView = ScrollingTextView(font: font)
        textView.text = text
        textView.delegate = context.coordinator
        return textView
    }

    func updateNSView(_ view: ScrollingTextView, context: Context) {
        view.text = text
        view.textView.setSelectedRange(NSRange(location: 0, length: 0))
    }
}

extension Representable {

    fileprivate class Coordinator: NSObject, NSTextViewDelegate {

        var text: Binding<String>
        init(text: Binding<String>) {
            self.text = text
        }

        func textDidChange(_ notification: Notification) {
            guard let textView = notification.object as? NSTextView else { return }
            text.wrappedValue = textView.string
        }
    }
}

private final class ScrollingTextView: NSView {

    let textView: NSTextView
    weak var delegate: NSTextViewDelegate? {
        get { textView.delegate }
        set { textView.delegate = newValue }
    }
    var text: String {
        get { textView.string }
        set { textView.string = newValue }
    }

    init(font: NSFont) {

        let scrollView = NSScrollView()
        scrollView.drawsBackground = true
        scrollView.borderType = .noBorder
        scrollView.hasVerticalScroller = true
        scrollView.hasHorizontalRuler = false
        scrollView.autoresizingMask = [.width, .height]
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        let contentSize = scrollView.contentSize
        let textStorage = NSTextStorage()

        let layoutManager = NSLayoutManager()
        textStorage.addLayoutManager(layoutManager)


        let textContainer = NSTextContainer(containerSize: scrollView.frame.size)
        textContainer.widthTracksTextView = true
        textContainer.containerSize = NSSize(width: contentSize.width,
                                             height: CGFloat.greatestFiniteMagnitude)

        layoutManager.addTextContainer(textContainer)

        textView = NSTextView(frame: .zero, textContainer: textContainer)
        textView.autoresizingMask = .width
        textView.backgroundColor = .textBackgroundColor
        textView.drawsBackground = true
        textView.font = font
        textView.isRichText = false
        textView.isEditable = true
        textView.isHorizontallyResizable = false
        textView.isVerticallyResizable  = true
        textView.isContinuousSpellCheckingEnabled = true
        textView.maxSize = NSSize(width: CGFloat.greatestFiniteMagnitude,
                                  height: CGFloat.greatestFiniteMagnitude)
        textView.minSize = NSSize(width: 0, height: contentSize.height)
        textView.textColor = .labelColor

        super.init(frame: .zero)

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        scrollView.documentView = textView
    }

    override func viewDidMoveToWindow() {
        window?.makeFirstResponder(textView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
