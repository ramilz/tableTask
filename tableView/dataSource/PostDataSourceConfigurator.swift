//
//  PostDataSourceConfigurator.swift
//  tableView
//
//  Created by Артем Иревлин on 17.03.2021.
//

import Foundation

final class PostDataSourceConfigurator {
    let imageUrl: String = "https://picsum.photos/400/200"
    let postUrl: String = "https://bash.im/random"
    let imageDouble: String = "https://picsum.photos/200"
    
    func createPosts() -> [PostModelProtocol] {
        return [
            PostModelImage(author: "Vasilii", imagePath: imageUrl, postPath: postUrl),
            PostModelImage(author: "Botiq", imagePath: imageUrl, postPath: postUrl),
            PostModelText(author: "TEXT_dominator", text: """
            Does it rain in California?
            Only dream I've ever known
            Will they love you when you're famous?
            It's where you'll never be alone
            Hope someday I'll find nirvana
            I'll be looking down below
            I'll be dead at twenty-seven
            Only nine more years to go
            I got a bully in my head
            Fake love, fake friends
            I was broken when you left
            Now you hear me everywhere you go
            """
            ),
            PostModelImage(author: "BOT", imagePath: imageUrl, postPath: postUrl),
            PostModelText(author: "Warrior", text: """
            Я солдат.
            Я не спал пять лет и у меня под глазами мешки.
            Я сам не видел, но мне так сказали.
            Я солдат.
            И у меня нет башки,
            Мне отбили её сапогами.
            Ё-ё-ё комбат орёт.
            Разорванный рот у комбата,
            Потому что граната.
            Белая вата, красная вата
            Hе лечит солдата.
            """
            ),
            PostModelImage(author: "I_BOT", imagePath: imageUrl, postPath: postUrl),
            PostModelText(author: "Bot_ONE", text: """
            А муха тоже вертолет,
            Но без коробки передач,
            А по стене ползет пельмень
            И все коленки в огурцах
            Он деревянный, как кирпич
            И волосатый, как трамвай,
            А эта песня про любовь
            И ты ее не забывай.
            """
            ),
            PostModelImage(author: "ImageDominator", imagePath: imageUrl, postPath: postUrl),
            PostModelImage(author: "V_IS_VICTORY", imagePath: imageUrl, postPath: postUrl),
            PostModelImage(author: "RadiTesta", imagePath: imageDouble, postPath: postUrl),
        ]
    }
}
