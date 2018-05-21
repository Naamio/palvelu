import Kitura 

public protocol ServiceRunnable {

    func addRouter(_ router: Router)

    func run(withPort port: Int) throws

}

public enum ServiceRunnerError: Error {
    case noAvailableRouter
}