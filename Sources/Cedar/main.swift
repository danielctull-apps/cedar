
import ArgumentParser

struct Cedar: ParsableCommand {

    @Argument(help: "The file to open.")
    var file: File

    func run() throws {

    }
}

Cedar.main()
