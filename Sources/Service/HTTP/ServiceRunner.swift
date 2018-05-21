import Kitura

open class ServiceRunner: ServiceRunnable {

    public var mode: RunMode = .production

    private var router: Router?

    open func addRouter(_ router: Router) {
        self.router = router
    }

    open func run(withPort port: Int) throws {
        
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

    open func stop() {
        Kitura.stop()
    }
}