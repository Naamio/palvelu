import Kitura

open class ServiceRunner: ServiceRunnable {

    private var router: Router?

    public init() {

    }

    open func addRouter(_ router: Router) {
        self.router = router
    }

    open func run(withPort port: Int) throws {
        guard let router = router else {
            throw ServiceRunnerError.noAvailableRouter
        }

        Kitura.addHTTPServer(onPort: port, with: router)
        // start the framework - the servers added until now will start listening
        Kitura.run()
    }

    open func stop() {
        Kitura.stop()
    }

    public func test(withPort port: Int) throws {
        guard let router = router else {
            throw ServiceRunnerError.noAvailableRouter
        }

        Kitura.addHTTPServer(onPort: port, with: router)
        Kitura.start()
    }
}