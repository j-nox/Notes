import SwiftUI

struct MainScreen: View {
  var img: String = "https://cs12.pikabu.ru/post_img/2020/01/26/7/og_og_1580037906256995190.jpg"
  var body: some View {
    HStack(alignment:.top) {
      AsyncImage(url: URL(string: "\(img)")) { image in
        image.resizable()
      } placeholder: {
        Color.red
      }
      .frame(width: 300, height: 190)
      .clipShape(RoundedRectangle(cornerRadius: 25))
    }
  }
}
