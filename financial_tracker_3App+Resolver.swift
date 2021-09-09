import Resolver

extension Resolver: ResolverRegistering {
  public static func registerAllServices() {
    register { TransactionService() }.scope(.application)
    register { CategoryService() }.scope(.application)
  }
}
