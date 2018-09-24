import Kitura 

/// # ServiceRunnable
///
/// Represents an executable service runtime. This should be
/// a high-level wrapper around a standard HTTP process, with
/// routable capabilities.
public protocol ServiceRunnable {

    var port: Int { get }

    /// Router assigned to the HTTP process.
    var router: Router? { get set }
    
    /// Initializes a new `ServiceRunnable` object with a specified
    /// port. 
    ///
    /// - Parameters:
    ///   - withPort: Port number to use for the runnable process.
    ///
    init(withPort port: Int)
}