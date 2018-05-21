import Kitura

open class ServiceRunner: ServiceRunnable {

    public var mode: RunMode = .production

    private var router: Router?

    public func addRouter(_ router: Router) {
        self.router = router
    }

    public func run(withPort port: Int) throws {
        
        guard let router = router else {
            throw ServiceRunnerError.noAvailableRouter
        }

        Kitura.addHTTPServer(onPort: port, with: router)

        if mode == .test {
            Kitura.start()
        } else {
            // start the framework - the servers added until now will start listening
            Kitura.run()
        }
    }

    public func stop() {
        Kitura.stop()
    }
}