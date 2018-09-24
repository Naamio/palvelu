import Kitura

extension ServiceDispatch: ServiceDelegate {
    public func addRunner(_ runner: ServiceRunnable) {
        guard let router = runner.router else {
            return
            //throw ServiceRunnerError.noAvailableRouter
        }

        Kitura.addHTTPServer(onPort: runner.port, with: router)
    }

    public func run() throws {
        // start the framework - the servers added until now will start listening
        Kitura.run()
    }
}