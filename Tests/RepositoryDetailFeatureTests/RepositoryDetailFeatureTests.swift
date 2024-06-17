import ComposableArchitecture
import Entity
import XCTest

@testable import RepositoryDetailFeature

final class RepositoryDetailFeatureTests: XCTestCase {
  @MainActor
  func testRepositoryIsFavorited() async {
    let repository = Repository.mock(id: 1)
    @Shared(.favoriteRepositories) var favoriteRepositories = [
      repository
    ]

    let store = TestStore(
      initialState: RepositoryDetail.State(
        repository: repository
      )
    ) {
      RepositoryDetail()
    }

    await store.send(.onAppear) {
      $0.isFavoriteRepository = true
    }
    
    await store.send(.favoriteButtonTapped) {
      $0.favoriteRepositories = []
      $0.isFavoriteRepository = false
    }
  }
  
  @MainActor
  func testRepositoryIsNotFavorited() async {
    @Shared(.favoriteRepositories) var favoriteRepositories = []

    let store = TestStore(
      initialState: RepositoryDetail.State(
        repository: .mock(id: 1)
      )
    ) {
      RepositoryDetail()
    }

    await store.send(.onAppear)
    
    await store.send(.favoriteButtonTapped) {
      $0.favoriteRepositories = [
        .mock(id: 1)
      ]
      $0.isFavoriteRepository = true
    }
  }
}
