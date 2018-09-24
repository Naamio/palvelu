import Kitura 

/// Manages the dispatch of runners on the service dispatch queue.
open class ServiceDispatch {
    
    open func stop() {
        Kitura.stop()
    }
}

