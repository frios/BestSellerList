//
//  BookImageView.swift
//  The Best Seller List
//
//  Created by Ferdinand Rios on 7/7/22.
//

import SwiftUI

struct BookImageView: View {
    
    var book: NYTBook
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        if book.bookImage != "" {
            AsyncImage(url: URL(string: "\(book.bookImage)")) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .bookImageModifier(width: width, height: height)
                case .failure:
                   // if the bookimage fails, try getting the cover from the open library set of covers
                    AsyncImage(url: URL(string: "https://covers.openlibrary.org/b/isbn/\(book.primaryIsbn13)-M.jpg")) { phase2 in
                        switch phase2 {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .bookImageModifier(width: width, height: height)
                        case .failure:
                            Image(uiImage: UIImage(named: "DefaultBookImage")!)
                                .bookImageModifier(width: width, height: height)
                        @unknown default:
                            Image(uiImage: UIImage(named: "DefaultBookImage")!)
                                .bookImageModifier(width: width, height: height)
                        }
                    }
                @unknown default:
                    Image(uiImage: UIImage(named: "DefaultBookImage")!)
                        .bookImageModifier(width: width, height: height)
                }
            }
        } else {
            AsyncImage(url: URL(string: "https://covers.openlibrary.org/b/isbn/\(book.primaryIsbn13)-M.jpg")) { phase2 in
                switch phase2 {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .bookImageModifier(width: width, height: height)
                case .failure:
                    Image(uiImage: UIImage(named: "DefaultBookImage")!)
                        .bookImageModifier(width: width, height: height)

                @unknown default:
                    Image(uiImage: UIImage(named: "DefaultBookImage")!)
                        .bookImageModifier(width: width, height: height)

                }
            }
        }
    }
}

extension Image {
    func bookImageModifier(width: CGFloat, height: CGFloat) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: width, height: height, alignment: .center)
    }
}
