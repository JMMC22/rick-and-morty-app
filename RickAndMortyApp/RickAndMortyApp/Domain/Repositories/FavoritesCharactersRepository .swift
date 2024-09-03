//
//  FavoritesCharactersRepository .swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 3/9/24.
//

import Foundation

protocol FavoritesCharactersRepository  {
    func addFavoriteCharacter(id: String) -> Result<Bool, AppError>
    func removeFavoriteCharacter(id: String) -> Result<Bool, AppError>
}
